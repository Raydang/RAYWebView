//
//  RAYArrayUtil.h
//  RAYWebView
//
//  Created by 党磊 on 15/9/16.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RAYArrayUtil : NSObject

+ (NSArray *)sortArray:(NSArray *)array sortkey:(NSString *) key ascending :(BOOL) asc;
+ (NSArray *)sortArray:(NSArray *)array sortkeyArray:(NSArray *) keyArray ascendingArray :(NSArray *) ascArray;

@end
