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

+(NetworkSingleton *)sharedManager;
-(AFHTTPRequestOperationManager *)baseHtppRequest;

//应用初始化
/**
 *  初始化Person对象
 *
 *  @param name   名称
 *  @param age    年龄
 *  @param height 身高
 *
 *  @return Person对象
 */
- (void)postAppInitial:(NSDictionary *)userInfo
                   url:(NSString *)url
          successBlock:(SuccessBlock)successBlock
          failureBlock:(FailureBlock)failureBlock;

@end
