//
//  RAYEncryptUtil.m
//  RAYWebView
//
//  Created by 党磊 on 15/9/18.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import "RAYEncryptUtil.h"

@implementation RAYEncryptUtil

+ (NSString *) hmacSha1:(NSString*)key text:(NSString*)text {
    
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [text cStringUsingEncoding:NSASCIIStringEncoding];
    
    char cHMAC[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];
    NSString *hash = [HMAC base64Encoding];//base64Encoding函数在NSData+Base64中定义（NSData+Base64网上有很多资源）
    return hash;
}

@end
