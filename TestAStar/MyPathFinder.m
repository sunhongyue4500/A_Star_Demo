//
//  MyPathFinder.m
//  TestAStar
//
//  Created by Sunhy on 17/4/1.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import "MyPathFinder.h"

#define MaxRow 10
#define MaxCol 10
@implementation MyPathFinder
- (void) findPathFrom: (CGPoint) start to: (CGPoint) end
{
    HSAIPathFinding *pathFinder = [[HSAIPathFinding alloc] init];
    pathFinder.delegate = self;
    pathFinder.heuristic = [HSAIPathFindingHeuristic manhattanHeuristic];
    
    NSArray *array = [pathFinder findPathFrom: start to: end]; // returns an array of HSAIPathFindingNodes
    NSLog(@"%@", array);
}

- (BOOL) nodeIsPassable: (HSAIPathFindingNode *) node
{
    // The logic you use to figure out if a node is passable.
    if (node.point.x == 4 && node.point.y == 4) {
        return NO;
    }
    
    if (node.point.x == 8 && node.point.y == 8) {
        return NO;
    }
    
//    if (node.point.x == 7 && node.point.y == 8) {
//        return NO;
//    }
    return YES;
}

- (NSArray *) neighborsFor: (HSAIPathFindingNode *) node
{
    // The logic you use to figure out neighbors
    NSMutableArray *array = [NSMutableArray array];
    // 左边的
    if (node.point.x - 1 >= 0) {
        HSAIPathFindingNode *node1 = [[HSAIPathFindingNode alloc] initWithPosition:CGPointMake(node.point.x - 1, node.point.y)];
        [array addObject:node1];
        if (node.point.y - 1 >= 0) {
            HSAIPathFindingNode *node2 = [[HSAIPathFindingNode alloc] initWithPosition:CGPointMake(node.point.x - 1, node.point.y - 1)];
            [array addObject:node2];
        }
        if (node.point.y + 1 <= MaxRow - 1) {
            HSAIPathFindingNode *node3 = [[HSAIPathFindingNode alloc] initWithPosition:CGPointMake(node.point.x - 1, node.point.y + 1)];
            [array addObject:node3];
        }
    }
    
    // 中间的
    if (node.point.y - 1 >= 0) {
        HSAIPathFindingNode *node4 = [[HSAIPathFindingNode alloc] initWithPosition:CGPointMake(node.point.x, node.point.y - 1)];
        [array addObject:node4];
    }
    if (node.point.y + 1 <= MaxRow - 1) {
        HSAIPathFindingNode *node5 = [[HSAIPathFindingNode alloc] initWithPosition:CGPointMake(node.point.x, node.point.y + 1)];
        [array addObject:node5];
    }
    
    // 右边的
    if (node.point.x + 1 <= MaxCol - 1) {
        HSAIPathFindingNode *node6 = [[HSAIPathFindingNode alloc] initWithPosition:CGPointMake(node.point.x + 1, node.point.y)];
        [array addObject:node6];
        if (node.point.y - 1 >= 0) {
            HSAIPathFindingNode *node7 = [[HSAIPathFindingNode alloc] initWithPosition:CGPointMake(node.point.x + 1, node.point.y - 1)];
            [array addObject:node7];
        }
        if (node.point.y + 1 <= MaxRow - 1) {
            HSAIPathFindingNode *node8 = [[HSAIPathFindingNode alloc] initWithPosition:CGPointMake(node.point.x + 1, node.point.y + 1)];
            [array addObject:node8];
        }
    }
    return [array copy];
}

@end


