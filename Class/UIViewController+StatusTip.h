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

//The container view ,on which the status View will be displayed
//"self.view" by default.
@property (nonatomic, weak) UIView *statusContainerView;

/**
 Register shown tip for the status
 */
- (void)registerStatusTip:(VTStatusTipModel *)statusTipModel;

/**
 Register show tips for statuses
 */
- (void)registerStatusTipArray:(NSArray *)statusTipModelArray;

/**
 Show the status , responding the statusCode
 */
- (void)showStatusView:(NSString *)statusCode;

/**
 Hide the status View
 */
- (void)hideStausView;

/**
 Register the block , trigged on the status View
 */
- (void)registerStatusBlock:(NSString *)statusCode block:(void (^)(void))block;

/**
 Register the statusView, shown when the statusCode is trigged
 */
- (void)registerStatusView:(NSString *)statusCode statusView:(id<VTShowStatus>)statusView;
@end
