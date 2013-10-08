//
//  PromoteUsersToDriversTests.m
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/21/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import <KIF/KIF.h>
#import "DataGenerator.h"
#import "KIFUITestActor+PromoteUsersToDrivers.h"
#import "KIFUITestActor+EXAdditions.h"
#import "KIFUITestActor+UserRegistration.h"

@interface PromoteUsersToDriversTests : KIFTestCase

@end

@implementation PromoteUsersToDriversTests

- (void)beforeEach
{
    self.stopTestsOnFirstBigFailure = YES;
}

- (void)testPromoteUserToDriverFromScratch {
    [tester promoteUserToDriverFromScratch];
}

// this is not to test as much as to just harness dummy data
- (void)testPromoteUsersToDrivers {
    [tester promoteUsersToDrivers];
}

- (void)testPromoteUser_A_toDriver {
    [tester reset];
    [tester loginAsUser_A];
    [tester promoteToDriverUserWithData:[DataGenerator user_A_sampleData]];
}

- (void)testPromoteUser_B_toDriver {
    [tester reset];
    [tester loginAsUser_B];
    [tester promoteToDriverUserWithData:[DataGenerator user_B_sampleData]];
}



@end
