//
//  NetworkSingleton.h
//  RAYWebView
//
//  Created by 党磊 on 15/9/18.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(id responseBody);
typedef void (^FailureBlock)(NSString *error);

@interface NetworkSingleton : NSObject

/** 单列对象*/
+ (NetworkSingleton *)sharedManager;

///http
- (AFHTTPRequestOperationManager *)baseHtppRequest;

/**
 *  初始化 AppInitial
 *
 *  @param userInfo      字段
 *  @param url           url
 *  @param successBlock  成功
 *  @param failureBlock  失败
 *
 *  @return Person对象
 */
- (void)postAppInitial:(NSDictionary *)userInfo
                   url:(NSString *)url
          successBlock:(SuccessBlock)successBlock
          failureBlock:(FailureBlock)failureBlock;

@end
