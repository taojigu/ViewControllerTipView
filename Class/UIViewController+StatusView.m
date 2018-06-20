//
//  UIViewController+StatusView.m
//  Masonry
//
//  Created by 顾吉涛 on 2018/6/20.
//

#import "UIViewController+StatusView.h"
#import <objc/runtime.h>

@interface UIViewController () {
}

//Buffer for statusView
@property (nonatomic) NSMutableDictionary *statusViewDict;
@property (nonatomic) UIView *currentStatusView;

@end

@implementation UIViewController (StatusView)

- (UIView *)statusContainerView {
    UIView* scv = objc_getAssociatedObject(self, @selector(statusContainerView));
    if (!scv) {

        return self.view;
        
    }
    return scv;
}

- (void)setStatusContainerView:(UIView *)statusContainerView {
    objc_setAssociatedObject(self, @selector(statusContainerView), statusContainerView, OBJC_ASSOCIATION_ASSIGN);
}

- (UIView *)currentStatusView {
    return objc_getAssociatedObject(self, @selector(currentStatusView));
}

- (void)setCurrentStatusView:(UIView *)currentStatusView {
    objc_setAssociatedObject(self, @selector(currentStatusView), currentStatusView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
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
    objc_setAssociatedObject(self, @selector(statusViewDict), statusViewDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)registerStatusView:(UIView *)statusView forStatusCode:(NSString *)statusCode {
    NSParameterAssert(statusCode);
    NSParameterAssert(statusView);
    self.statusViewDict[statusCode] = statusView;
}

- (void)showStatusView:(NSString *)statusCode {
    UIView *stView = self.statusViewDict[statusCode];
    NSParameterAssert(stView);
    if (!stView) {
        return;
    }
    [self.currentStatusView removeFromSuperview];
    stView.frame = self.statusContainerView.bounds;
    [self.statusContainerView addSubview:stView];
    self.currentStatusView = stView;
}

- (void)hideStausView {
    [self.currentStatusView removeFromSuperview];
}






@end
