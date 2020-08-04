//
//  HomeCell.h
//  01InputRAC
//
//  Created by work on 2020/8/4.
//  Copyright © 2020 苏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeCell : UITableViewCell


@property (weak, nonatomic, readonly) IBOutlet UILabel *courseNameLabel;

@property (weak, nonatomic, readonly) IBOutlet UILabel *stuNumLabel;
@property (weak, nonatomic, readonly) IBOutlet UIImageView *courseImage;
@end

NS_ASSUME_NONNULL_END
