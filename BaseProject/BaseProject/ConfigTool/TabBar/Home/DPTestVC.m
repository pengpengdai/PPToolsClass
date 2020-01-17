//
//  DPTestVC.m
//  BaseProject
//
//  Created by ios on 2018/8/8.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "DPTestVC.h"

@interface DPTestVC ()

@end

@implementation DPTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addBackItem];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"测试页面";
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100,100, 100, 100)];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}
-(void)btnClick
{
    DPTestVC *test=[DPTestVC new];
    test.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:test animated:YES];
}
@end
