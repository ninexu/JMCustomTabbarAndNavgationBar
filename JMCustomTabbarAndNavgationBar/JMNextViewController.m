//
//  JMNextViewController.m
//  JMCustomTabbarAndNavgationBar
//
//  Created by 徐 焕 on 14/6/7.
//  Copyright (c) 2014年 徐 焕. All rights reserved.
//

#import "JMNextViewController.h"

@interface JMNextViewController ()

@end

@implementation JMNextViewController

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
    self.title = @"Next";
    self.view.backgroundColor = [UIColor whiteColor];
    //返回barbuttonitem
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 30.0, 30.0)];
    [btn setImage:[UIImage imageNamed:@"home@2x"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //设置成@“”不然会有三个小点
    self.navigationItem.leftBarButtonItem.title = @"";
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
