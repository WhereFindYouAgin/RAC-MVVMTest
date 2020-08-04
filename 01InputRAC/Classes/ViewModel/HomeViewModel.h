//
//  HomeViewModel.h
//  01InputRAC
//
//  Created by work on 2020/8/4.
//  Copyright © 2020 苏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "Protocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewModel : NSObject <ViewModelProtocol>


@property (nonatomic, strong)  RACCommand *loadHomeDataCommand;


@end

NS_ASSUME_NONNULL_END
