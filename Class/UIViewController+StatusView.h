//
//  UIViewController+StatusView.h
//  Masonry
//
//  Created by 顾吉涛 on 2018/6/20.
//

#import <Foundation/Foundation.h>

/**
 Provide message to mamange statusView for StatusCode
 */
@interface UIViewController (StatusView)

//The container view ,on which the status View will be displayed
//"self.view" by default.
@property (nonatomic, weak) UIView *statusContainerView;


/**
 Register status View for Code
 @param statusCode statusCode
 @param statusView statusView to be shown, responding the code
 */
- (void)registerStatusView:(UIView *)statusView forStatusCode:(NSString *)statusCode;

/**
 Show the status , responding the statusCode
 */
- (void)showStatusView:(NSString *)statusCode;

/**
 Hide the status View
 */
- (void)hideStausView;

@end
