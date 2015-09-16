//
//  RAYDateFormatterUitl.m
//  RAYWebView
//
//  Created by 党磊 on 15/9/16.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import "RAYDateFormatterUitl.h"

@implementation RAYDateFormatterUitl

+ (NSString *)dateToStringFormat:(NSDate *)sourceDate partten:(NSString *)partten {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:partten];
    
    NSString *dateString = [formatter stringFromDate:sourceDate];
    
    return dateString;
}


@end
