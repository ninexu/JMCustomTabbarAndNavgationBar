//
//  JMFirstViewController.m
//  JMCustomTabbarAndNavgationBar
//
//  Created by 徐 焕 on 14/6/7.
//  Copyright (c) 2014年 徐 焕. All rights reserved.
//

#import "JMFirstViewController.h"
#import "JMNextViewController.h"

@interface JMFirstViewController ()

@end

@implementation JMFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"首页";
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 90.0, 320.0, 40.0)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor purpleColor];
    [btn addTarget:self action:@selector(nextStepAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)nextStepAction
{
    JMNextViewController *nextVC = [[JMNextViewController alloc] init];
    nextVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
