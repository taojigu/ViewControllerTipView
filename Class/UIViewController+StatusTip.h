//
//  UIViewController+StatusTip.h
//  Pods-DemoViewControllerTipView
//
//  Created by GuJitao on 2018/5/1.
//

#import <Foundation/Foundation.h>
#import "VTStatusTipModel.h"
#import "VTShowStatusStyle.h"
#import "VTShowStatus.h"

/**
 Message for status operatrions
 */
@interface UIViewController (StatusTip)


/**
 Register shown tip for the status
 */
- (void)registerStatusTip:(VTStatusTipModel *)statusTipModel;

/**
 Register show tips for statuses
 */
- (void)registerStatusTipArray:(NSArray *)statusTipModelArray;

/**
 Register the block , trigged on the status View
 */
- (void)registerStatusBlock:(NSString *)statusCode block:(void (^)(void))block;

@end
