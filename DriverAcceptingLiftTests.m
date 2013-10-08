//
//  DriverAcceptingLiftTests.m
//  FunRyde
//
//  Created by Abdullah Bakhach on 10/5/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import <KIF/KIF.h>
#import <SenTestingKit/SenTestingKit.h>
#import "KIFUITestActor+EXAdditions.h"
#import "KIFUITestActor+UserRegistration.h"
#import "KIFUITestActor+SettingsPage.h"
#import "Constants.h"

@interface DriverAcceptingLiftTests : KIFTestCase

/*
 * - feature
 * the driver views available lifts in
 * the nearby area, views the information
 * about the riders, then accepts to give
 * a ride to one of them, and starts the journey
 */

@end

@implementation DriverAcceptingLiftTests

/*
 * - background
 * // done previously
 * @given rider (user A) has already created lift
 * @and current user (user B) has been promoted to a driver
 *
 * // done now
 * @and user B is already logged in
 * @and user B is in driver mode
 * @and user B is on the main map
 */
- (void)beforeAll {
    //[tester reset];
    //[tester loginAsUser_B];
    [tester tapOnMenuButton];
    [tester switchDriverModeOn:YES];
    [tester tapOnMenuButton];
}



/*
 * - scenario: driver views available lifts
 * @when current user B sets the 'driver' mode
 * @and they tap on the menu button to view map
 * @then they see available lifts
 */
- (void)testDriver_B_ViewingAvailableLifts {
    // allow some time for the service call
    // TODO: you should put a spinner
    [system waitForTimeInterval:3];
    [tester waitForViewWithAccessibilityLabel:kAccessibilityRiderAnnotation value:kAccessibilityRiderAnnotation traits:UIAccessibilityTraitNone];
    [tester tapViewWithAccessibilityLabel:kAccessibilityRiderAnnotation value:kAccessibilityRiderAnnotation traits:UIAccessibilityTraitNone];
    [system waitForTimeInterval:1];
    
    [tester waitForTappableViewWithAccessibilityLabel:kAccessibilityRiderAnnotationRightButton];
    [tester tapViewWithAccessibilityLabel:kAccessibilityRiderAnnotationRightButton];
    [system waitForTimeInterval:1];
    
    [tester waitForTappableViewWithAccessibilityLabel:kAccessibilityRiderAcceptRideButton];
    [tester tapViewWithAccessibilityLabel:kAccessibilityRiderAcceptRideButton];
    [system waitForTimeInterval:1];
    
    [tester waitForTappableViewWithAccessibilityLabel:kAccessibilityRiderStartJourneyButton];
    [tester tapViewWithAccessibilityLabel:kAccessibilityRiderStartJourneyButton];
    
    [system waitForTimeInterval:1];
    
    [tester waitForTappableViewWithAccessibilityLabel:kAccessibilityRiderEndJourneyButton];
    [tester tapViewWithAccessibilityLabel:kAccessibilityRiderEndJourneyButton];
}




@end
