//
//  HomeVC.m
//  BaseProject
//
//  Created by ios on 2018/8/8.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "HomeVC.h"
#import "DPTestVC.h"
@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
    UIButton *btn=[[UIButton alloc]init];
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
    }];

}
-(void)btnClick
{
    DPTestVC *test=[DPTestVC new];
    test.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:test animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
