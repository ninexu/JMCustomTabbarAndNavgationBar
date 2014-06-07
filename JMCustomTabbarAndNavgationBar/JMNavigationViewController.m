//
//  JMNavigationViewController.m
//  JMCustomTabbarAndNavgationBar
//
//  Created by 徐 焕 on 14/6/7.
//  Copyright (c) 2014年 徐 焕. All rights reserved.
//

#import "JMNavigationViewController.h"

@interface JMNavigationViewController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation JMNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //iOS7下navbar的分割线
    self.navigationBar.barStyle = 1;
    self.navigationBar.shadowImage = nil;
    //设置背景图片
    if (([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0))
    {
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_Bar_44"] forBarMetrics:UIBarMetricsDefault];
    }
    else
    {
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_Bar_64@2x"] forBarMetrics:UIBarMetricsDefault];
    }
    //使用iOS7下的右滑返回功能
    __weak JMNavigationViewController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //iOS6下加右滑手势返回
    if (([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) && self.viewControllers.count > 0) {
        UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeBackAction)];
        swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
        [viewController.view addGestureRecognizer:swipeGesture];
    }
    //iOS7下滑动动画时禁止enable
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    return [super popViewControllerAnimated:animated];
}

- (void)swipeBackAction
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    //动画结束再设置成true，栈里第一次viewcontroller设置为enable为no，不然在第一个页面滑动会crash
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        if (self.viewControllers.count > 1)
        {
            self.interactivePopGestureRecognizer.enabled = YES;
        }
        else
        {
            self.interactivePopGestureRecognizer.enabled = NO;
        }
    }
}

@end
