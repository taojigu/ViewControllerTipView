//
//  ViewController.m
//  DemoViewControllerTipView
//
//  Created by GuJitao on 2018/4/30.
//  Copyright © 2018年 Gu. All rights reserved.
//

#import "ViewController.h"
#import <UIViewController+StatusView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationController.navigationBar.translucent = NO;
    
    UIView *sv405 = [[UIView alloc] initWithFrame:CGRectZero];
    sv405.backgroundColor = [UIColor blueColor];
    UITapGestureRecognizer *tapRecg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap405StatusView:)];
    [sv405 addGestureRecognizer:tapRecg];
    [self registerStatusView:sv405 forStatusCode:@"405"];
}

- (void)tap405StatusView:(UIGestureRecognizer *)recognizer {
    [self hideStausView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button405Clicked:(id)sender {
    [self showStatusView:@"405"];
}


@end
