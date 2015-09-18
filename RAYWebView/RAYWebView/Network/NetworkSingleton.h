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

- (void)postAppInitial:(NSDictionary *)userInfo
                   url:(NSString *)url
          successBlock:(SuccessBlock)successBlock
          failureBlock:(FailureBlock)failureBlock;

@end
