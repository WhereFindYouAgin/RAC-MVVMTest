//
//  HomeViewModel.m
//  01InputRAC
//
//  Created by work on 2020/8/4.
//  Copyright © 2020 苏. All rights reserved.
//

#import "HomeViewModel.h"
#import "SHLHttpManager.h"
#import "SHLNetworkManager.h"
#import "SHLHomeRecommendItem.h"
#import <MJExtension/MJExtension.h>
#import "HomeCell.h"
#import "CellViewModel.h"
@interface HomeViewModel () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)  NSArray *recommandCellVMs;

@end

@implementation HomeViewModel
static  NSString *homeCellID = @"homeCellID";


- (RACCommand *)loadHomeDataCommand
{
    //请求数据
    if (_loadHomeDataCommand == nil) {
        _loadHomeDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input)
        {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber)
            {
                //发送请求，因为数据，是通过信号传出去的，所以要在这block里面执行请求的操作
                //请求url
                NSString *homeUrl = [SHLNetworkManager urlWithHome];
                //请求参数
                NSDictionary *parameter = [SHLNetworkManager paramWithHome];
                [SHLHttpManager POST:homeUrl parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject)
                {
                    //请求成功 ，遵守MVVM的原则，处理数据放到ViewModel里面
                    NSDictionary *result = responseObject[@"result"];
                    NSDictionary *recommands = result[@"recommends"];
                    
                    //字典转模型
                    NSArray *recommandModels = [SHLHomeRecommendItem mj_objectArrayWithKeyValuesArray:recommands[@"courses"]];
                    
                    //将处理过的数据传出去
                    _recommandCellVMs = [[recommandModels.rac_sequence map:^id _Nullable(id  _Nullable value) {
                        CellViewModel *cellVM = [[CellViewModel alloc] init];
                        cellVM.item = value;
                        return cellVM;
                    }] array];
                    
                    
                    //但是cell里面现在还有设计数据的代码，所以我们也给cell设计一个vM，对cell进行去模型化
                    
                    
                    [subscriber sendNext:recommandModels];
                    [subscriber sendCompleted];
                } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error)
                {
                    //请求出错
                    [subscriber sendError:error];
                    
                }];
                
                return nil;
            }];
        }];
    }
    return _loadHomeDataCommand;
}

#pragma mark - UITableViewDatasource -


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.recommandCellVMs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCellID];
  
    CellViewModel *cellVM = self.recommandCellVMs[indexPath.row];
    
    [cellVM bindViewModel:cell];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

- (void)bindViewModel:(id)view
{
    UITableView *tableView = (UITableView *)view;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerNib:[UINib  nibWithNibName:NSStringFromClass([HomeCell class]) bundle:nil] forCellReuseIdentifier:homeCellID];
}
@end
