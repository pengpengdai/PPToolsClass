//
//  DPBrowserVC.m
//  BaseProject
//
//  Created by ios on 2018/8/24.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "DPBrowserVC.h"

@interface DPBrowserVC ()

@end

@implementation DPBrowserVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIScrollView *)browserScrollView
{
    if (!_browserScrollView) {
        _browserScrollView=[[UIScrollView alloc]init];
        _browserScrollView.backgroundColor=[UIColor blackColor];
        _browserScrollView.contentOffset=CGPointMake(0, 0);
        _browserScrollView.contentSize=CGSizeMake(self.browserArr.count*DP_WIDTH, DP_HEIGHT);
//        当值是 YES 会自动滚动到 subview 的边界（默认NO）
        _browserScrollView.pagingEnabled = YES;
//        水平方向
        _browserScrollView.showsHorizontalScrollIndicator = NO;
//        垂直方向
        _browserScrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_browserScrollView];
        [_browserScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.equalTo(self.view);
        }];
    }
    return _browserScrollView;
}
-(CGSize )getImageSize:(UIImage *)img
{
    return CGSizeMake(DP_WIDTH, DP_WIDTH*(img.size.height/img.size.width));
}

@end
