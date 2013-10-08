//
//  KIFUITestActor+PromoteUsersToDrivers.m
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/24/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import "KIFUITestActor+PromoteUsersToDrivers.h"
#import "KIFUITestActor+EXAdditions.h"
#import "KIFUITestActor+UserRegistration.h"
#import "DataGenerator.h"
#import "Constants.h"
#import "KIFUITestActor+SettingsPage.h"

@implementation KIFUITestActor (PromoteUsersToDrivers)

- (void)verifyThatUserIsDriver {
    [self runBlock:^KIFTestStepResult(NSError **error) {
        BOOL successfulUserIsDriver = YES;
        successfulUserIsDriver = ([[AppSettings userType] isEqualToString:kUserTypeStringDriver]);
        if (!successfulUserIsDriver) {
            KIFTestCondition(successfulUserIsDriver, error, @"Failed user is driver verification. User is *not* a driver.");
            
        }
        
        return KIFTestStepResultSuccess;
    }];
}

// note: although we'd ideally verify for ourselves that the user is not
// a driver by pinging the rest api.. the assumption here is that
// that has already been done by the app when the user logs in, and
// the returned data from the service is stored in Appsettings.
//
// in general.. our Unit Tests shouldn'd talk to the rest api directly
// that would complicate the build process
- (void)verifyThatUserIsNotDriver {
    [self runBlock:^KIFTestStepResult(NSError **error) {
        BOOL successfulUserIsDriver = YES;
        successfulUserIsDriver = !([[AppSettings userType] isEqualToString:kUserTypeStringDriver]);
        if (!successfulUserIsDriver) {
            KIFTestCondition(successfulUserIsDriver, error, @"Failed user is not driver verification. User *is* a driver.");
            
        }
        
        return KIFTestStepResultSuccess;
    }];
}


- (void)promoteUserToDriverFromScratch {
    // flush the db and make a fresh registration
    // to make sure user is not a driver
    [self reset];
    [self flushDbase];
    [self singleUserRegistration];
    
    // now begin testing
    [self promoteToDriverUserWithData:[DataGenerator sampleUserData]];
}

- (void)promoteToDriverUserWithData:(NSDictionary *)sampleUserData {
    [self tapOnMenuButton];
    [self switchDriverModeOn:YES];
    
    [self reset];
    [self login:sampleUserData];
    
    [self verifyThatUserIsDriver];
}


- (void)promoteUsersToDrivers {
    // since we can't access AFNetworking directly from unit tests..
    // we created a button just to launch this process
    
    // start from scratch, since we will be registering people
    [tester reset];
    [tester flushDbase];
    
    NSArray *sampleUsers = [DataGenerator driverSampleUsersData];
    NSArray *tripoliLocations = [DataGenerator tripoliLocations];
    __block int userIndex = 0;
    [tester registerUsersFromList:sampleUsers additionalStepPerUser:^{
        // convert user to driver
        [tester waitForViewWithAccessibilityLabel:@"Rider Map Segmented Control Driver"];
        [tester tapViewWithAccessibilityLabel:@"Rider Map Segmented Control Driver"];
        [tester waitForTappableViewWithAccessibilityLabel:@"Driver Map Segmented Control Rider"];
        
        // then update their locations
        // notice we simply trigger a hidden button that does all the work..
        // since we cannot call AFNetworking directly
        NSDictionary *tripoliLocation = tripoliLocations[userIndex];
        [tester tapViewWithAccessibilityLabel:@"menu button"];
        [tester waitForViewWithAccessibilityLabel:@"settings update driver location"];
        
        
        // fill long/lat
        [tester waitForViewWithAccessibilityLabel:@"settings lat field"];
        [tester enterText:[NSString stringWithFormat:@"%@", tripoliLocation[@"lat"]] intoViewWithAccessibilityLabel:@"settings lat field"];
        [tester waitForViewWithAccessibilityLabel:@"settings long field"];
        [tester enterText:[NSString stringWithFormat:@"%@", tripoliLocation[@"long"]] intoViewWithAccessibilityLabel:@"settings long field"];
        
        [tester tapViewWithAccessibilityLabel:@"settings update driver location"];
        userIndex++;
    }];
    
    
}


@end
