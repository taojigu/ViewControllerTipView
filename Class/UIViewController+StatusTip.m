//
//  UIViewController+StatusTip.m
//  Pods-DemoViewControllerTipView
//
//  Created by gus on 2018/5/1.
//

#import "UIViewController+StatusTip.h"
#import <objc/runtime.h>
#import "VTStatusTipView.h"

@interface UIViewController ()

@property (nonatomic) NSMutableDictionary *statusTipModelDict;
@property (nonatomic) UIImageView *statusImageView;

@end;


@implementation UIViewController (StatusTip)

- (NSMutableDictionary *)statusTipModelDict {
    NSMutableDictionary* dict = objc_getAssociatedObject(self, @selector(statusTipModelDict));
    if (!dict) {
        dict = [NSMutableDictionary new];
        [self statusTipModelDict:dict];
    }
    return dict;
}

- (void)statusTipModelDict:(NSMutableDictionary *)statusTipModelDict {
    objc_setAssociatedObject(self, @selector(statusTipModelDict), statusTipModelDict, OBJC_ASSOCIATION_RETAIN);
}

- (void)registerStatusTip:(VTStatusTipModel *)statusTipModel {
    NSString *code = statusTipModel.statusCode;
    self.statusTipModelDict[code] = statusTipModel;
}

- (void)registerStatusTipArray:(NSArray *)statusTipModelArray {
    for (VTStatusTipModel *model in statusTipModelArray) {
        [self registerStatusTip:model];
    }
}

- (void)showStatus:(NSString *)statusCode {
    NSAssert(statusCode.length > 0, @"status Code should not be nil");
    
    VTStatusTipModel *model = self.statusTipModelDict[statusCode];
    CGFloat imageWidth = 100;
    CGFloat left = (CGRectGetWidth(self.view.frame) - 100) / 2;
    CGFloat top = 80;
    UIImageView* imageView = [[UIImageView alloc] initWithImage:model.statusImage];
    imageView.frame = CGRectMake(left, top, imageWidth, imageWidth);
    [self.view addSubview: imageView];
    
}

@end
