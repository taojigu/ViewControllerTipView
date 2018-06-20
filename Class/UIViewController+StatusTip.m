//
//  UIViewController+StatusTip.m
//  Pods-DemoViewControllerTipView
//
//  Created by GuJitao on 2018/5/1.
//

#import "UIViewController+StatusTip.h"
#import <objc/runtime.h>
#import "VTStatusTipView.h"

@interface UIViewController ()

@property (nonatomic) NSMutableDictionary *statusTipModelDict;
@property (nonatomic) VTStatusTipView *statusTipView;
@property (nonatomic) NSMutableDictionary *statusViewDict;



@end;


@implementation UIViewController (StatusTip)
- (void)registerStatusTip:(VTStatusTipModel *)statusTipModel {
    NSString *code = statusTipModel.statusCode;
    self.statusTipModelDict[code] = statusTipModel;
}

- (void)registerStatusTipArray:(NSArray *)statusTipModelArray {
    for (VTStatusTipModel *model in statusTipModelArray) {
        [self registerStatusTip:model];
    }
}

- (void)registerStatusBlock:(NSString *)statusCode block:(void (^)(void))block {
    NSAssert(statusCode.length > 0, @"status Code should not be nil");
    if (!block) {
        return;
    }
    
    VTStatusTipModel *model = self.statusTipModelDict[statusCode];
    if (!model) {
        return;
    }
    model.statusBlock = block;
    
}


#pragma mark -- property messages
- (NSMutableDictionary *)statusTipModelDict {
    NSMutableDictionary* dict = objc_getAssociatedObject(self, @selector(statusTipModelDict));
    if (!dict) {
        dict = [NSMutableDictionary new];
        [self setStatusTipModelDict:dict];
    }
    return dict;
}

- (void)setStatusTipModelDict:(NSMutableDictionary *)statusTipModelDict {
    objc_setAssociatedObject(self, @selector(statusTipModelDict), statusTipModelDict, OBJC_ASSOCIATION_RETAIN);
}

- (NSMutableDictionary *)statusViewDict {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, @selector(statusViewDict));
    if (!dict) {
        dict = [NSMutableDictionary new];
        [self setStatusViewDict:dict];
    }
    return dict;
}

- (void)setStatusViewDict:(NSMutableDictionary *)statusViewDict {
    objc_setAssociatedObject(self, @selector(statusViewDict), statusViewDict, OBJC_ASSOCIATION_RETAIN);
}

- (NSMutableDictionary *)statusBlockDict {
    NSMutableDictionary* dict = objc_getAssociatedObject(self, @selector(statusBlockDict));
    if (!dict) {
        dict = [NSMutableDictionary new];
        [self setStatusBlockDict:dict];
    }
    return dict;
}

- (void)setStatusBlockDict:(NSMutableDictionary *)statusBlockDict {
    objc_setAssociatedObject(self, @selector(statusBlockDict), statusBlockDict, OBJC_ASSOCIATION_RETAIN);
}

- (UIImageView *)statusImageView {
    UIImageView *imageView = objc_getAssociatedObject(self, @selector(statusImageView));
    if (!imageView) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:imageView];
        [self setStatusImageView:imageView];
    }
    return imageView;
}

- (void)setStatusImageView:(UIImageView *)statusImageView {
    objc_setAssociatedObject(self, @selector(statusImageView), statusImageView, OBJC_ASSOCIATION_RETAIN);
}

- (VTStatusTipView *)statusTipView {
    VTStatusTipView *stview = objc_getAssociatedObject(self, @selector(statusTipView));
    if (!stview) {
        stview = [[VTStatusTipView alloc] initWithFrame:self.statusContainerView.bounds showStyle:VTShowStatusStyleDefault];
        stview.backgroundColor = [UIColor blueColor];
        [self setStatusTipView:stview];
    }
    return stview;
};

- (void) setStatusTipView:(VTStatusTipView *)statusTipView {
    objc_setAssociatedObject(self, @selector(statusTipView), statusTipView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)statusContainerView {
    UIView *containView = objc_getAssociatedObject(self, @selector(statusContainerView));
    if(!containView) {
        return self.view;
    }
    return containView;
}

- (void)setStatusContainerView:(UIView *)statusContainerView {
    objc_setAssociatedObject(self, @selector(statusContainerView), statusContainerView, OBJC_ASSOCIATION_ASSIGN);
}

@end
