//
//  KIFUITestActor+UserRegistration.m
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/21/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import "KIFUITestActor+UserRegistration.h"
#import "KIFUITestActor+EXAdditions.h"
#import "DataGenerator.h"

typedef void (^additionalStepCallback)(void);

@implementation KIFUITestActor (UserRegistration)

- (void)singleUserRegistration {
    NSDictionary *sampleUserData = [DataGenerator sampleUserData];
    [self performRegistration:sampleUserData];
}

- (void)allUsersRegistration {
    for (NSDictionary *sampleUserData in [DataGenerator massSampleUsersData]) {
        [self reset];
        [self navigateToLoginPage];
        [self performRegistration:sampleUserData];
    }
}

- (void)user_A_registration {
    [self performRegistration:[DataGenerator user_A_sampleData]];
}

- (void)user_B_registration {
    [self performRegistration:[DataGenerator user_B_sampleData]];
}

- (void)registerUsersFromList:(NSArray *)users additionalStepPerUser:(additionalStepCallback)additionalStep {
    for (NSDictionary *user in users) {
        [self reset];
        [self performRegistration:user];
        
        if (additionalStep) {
            additionalStep();
        }
    }
}

- (void)performRegistration:(NSDictionary *)sampleUserData {
    [self tapViewWithAccessibilityLabel:@"login register button"];
    [self waitForTappableViewWithAccessibilityLabel:@"registration register button"];
    [self enterText:sampleUserData[@"email"] intoViewWithAccessibilityLabel:@"registration email"];
    [self enterText:sampleUserData[@"password"] intoViewWithAccessibilityLabel:@"registration password"];
    [self enterText:sampleUserData[@"password"] intoViewWithAccessibilityLabel:@"registration password confirmation"];
    
    [self enterText:sampleUserData[@"fname"] intoViewWithAccessibilityLabel:@"registration first name"];
    [self enterText:sampleUserData[@"lname"] intoViewWithAccessibilityLabel:@"registration last name"];
    [self enterText:sampleUserData[@"age"] intoViewWithAccessibilityLabel:@"registration age"];
    
    [self tapViewWithAccessibilityLabel:@"registration register button"];
    
    [self waitForViewWithAccessibilityLabel:@"menu button"];
    
}

- (void)login {
    NSDictionary *sampleUserData = [DataGenerator sampleUserData];
    [self login:sampleUserData];
}

- (void)login:(NSDictionary *)sampleUserData {
    [self waitForViewWithAccessibilityLabel:@"login email"];
    [self enterText:sampleUserData[@"email"] intoViewWithAccessibilityLabel:@"login email"];
    [self enterText:sampleUserData[@"password"] intoViewWithAccessibilityLabel:@"login password"];
    [self tapViewWithAccessibilityLabel:@"login login button"];
    
    // Verify that the login succeeded
    // and that they have arrived in the rider map
    [self waitForViewWithAccessibilityLabel:@"menu button"];
    
}

- (void)loginAsUser_A {
    [self login:[DataGenerator user_A_sampleData]];
}

- (void)loginAsUser_B {
    [self login:[DataGenerator user_B_sampleData]];
}

- (void)showUserCurrentLocationOnMap {
    [self waitForViewWithAccessibilityLabel:@"Current Location"];
}

- (void)showMenuButton {
    [self waitForViewWithAccessibilityLabel:@"menu button"];
}

- (void)showsPickUpButton {
    [self waitForViewWithAccessibilityLabel:@"map set pickup location button"];
}

@end
