//
//  VTStatusView.h
//  Pods
//
//  Created by 顾吉涛 on 2018/5/3.
//

#import <UIKit/UIKit.h>
#import "VTStatusTipModel.h"
#import "VTShowStatusStyle.h"

/**
 Status View , shown on the ViewController.view
 */
@interface VTStatusTipView : UIView

/**
 Construct messages
 @param frame frame of View
 @param showStyle of Status View
 */
- (instancetype)initWithFrame:(CGRect)frame showStyle:(VTShowStatusStyle)showStyle;

- (void)confgureTipModel:(VTStatusTipModel *)model;


@end
