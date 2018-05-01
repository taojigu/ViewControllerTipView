//
//  UIViewController+StatusTip.h
//  Pods-DemoViewControllerTipView
//
//  Created by gus on 2018/5/1.
//

#import <Foundation/Foundation.h>
#import "VTStatusTipModel.h"

@interface UIViewController (StatusTip)

- (void)registerStatusTip:(VTStatusTipModel *)statusTipModel;

- (void)registerStatusTipArray:(NSArray *)statusTipModelArray;

- (void)showStatus:(NSString *)statusCode;

@end
