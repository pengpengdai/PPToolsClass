//
//  DPBaseViewController.m
//  BaseProject
//
//  Created by ios on 2018/8/7.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "DPBaseViewController.h"
@interface DPBaseViewController ()

@property (nonatomic, copy) void (^rightItemClick)(UIButton *rightItem);

@end

@implementation DPBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark ----------- 返回按钮 --------------
-(void)addBackItem
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame=CGRectMake(0, 0, 25, 25);
    [backBtn setImage:[UIImage imageNamed:@"ic_back.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backItemAction) forControlEvents:UIControlEventTouchUpInside];
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}
-(void)addBackItem:(NSString *)imgName
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame=CGRectMake(0, 0, 25, 25);
    [backBtn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backItemAction) forControlEvents:UIControlEventTouchUpInside];
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}
#pragma mark --------- 返回按钮点击事件 ---------------
- (void)backItemAction{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark ------------ 右侧按钮 ---------------
- (void)addRightItemWithTitle:(NSString *)title action:(void (^)(void))action{
    UIButton *rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
    rightItem.frame = CGRectMake(0, 0, 100, 25);
    rightItem.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [rightItem setTitleColor:DP_COLOR_HEX(2E3033) forState:UIControlStateNormal];
    rightItem.titleLabel.font = DP_FontWeight(14, UIFontWeightRegular);
    [rightItem setTitle:title forState:UIControlStateNormal];
    //block改成rac
    [[rightItem rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (action) {
            action();
        }
    }];
    //    [rightItem addTarget:self action:[self selectorBlock:^(id weak, id arg) {
    //        if (action) {
    //            action();
    //        }
    //    }] forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightItem];
    self.navigationItem.rightBarButtonItem = item;
}
- (void)addRightItemWithImageName:(NSString *)imageName action:(void (^)(void))action{
    UIButton *rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
    rightItem.frame = CGRectMake(0, 0, 80, 25);
    [rightItem setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //block改成rac
    [[rightItem rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (action) {
            action();
        }
    }];
    //    [rightItem addTarget:self action:[self selectorBlock:^(id weak, id arg) {
    //        if (action) {
    //            action();
    //        }
    //    }] forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightItem];
    self.navigationItem.rightBarButtonItem = item;
}
- (void)addRightItemWithImageName:(NSString *)imageName itemFrame:(CGRect)frame action:(void (^)(void))action{
    UIButton *rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
    rightItem.frame = frame;
    [rightItem setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //block改成rac
    [[rightItem rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (action) {
            action();
        }
    }];
    //    [rightItem addTarget:self action:[self selectorBlock:^(id weak, id arg) {
    //        if (action) {
    //            action();
    //        }
    //    }] forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightItem];
    self.navigationItem.rightBarButtonItem = item;
}
- (void)addRightItemWithImageNames:(NSArray *)imageNames action:(void (^)(UIButton *rightItem))action{
    self.rightItemClick = action;
    NSMutableArray *items = [NSMutableArray new];
    for (int i = 0; i < imageNames.count; i ++) {
        UIButton *rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
        rightItem.frame = CGRectMake(0, 0, 25, 25);
        NSString *image = [imageNames objectAtIndex:i];
        rightItem.tag = i;
        [rightItem setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [rightItem addTarget:self action:@selector(rightItemClick:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightItem];
        [items addObject:item];
    }
    self.navigationItem.rightBarButtonItems = items;
}
- (void)rightItemClick:(UIButton *)btn{
    if (self.rightItemClick) {
        self.rightItemClick(btn);
    }
}

@end
