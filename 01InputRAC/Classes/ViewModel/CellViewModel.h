//
//  CellViewModel.h
//  01InputRAC
//
//  Created by work on 2020/8/4.
//  Copyright © 2020 苏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocol.h"
NS_ASSUME_NONNULL_BEGIN
@class SHLHomeRecommendItem;

@interface CellViewModel : NSObject <ViewModelProtocol>

@property (nonatomic, strong)  SHLHomeRecommendItem *item;


@end

NS_ASSUME_NONNULL_END
