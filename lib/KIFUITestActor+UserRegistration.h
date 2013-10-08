//
//  KIFUITestActor+UserRegistration.h
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/21/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import <KIF/KIF.h>

typedef void (^additionalStepCallback)(void);

@interface KIFUITestActor (UserRegistration)

- (void)singleUserRegistration;
- (void)allUsersRegistration;
- (void)registerUsersFromList:(NSArray *)users additionalStepPerUser:(additionalStepCallback)additionalStep;

// ie for a scenario with two different users
- (void)user_A_registration;
- (void)user_B_registration;

- (void)login;

- (void)loginAsUser_A;
- (void)loginAsUser_B;

- (void)showUserCurrentLocationOnMap;
- (void)showMenuButton;
- (void)showsPickUpButton;
    
@end
