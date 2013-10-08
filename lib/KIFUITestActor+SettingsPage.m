//
//  KIFUITestActor+SettingsPage.m
//  FunRyde
//
//  Created by Abdullah Bakhach on 10/5/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import "KIFUITestActor+SettingsPage.h"

@implementation KIFUITestActor (SettingsPage)

- (void)tapOnMenuButton {
    [self waitForViewWithAccessibilityLabel:@"menu button"];
    [self tapViewWithAccessibilityLabel:@"menu button"];
}

- (void)switchDriverModeOn:(BOOL)switchIsOn {
    [self waitForViewWithAccessibilityLabel:@"driver mode switch"];
    [self setOn:switchIsOn forSwitchWithAccessibilityLabel:@"driver mode switch"];
}

@end
