//
//  UpdateLocationTests.m
//  FunRyde
//
//  Created by Abdullah Bakhach on 10/3/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import <KIF/KIF.h>
#import "KIFUITestActor+EXAdditions.h"
#import "DataGenerator.h"

@interface UpdateLocationTests : KIFTestCase

@end

@implementation UpdateLocationTests

// already logged in
- (void)testUpdatingToLocationTripoli_0 {
    NSDictionary *tripoliLocation = [DataGenerator tripoliLocations][0];
    
    [tester tapViewWithAccessibilityLabel:@"menu button"];
    [tester waitForViewWithAccessibilityLabel:@"settings update driver location"];
    
    // fill long/lat
    [tester waitForViewWithAccessibilityLabel:@"settings lat field"];
    [tester enterText:[NSString stringWithFormat:@"%@", tripoliLocation[@"lat"]] intoViewWithAccessibilityLabel:@"settings lat field"];
    [tester waitForViewWithAccessibilityLabel:@"settings long field"];
    [tester enterText:[NSString stringWithFormat:@"%@", tripoliLocation[@"long"]] intoViewWithAccessibilityLabel:@"settings long field"];
    
    [tester tapViewWithAccessibilityLabel:@"settings update driver location"];
    [tester waitForViewWithAccessibilityLabel:@"update succeeded"];
}


@end
