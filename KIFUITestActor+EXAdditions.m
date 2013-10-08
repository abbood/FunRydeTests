//
//  KIFUITestActor+EXAdditions.m
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/20/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import "KIFUITestActor+EXAdditions.h"
#import "AppDelegate.h"
#import "DataGenerator.h"

@implementation KIFUITestActor (EXAdditions)

- (void)reset
{
    [self runBlock:^KIFTestStepResult(NSError **error) {
        BOOL successfulReset = YES;
        
        // Do the actual reset for your app. Set successfulReset = NO if it fails.
        AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
        [appDelegate resetApp];
        
        KIFTestCondition(successfulReset, error, @"Failed to reset some part of the application.");
        
        return KIFTestStepResultSuccess;
    }];
}

- (void)flushDbase {
    [self runBlock:^KIFTestStepResult(NSError **error){
        NSURL *url = [NSURL URLWithString:@"http://mouniryounes.com/funryde/public/flush_db"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *connectionError = nil;
        
        BOOL databaseFlushSucceeded = YES;
        
        NSURLResponse *response;
        NSData *resultData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&connectionError];
        if (!resultData) {
            databaseFlushSucceeded = NO;
            KIFTestCondition(databaseFlushSucceeded, error, @"failed to connect to server!");
        }
        
        if (connectionError) {
            databaseFlushSucceeded = NO;
            KIFTestCondition(databaseFlushSucceeded, error, [NSString stringWithFormat:@"connection failed. Error: %@", [connectionError localizedDescription]]);
        }
        
        return KIFTestStepResultSuccess;
    }];
}


- (void)navigateToLoginPage
{
    [self tapViewWithAccessibilityLabel:@"login email"];
}

- (void)returnToLoggedOutHomeScreen
{
    [self tapViewWithAccessibilityLabel:@"Logout"];
    [self tapViewWithAccessibilityLabel:@"Logout"]; // Dismiss alert.
}



@end
