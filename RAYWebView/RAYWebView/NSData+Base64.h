//
//  NSData+Base64.h
//  RAYWebView
//
//  Created by 党磊 on 15/9/18.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)

+ (id)dataWithBase64EncodedString:(NSString *)string;     //  Padding '=' characters are optional. Whitespace is ignored.
- (NSString *)base64Encoding;

@end
