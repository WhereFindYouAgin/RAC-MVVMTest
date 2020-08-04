//
//  Protocol.h
//  01InputRAC
//
//  Created by work on 2020/8/4.
//  Copyright © 2020 苏. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol ViewModelProtocol <NSObject>

@optional
- (void)bindViewModel:(UIView *)view;

@end
