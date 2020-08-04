//
//  SHLHttlManager.h
//  Pods-SHLServerKit_Example
//
//  Created by LUOSU on 2020/8/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHLHttpManager : NSObject
+ (void)POST:(NSString *)URLString
parameters:(id)parameters
  progress:(void (^)(NSProgress * progress))uploadProgress
   success:(void (^)(NSURLSessionDataTask *task , id responseObject))success
   failure:(void (^)(NSURLSessionDataTask *task , NSError * error))failure;
@end

NS_ASSUME_NONNULL_END
