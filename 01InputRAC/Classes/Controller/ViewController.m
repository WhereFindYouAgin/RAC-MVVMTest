//
//  ViewController.m
//  01InputRAC
//
//  Created by work on 2020/8/3.
//  Copyright © 2020 苏. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveObjC.h"
#import "SHLHomeRecommendItem.h"
#import "HomeViewModel.h"
#import "HomeCell.h"

@interface ViewController ()
@property (nonatomic, strong)  HomeViewModel *homeVM;


@end

@implementation ViewController
// MVVM:框架思想

/*
    框架思想: 把业务逻辑划分更清楚,是代码更加好维护
    本质: 就是把一个类的东西抽离到另外一个类中
 
    MVC:
    MVC S(业务类:manager)
 
    MVVM : 2015
 
    VM:处理界面业务(显示,事件)
 
    VIPER: 2014(美团)
    V:
 
    E:模型
 
    I:交互(事件)
 
    P:展示()
 
    R:路由(跳转)
 
    VIPER:用于大公司 维护成本高 (20K : iOS)
 
 */

// RAC + MVVM
// bindViewModel

// RACCommand:请求数据

- (HomeViewModel *)homeVM
{
    if (_homeVM == nil) {
        _homeVM = [[HomeViewModel alloc] init];
    }
    return _homeVM;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //这里拿到下载的数据，可以直接订阅信号就可以，
    @weakify(self);
    [[self.homeVM.loadHomeDataCommand execute:nil] subscribeNext:^(id  _Nullable x)
    {
        @strongify(self);
        //因为block中使用self 所以注意循环引用的问题
        [self.tableView reloadData];
    }];

    
    
    //ViewModel主要是负责显示和事件处理,如果我们想把tableView的显示代码抽出去就先把代理改成VM,VM一般都会又个bindVIew的方法，用来绑定View
    
    [self.homeVM bindViewModel:self.tableView];
    
    
}


@end
