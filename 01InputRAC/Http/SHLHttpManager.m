//
//  SHLHttlManager.m
//  Pods-SHLServerKit_Example
//
//  Created by LUOSU on 2020/8/1.
//

#import "SHLHttpManager.h"
#import "AFNetworking.h"


@implementation SHLHttpManager

+ (void)POST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress *))uploadProgress success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    // 自定义请求，为JSON格式
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    
    // 自定义响应
    AFHTTPResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
    
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    mgr.responseSerializer = responseSerializer;
    
    [mgr POST:URLString parameters:parameters progress:nil success:success failure:failure];
    
}
@end
