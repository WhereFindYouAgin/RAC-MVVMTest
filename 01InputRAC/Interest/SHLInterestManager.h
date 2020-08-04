//
//  SHLInterestManager.h
//  SHLServerKit_Example
//
//  Created by LUOSU on 2020/8/1.
//  Copyright © 2020 SuLuoLuoMake. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHLInterestManager : NSObject
+ (void)storageAllInterest:(NSArray *)interests;

+ (NSArray *)interestes;

+ (NSMutableDictionary *)cellDict;

@end

NS_ASSUME_NONNULL_END
