//
//  RAYEncryptUtil.h
//  RAYWebView
//
//  Created by 党磊 on 15/9/18.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCryptor.h>
#import "NSData+Base64.h"

@interface RAYEncryptUtil : NSObject

+ (NSString *) hmacSha1:(NSString*)key text:(NSString*)text;

@end
