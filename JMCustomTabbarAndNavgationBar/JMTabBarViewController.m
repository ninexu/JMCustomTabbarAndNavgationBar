//
//  JMTabBarViewController.m
//  JMCustomTabbarAndNavgationBar
//
//  Created by 徐 焕 on 14/6/7.
//  Copyright (c) 2014年 徐 焕. All rights reserved.
//

#import "JMTabBarViewController.h"

@interface JMTabBarViewController ()

@property (nonatomic, retain) UIImageView *tabBarView;
@property (nonatomic, retain) UIButton *previousBtn;

@end

@implementation JMTabBarViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Custom Action

// 按钮被点击时调用

- (void)changeViewController:(UIButton *)sender
{
    self.previousBtn.selected = NO;
    self.previousBtn.userInteractionEnabled = YES;
    sender.selected = YES;
    sender.userInteractionEnabled = NO;
    self.previousBtn = sender;
    //选中viewcontrollview
    self.selectedIndex = (sender.tag - 100);
}

//初始化自定义的tabbarview

- (void)customTabbarViewInit:(NSArray *)tabArr
{
    self.tabBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.tabBar.bounds.size.width, self.tabBar.bounds.size.height)];
    self.tabBarView.userInteractionEnabled = YES;
    //    self.tabBarView.image = [UIImage imageNamed:@"背景图片"];
    self.tabBarView.backgroundColor = [UIColor lightGrayColor];
    for (int i = 0; i < tabArr.count; i++) {
        NSDictionary *tempdic = [tabArr objectAtIndex:i];
        [self creatButtonWithNormalName:[tempdic objectForKey:@"image"] andSelectName:[tempdic objectForKey:@"selectimage"] andTitle:[tempdic objectForKey:@"title"] andIndex:i totalNum:tabArr.count];
    }
    //tabbar修改
    [[self.tabBar subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.tabBar insertSubview:self.tabBarView atIndex:0];
    if (([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) || ([[[UIDevice currentDevice] systemVersion] floatValue] == 7.0)) {
        self.tabBar.barTintColor = [UIColor whiteColor];
        self.tabBar.barStyle = 1;
    }
    [self.tabBar bringSubviewToFront:self.tabBarView];
}

- (void)creatButtonWithNormalName:(NSString *)normal andSelectName:(NSString *)selected andTitle:(NSString *)title andIndex:(int)index totalNum:(NSUInteger)tabNum
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = index + 100;
    CGFloat buttonW = _tabBarView.frame.size.width / tabNum;
    CGFloat buttonH = _tabBarView.frame.size.height;
    button.frame = CGRectMake( buttonW*index, 0, buttonW, buttonH);
    [button setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor brownColor] forState:UIControlStateSelected];
    button.imageView.contentMode = UIViewContentModeCenter; // 让图片在按钮内居中
    button.titleLabel.textAlignment = NSTextAlignmentCenter; // 让标题在按钮内居中
    button.titleLabel.font = [UIFont systemFontOfSize:10]; // 设置标题的字体大小
    //设置按钮中图片和label对象的位置
    CGSize imageSize = button.imageView.frame.size;
    CGSize titleSize = button.titleLabel.frame.size;
    button.imageEdgeInsets = UIEdgeInsetsMake(-13.0, 0.0, 0.0, -titleSize.width);
    button.titleEdgeInsets = UIEdgeInsetsMake(imageSize.height+7.0, - imageSize.width, 0.0, 0.0);
    button.adjustsImageWhenHighlighted = NO;
    [button addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBarView addSubview:button];
    if (index == 0) {
        self.previousBtn = button;
        self.previousBtn.selected = YES;
        self.previousBtn.userInteractionEnabled = NO;
    }
}

@end
