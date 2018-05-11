//
//  DemoTipModelFactory.m
//  DemoViewControllerTipView
//
//  Created by 顾吉涛 on 2018/5/2.
//  Copyright © 2018年 Gu. All rights reserved.
//

#import "DemoTipModelFactory.h"
#import <VTStatusTipModel.h>
#import <UIKit/UIKit.h>

@implementation DemoTipModelFactory

+(NSArray *)demoTipModelArray {
    NSMutableArray *modelArray = [NSMutableArray new];
    VTStatusTipModel *model404 = [[VTStatusTipModel alloc] init];
    model404.statusCode = @"404";
    model404.title = @"网络内容无";
    model404.message = @"您访问的网络内容，已经消失";
    model404.statusImage = [UIImage imageNamed:@"Status404"];
    [modelArray addObject:model404];
    
    VTStatusTipModel *netDisconnetModel = [[VTStatusTipModel alloc] init];
    netDisconnetModel.statusCode = @"NetDisconnet";
    netDisconnetModel.title = @"网络断开";
    netDisconnetModel.message = @"请检查网络是否正常连接";
    netDisconnetModel.statusImage = [UIImage imageNamed:@"StatusNoNetworking"];
    [modelArray addObject:netDisconnetModel];
    
    return modelArray;
}
@end
