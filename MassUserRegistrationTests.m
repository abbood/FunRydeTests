//
//  MassUserRegistration.m
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/21/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import <KIF/KIF.h>
#import "KIFUITestActor+UserRegistration.h"
#import "KIFUITestActor+EXAdditions.h"

@interface MassUserRegistrationTests : KIFTestCase

@end


@implementation MassUserRegistrationTests


- (void)testAllUserRegistration {
    [tester allUsersRegistration];
}

@end
