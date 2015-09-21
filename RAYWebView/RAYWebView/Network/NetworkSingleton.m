//
//  NetworkSingleton.m
//  RAYWebView
//
//  Created by 党磊 on 15/9/18.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import "NetworkSingleton.h"

//请求超时
#define TIMEOUT         30
#define ALGORITHM_KEY @"F3ABA967CA5B2271CF40292E3AD90D2D"

@implementation NetworkSingleton

+ (NetworkSingleton *)sharedManager {
    
    static NetworkSingleton *sharedNetworkSingleton = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        sharedNetworkSingleton = [[self alloc] init];
    });
    return sharedNetworkSingleton;
}

- (AFHTTPRequestOperationManager *)baseHtppRequest {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];//所有的网络请求,均有manager发起
    [manager.requestSerializer setTimeoutInterval:TIMEOUT];
    //header 设置
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html", @"application/json", nil];

    //申明请求的数据是json类型
    manager.requestSerializer  = [AFHTTPRequestSerializer serializer];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    //传入的参数
    return manager;
}
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
          failureBlock:(FailureBlock)failureBlock {
    
    AFHTTPRequestOperationManager *manager = [self baseHtppRequest];
    NSString *urlString = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *dictionaryData = [[NSMutableDictionary alloc] initWithDictionary:userInfo];
//    排序
    NSArray *keys = [userInfo allKeys];
    keys = [keys sortedArrayUsingSelector:@selector(compare:)];
    
    NSString *str = @"";
    for (id key in keys) {
        str = [NSString stringWithFormat:@"%@%@=%@&",str,key,[userInfo objectForKey:key]];
    }
    str = [str substringToIndex:str.length-1];
    //生成MD5签名，并加到dic
//    NSString *bStr = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
//                                                           (CFStringRef)@"KUkcwFbkw2nZMs8cOBICYrQJ6M8=",
//                                                           NULL,
//                                                           CFSTR(":/?#[]@!$&’()*+,;="),
//                                                           kCFStringEncodingUTF8));
    [dictionaryData setObject:[RAYEncryptUtil hmacSha1:ALGORITHM_KEY  text:str]
                       forKey:@"sign"];
    
    [manager POST:urlString
       parameters:dictionaryData
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              
                    successBlock(responseObject);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              
                    NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
                    failureBlock(errorStr);
          }];
}

@end
