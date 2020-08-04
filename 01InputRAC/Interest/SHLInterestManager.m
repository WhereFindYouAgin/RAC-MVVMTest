//
//  SHLInterestManager.m
//  SHLServerKit_Example
//
//  Created by LUOSU on 2020/8/1.
//  Copyright © 2020 SuLuoLuoMake. All rights reserved.
//

#import "SHLInterestManager.h"

#define SHLInterestFilePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"interest.data"]

#define SHLInterestesFilePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"interestes.data"]

static NSMutableDictionary *_interestDicts = nil;

@implementation SHLInterestManager

+ (NSMutableDictionary *)cellDict
{
    if (_interestDicts == nil) {
        _interestDicts = [NSMutableDictionary dictionary];
    }
    
    return _interestDicts;
}

+ (void)storageInterestGroup:(NSArray *)group
{
    [NSKeyedArchiver archiveRootObject:group toFile:SHLInterestFilePath];
}

+ (NSMutableArray *)interestGroup
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:SHLInterestFilePath];
}

+ (void)storageAllInterest:(NSArray *)interests
{
    [NSKeyedArchiver archiveRootObject:interests toFile:SHLInterestesFilePath];
}

+ (NSArray *)interestes
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:SHLInterestesFilePath];
}
@end
