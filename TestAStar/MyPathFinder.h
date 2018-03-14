//
//  MyPathFinder.h
//  TestAStar
//
//  Created by Sunhy on 17/4/1.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "HSAIPathFinding.h"



@interface MyPathFinder : NSObject <HSAIPathFindingDelegate>
- (void) findPathFrom: (CGPoint) start to: (CGPoint) end;
@end
