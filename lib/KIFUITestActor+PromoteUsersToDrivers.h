//
//  KIFUITestActor+PromoteUsersToDrivers.h
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/24/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import <KIF/KIF.h>

@interface KIFUITestActor (PromoteUsersToDrivers)

- (void)verifyThatUserIsDriver;
- (void)verifyThatUserIsNotDriver;

- (void)promoteUserToDriverFromScratch;
- (void)promoteUsersToDrivers;

- (void)promoteLoggedInUserToDriver;
    
@end
