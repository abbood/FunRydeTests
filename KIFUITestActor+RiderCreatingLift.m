//
//  KIFUITestActor+RiderCreatingLift.m
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/24/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import "KIFUITestActor+RiderCreatingLift.h"

static NSString* const kMapTableIdentifier = @"MapSearch Table";
static NSString* const kMapViewControllerMap = @"map view controller map";
static NSString* const kPickupPinButton = @"map set pickup pin button";
static NSString* const kDropoffPinButton = @"Set Destination pin button";

@implementation KIFUITestActor (RiderCreatingLift)

- (void)riderCreatesliftBySearch {
    
    [self riderChosesPickUpLocationBySearch];
    [self riderChosesDropOffDestinationBySearch];
    
  //  [self tapViewWithAccessibilityLabel:@"Request Lift"];
}

- (void)riderChosesPickUpLocationBySearch {
    [self waitForViewWithAccessibilityLabel:@"map set pickup location button"];
    [self tapViewWithAccessibilityLabel:@"map set pickup location button"];
    
    [self waitForViewWithAccessibilityLabel:@"map search bar"];
    [self tapViewWithAccessibilityLabel:@"map search bar"];
    
    [self enterTextIntoCurrentFirstResponder:@"tripoli lebanon\n"];
    [self waitForViewWithAccessibilityLabel:@"search result cell"];
    
    [self tapRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] inTableViewWithAccessibilityIdentifier:kMapTableIdentifier];
    [self waitForViewWithAccessibilityLabel:@"Set Destination"];
}

- (void)riderChosesDropOffDestinationBySearch {
    [self waitForViewWithAccessibilityLabel:@"Set Destination"];
    [self tapViewWithAccessibilityLabel:@"Set Destination"];
    
    [self waitForViewWithAccessibilityLabel:@"map search bar"];
    [self tapViewWithAccessibilityLabel:@"map search bar"];
    
    [self waitForTappableViewWithAccessibilityLabel:@"Clear text"];
    [self tapViewWithAccessibilityLabel:@"Clear text"];
    
    [self enterTextIntoCurrentFirstResponder:@"beirut\n"];
    [self waitForViewWithAccessibilityLabel:@"search result cell"];
    
    [self tapRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] inTableViewWithAccessibilityIdentifier:kMapTableIdentifier];
    
    [self waitForTappableViewWithAccessibilityLabel:@"Request Lift"];
    [self tapViewWithAccessibilityLabel:@"Request Lift"];
    
    [self waitForViewWithAccessibilityLabel:@"waiting for driver"];
}

- (void)riderCreatesliftByPanning {
    
    [self riderChosesPickUpLocationByPanning];
    [self riderChosesDropOffDestinationByPanning];
}

- (void)riderChosesPickUpLocationByPanning {
    [self waitForViewWithAccessibilityLabel:kMapViewControllerMap];
    [self swipeViewWithAccessibilityLabel:kMapViewControllerMap inDirection:KIFSwipeDirectionRight];
    [self waitForTimeInterval:3];
    [self tapViewWithAccessibilityLabel:kPickupPinButton];
    
}

- (void)riderChosesDropOffDestinationByPanning {
    [self waitForViewWithAccessibilityLabel:kMapViewControllerMap];
    [self swipeViewWithAccessibilityLabel:kMapViewControllerMap inDirection:KIFSwipeDirectionUp];
    [self waitForTimeInterval:3];
    [self tapViewWithAccessibilityLabel:kDropoffPinButton];
    
    [self waitForTappableViewWithAccessibilityLabel:@"Request Lift"];
    [self tapViewWithAccessibilityLabel:@"Request Lift"];
    
    [self waitForViewWithAccessibilityLabel:@"waiting for driver"];
}


@end
