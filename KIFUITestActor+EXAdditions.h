//
//  KIFUITestActor+EXAdditions.h
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/20/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import <KIF/KIF.h>

@interface KIFUITestActor (EXAdditions)

- (void)reset;
- (void)flushDbase;
- (void)navigateToLoginPage;
- (void)returnToLoggedOutHomeScreen;

    
@end
