//
//  ViewController.m
//  DemoViewControllerTipView
//
//  Created by gus on 2018/4/30.
//  Copyright © 2018年 Gu. All rights reserved.
//

#import "ViewController.h"
#import <VTStatusTipModel.h>
#import <UIViewController+StatusTip.h>
#import "DemoTipModelFactory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerStatusTip];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button404Clicked:(id)sender {
    
}

- (IBAction)buttonNoNetworkingClicked:(id)sender {
    
}

- (void)registerStatusTip {
    NSArray *tipModelArray = [DemoTipModelFactory demoTipModelArray];
    [self registerStatusTipArray:tipModelArray];
}


@end
