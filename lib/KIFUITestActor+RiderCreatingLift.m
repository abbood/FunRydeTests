//
//  KIFUITestActor+RiderCreatingLift.m
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/24/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import "KIFUITestActor+RiderCreatingLift.h"

static NSString* const kMapTableIdentifier = @"MapSearch Table";

@implementation KIFUITestActor (RiderCreatingLift)

- (void)riderCreateslift {
    
    [self riderChosesPickUpLocation];
    [self riderChosesDropOffDestination];
    
  //  [self tapViewWithAccessibilityLabel:@"Request Lift"];
}

- (void)riderChosesPickUpLocation {
    [self waitForViewWithAccessibilityLabel:@"map set pickup location button"];
    [self tapViewWithAccessibilityLabel:@"map set pickup location button"];
    
    [self waitForViewWithAccessibilityLabel:@"map search bar"];
    [self tapViewWithAccessibilityLabel:@"map search bar"];
    
    [self enterTextIntoCurrentFirstResponder:@"tripoli\n"];
    [self waitForViewWithAccessibilityLabel:@"search result cell"];
    
    [self tapRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] inTableViewWithAccessibilityIdentifier:kMapTableIdentifier];
    [self waitForViewWithAccessibilityLabel:@"Set Destination"];
}

- (void)riderChosesDropOffDestination {
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


@end
