//
//  RAYArrayUtil.m
//  RAYWebView
//
//  Created by 党磊 on 15/9/16.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import "RAYArrayUtil.h"

@implementation RAYArrayUtil

+ (NSArray *)sortArray:(NSArray *)array sortkey:(NSString *) key ascending :(BOOL) asc {

    NSSortDescriptor *sorter = [[NSSortDescriptor alloc] initWithKey:key ascending:asc];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:&sorter count:1];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:sortDescriptors];
    
    return sortedArray;
}

+ (NSArray *)sortArray:(NSArray *)array sortkeyArray:(NSArray *) keyArray ascendingArray :(NSArray *) ascArray {

    NSMutableArray *sortMutableArray = [[NSMutableArray alloc] init];
    
    for (NSString *key in keyArray) {
        BOOL asc = [[ascArray objectAtIndex:[keyArray indexOfObject:key]] boolValue];
        NSSortDescriptor *sorter = [[NSSortDescriptor alloc] initWithKey:key ascending:asc];
        [sortMutableArray addObject:sorter];
    }
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:sortMutableArray];
    
    return sortedArray;
}

@end
