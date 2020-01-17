//
//  MainTabBarController.m
//  BaseProject
//
//  Created by ios on 2018/8/8.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeVC.h"
#import "CenterVC.h"
#import "PersonVC.h"
#import "MainVC.h"
#import "NAV.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTabBarContent];
}
-(void)createTabBarContent
{
    
    HomeVC *home=[HomeVC new];
    UINavigationController *homeNav=[[UINavigationController alloc]initWithRootViewController:home];
    
    CenterVC *center=[CenterVC new];
    UINavigationController *centerNav=[[UINavigationController alloc]initWithRootViewController:center];

    PersonVC *person=[PersonVC new];
    UINavigationController *personNav=[[UINavigationController alloc]initWithRootViewController:person];

    MainVC *main=[MainVC new];
    UINavigationController *mainNav=[[UINavigationController alloc]initWithRootViewController:main];

    NSArray *vcImg=@[@"tab-home_icon nor",@"tab-games-icon nor",@"tab-news_icon nor",@"tab-mine_icon nor"];
    NSArray *selectImg=@[@"tab-home_icon sel",@"tab-games-icon sel",@"tab-news_icon sel",@"tab-mine_icon sel"];
    
    NSArray *vcs=@[homeNav,centerNav,personNav,mainNav];
    NSArray *vcTitle=@[@"首页",@"球局",@"动态",@"会员"];
    
    for (int i=0; i<selectImg.count; i++) {
        UINavigationController *navVC=vcs[i];
        DPBaseViewController *VC=[[navVC viewControllers] firstObject];
        VC.title=vcTitle[i];
          NSDictionary *dictHome = [NSDictionary dictionaryWithObject:DP_COLOR_HEX(000000) forKey:NSForegroundColorAttributeName];
        [navVC.tabBarItem setTitleTextAttributes:dictHome forState:UIControlStateNormal];
        NSDictionary *selectColor = [NSDictionary dictionaryWithObject:DP_COLOR_HEX(fff000) forKey:NSForegroundColorAttributeName];
        [navVC.tabBarItem setTitleTextAttributes:selectColor forState:UIControlStateSelected];
        navVC.tabBarItem.image=[[UIImage imageNamed:vcImg[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navVC.tabBarItem.selectedImage=[[UIImage imageNamed:selectImg[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    self.viewControllers=vcs;
    
}



@end
