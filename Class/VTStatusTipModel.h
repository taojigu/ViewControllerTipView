//
//  VTStatusTipModel.h
//  Pods-DemoViewControllerTipView
//
//  Created by gus on 2018/4/30.
//

#import <Foundation/Foundation.h>

@interface VTStatusTipModel : NSObject

@property (nonatomic) NSString *statusCode;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *message;
@property (nonatomic) UIImage *statusImage;
@property (nonatomic,copy) void(^ statusBlock)(UIViewController *);

@end
