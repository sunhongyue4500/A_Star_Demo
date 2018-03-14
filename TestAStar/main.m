//
//  main.m
//  TestAStar
//
//  Created by Sunhy on 17/4/1.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyPathFinder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        MyPathFinder *finder = [[MyPathFinder alloc] init];
        [finder findPathFrom:CGPointMake(0, 0) to:CGPointMake(9, 9)];
    }
    return 0;
}
