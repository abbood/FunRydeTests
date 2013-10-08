//
//  DataGenerator.h
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/20/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataGenerator : NSObject

+ (NSDictionary *)sampleUserData;
+ (NSArray *)massSampleUsersData;
+ (NSArray *)driverSampleUsersData;
+ (NSArray *)tripoliLocations;

+ (NSDictionary *)user_A_sampleData;
+ (NSDictionary *)user_B_sampleData;

    
@end
