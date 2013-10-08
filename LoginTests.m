//
//  LoginTests.m
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/20/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import <KIF/KIF.h>
#import "KIFUITestActor+EXAdditions.h"

#import "KIFUITestActor+UserRegistration.h"

@interface LoginTests : KIFTestCase

@end


@implementation LoginTests

- (void)testClientReset {
    [tester reset];
}

- (void)testServerReset {
    [tester flushDbase];
    [tester reset];
}

/* @given that the app is in a fresh clean state
 @and   that no one has ever registered with the server
 
 @then  the user can register their themselves with the server
 @and   immediately start with the rider's map
 @and   their location on the map shows
 */

- (void)testRegistration
{
    [tester flushDbase];
    [tester reset];
    [tester singleUserRegistration];
    [tester showMenuButton];
}

- (void)testUser_A_registrationFromScratch {
    {
        [tester flushDbase];
        [tester reset];
        [tester user_A_registration];
        [tester showMenuButton];
    }
}

- (void)testUser_B_registrationFromScratch {
    {
        [tester flushDbase];
        [tester reset];
        [tester user_B_registration];
        [tester showMenuButton];
    }
}

- (void)testUser_A_and_B_registrationFromScratch {
    [tester flushDbase];
    [tester reset];
    
    [tester user_A_registration];
    [tester showMenuButton];
    
    [tester reset];
    
    [tester user_B_registration];
    [tester showMenuButton];
}

- (void)testUser_A_registration {
    {
        [tester reset];
        [tester user_A_registration];
        [tester showMenuButton];
    }
}

- (void)testUser_B_registration {
    {
        [tester reset];
        [tester user_B_registration];
        [tester showMenuButton];
    }
}

- (void)testUser_A_login {
    [tester loginAsUser_A];
}

- (void)testUser_B_login {
    [tester loginAsUser_B];
}

- (void)testAllUserRegistration {
    [tester flushDbase];
    [tester allUsersRegistration];
}

/* @given that the user has already registered with the server
   @and the user is not currently logged in
 
 @then  the user can login using their user name and password
 @and   immediately start with the rider's map
 @and   their location on the map shows
 */
- (void)testSuccessfulLogin
{
    [tester reset];
    [tester login];
}

/* @given that the user has already registered 
   @and that the user is already logged in before app launch
 
 @then the user starts on the map view with the location visible
 @and the button prompts them to set pick up location
 */
- (void)testStartOfApplication {
    [tester showUserCurrentLocationOnMap];
    [tester showsPickUpButton];
}


@end