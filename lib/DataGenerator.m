//
//  DataGenerator.m
//  FunRyde
//
//  Created by Abdullah Bakhach on 9/20/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import "DataGenerator.h"

@implementation DataGenerator

+ (NSDictionary *)sampleUserData {
    return [[self massSampleUsersData] firstObject];
}

// return the first 3 users from the sample list
+ (NSArray *)driverSampleUsersData {
    NSIndexSet *indexSet
        = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)];
    return [[self massSampleUsersData] objectsAtIndexes:indexSet];
}

+ (NSArray *)massSampleUsersData {
    NSArray *samples =
    @[
       @{@"email":      @"abdullah@email.com",
         @"password":   @"hindi",
         @"fname":      @"Abdullah",
         @"lname":      @"Bakhach",
         @"age":        @"30",
         @"rating":     @"3.3",
         @"gender":     @"m"},
     
       @{@"email":      @"mheesen@email.com",
         @"password":   @"mheesen",
         @"fname":      @"mheesen",
         @"lname":      @"jamaan",
         @"age":        @"18",
         @"rating":     @"3.4",
         @"gender":     @"m"},
       
       @{@"email":      @"mohammed@email.com",
         @"password":   @"mohammd",
         @"fname":      @"mohammed",
         @"lname":      @"taha",
         @"age":        @"29",
         @"rating":     @"1.3",
         @"gender":     @"m"},
       
       @{@"email":      @"ahsan@email.com",
         @"password":   @"ahsan",
         @"fname":      @"ahsan",
         @"lname":      @"jafri",
         @"age":        @"33",
         @"rating":     @"5",
         @"gender":     @"f"},
       
       @{@"email":      @"kabeer@email.com",
         @"password":   @"kabeer",
         @"fname":      @"kabeer",
         @"lname":      @"sagheer",
         @"age":        @"33",
         @"rating":     @"5",
         @"gender":     @"f"},
       
       @{@"email":      @"atalla@email.com",
         @"password":   @"atalla",
         @"fname":      @"atalla",
         @"lname":      @"metwalli",
         @"age":        @"33",
         @"rating":     @"5",
         @"gender":     @"m"},
       ];
    
    return samples;
}

+ (NSArray *)tripoliLocations {
    return [self massSampleLocations][@"tripoli"];
}

+ (NSDictionary *)massSampleLocations {
    NSDictionary *locations =
    @{@"tripoli":@[
              @{@"lat": @34.451769,
                @"long": @35.807533,
                @"name": @"mina"
                },
              
              @{@"lat":@34.454742,
                @"long":@35.830364,
                @"name": @"port"
                },
              
              @{@"lat":@34.432953,
                @"long":@35.855212,
                @"name": @"qal3a"
                },
              
              @{@"lat":@34.417094,
                @"long":@35.837102,
                @"name": @"manar university"
                }
              ],
      
      @"chekka":@[
              @{@"lat":@34.326703,
                @"long":@35.724449,
                @"name": @"st. francois",
                },
              
              @{@"lat":@34.327979,
                @"long":@35.730114,
                @"name": @"saydet el khalas"
                },
              
              @{@"lat":@34.323549,
                @"long":@35.733032,
                @"name": @"USEK",
                }
              ],
      
      @"beirut":@[
              
              @{@"lat":@33.883230,
                @"long":@35.496225,
                @"name": @"LIU"
                },
              
              @{@"lat":@33.900828,
                @"long":@35.482492,
                @"name": @"AUB"
                },
              
              @{@"lat":@33.873325,
                @"long":@35.497942,
                @"name": @"BAU"
                }
              ],
      };
    
    return locations;
}

+ (NSDictionary *)user_A_sampleData{
    return [self massSampleUsersData][0];
}

+ (NSDictionary *)user_B_sampleData{
    return [self massSampleUsersData][1];
}

@end
