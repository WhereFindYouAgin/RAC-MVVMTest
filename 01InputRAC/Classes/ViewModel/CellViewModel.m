//
//  CellViewModel.m
//  01InputRAC
//
//  Created by work on 2020/8/4.
//  Copyright © 2020 苏. All rights reserved.
//

#import "CellViewModel.h"
#import "SHLHomeRecommendItem.h"
#import <SDWebImage/SDWebImage.h>
#import "HomeCell.h"
@implementation CellViewModel
- (void)bindViewModel:(UIView *)view
{
    HomeCell *cell = (HomeCell *)view;
    [cell.courseImage sd_setImageWithURL:[NSURL URLWithString:_item.courseImage]];
    cell.courseNameLabel.text = _item.courseName;
    cell.stuNumLabel.text = _item.studentNum;
}

@end
