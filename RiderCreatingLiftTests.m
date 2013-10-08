//
//  RiderCreatingLiftTests.m
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/24/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import <KIF/KIF.h>
#import "KIFUITestActor+EXAdditions.h"
#import "KIFUITestActor+UserRegistration.h"
#import "KIFUITestActor+RiderCreatingLift.h"

@interface RiderCreatingLiftTests : KIFTestCase

@end


@implementation RiderCreatingLiftTests

/*
 * - feature
 * in order for the user to get a ride
 * they must create a lift
 * specifying their pickup location and destination
 * 
 *
 * - background
 * @given user has already registered and logged in as a rider
 * @and they are ready to get a lift for a ride
 */

/*
 * - scenario: user creates lift
 * @when rider chose pick up destination
 * @and rider chose drop off destination
 * @then rider clicks on create lift button and creates lift
 */
- (void)testRiderCreatingLift {
    [tester showUserCurrentLocationOnMap];
    [tester showsPickUpButton];
    [tester riderCreatesliftBySearch];
}

- (void)testUser_A_creatingLiftBySearch {
    [tester reset];
    [tester loginAsUser_A];
    [tester showsPickUpButton];
    [tester riderCreatesliftBySearch];
}

- (void)testUser_B_creatingLiftBySearch {
    [tester reset];
    [tester loginAsUser_B];
    [tester showsPickUpButton];
    [tester riderCreatesliftBySearch];
}

- (void)testLoggedInUserCreatingLiftBySearch {
    [tester showsPickUpButton];
    [tester riderCreatesliftBySearch];
}

- (void)testUser_A_creatingLiftByPanning {
    [tester reset];
    [tester loginAsUser_A];
    [tester showsPickUpButton];
    [tester riderCreatesliftByPanning];
}

- (void)testUser_B_creatingLiftByPanning {
    [tester reset];
    [tester loginAsUser_B];
    [tester showsPickUpButton];
    [tester riderCreatesliftByPanning];
}

- (void)testLoggedInUserCreatingLiftByPanning {
    [tester showsPickUpButton];
    [tester riderCreatesliftByPanning];
}

@end
