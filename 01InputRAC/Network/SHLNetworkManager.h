//
//  SHLNetworkManager.h
//  SHLServerKit_Example
//
//  Created by LUOSU on 2020/8/1.
//  Copyright © 2020 SuLuoLuoMake. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHLNetworkManager : NSObject

/**
    获取兴趣参数
 */
+ (NSDictionary *)paramWithInteresting;


/**
    获取课程参数
 */
+ (NSDictionary *)paramWithScheduleWithNextMonthIndex:(NSInteger)nextMonthIndex;


/**
    获取首页参数
 */
+ (NSDictionary *)paramWithHome;


/**
    获取首页URL
 */
+ (NSString *)urlWithHome;

/**
 获取兴趣URL
 */
+ (NSString *)urlWithInteresting;

/**
 获取课程URL
 */
+ (NSString *)urlWithSchedule;
@end

NS_ASSUME_NONNULL_END
