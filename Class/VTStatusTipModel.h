//
//  VTStatusTipModel.h
//  Pods-DemoViewControllerTipView
//
//  Created by GuJitao on 2018/4/30.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VTShowStatusStyle.h"

@interface VTStatusTipModel : NSObject

@property (nonatomic) NSString *statusCode;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *message;
@property (nonatomic) UIImage *statusImage;
@property (nonatomic) NSString *buttonText;
@property (nonatomic ,copy) void(^ statusBlock)(void);
@property (nonatomic, assign) VTShowStatusStyle showStatusStyle;

@end
