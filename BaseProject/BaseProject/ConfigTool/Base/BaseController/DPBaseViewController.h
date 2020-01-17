//
//  DPBaseViewController.h
//  BaseProject
//
//  Created by ios on 2018/8/7.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPBaseViewController : UIViewController
//常规返回按钮
-(void)addBackItem;
//非常规返回按钮
-(void)addBackItem:(NSString *)imgName;

//右侧Item
- (void)addRightItemWithTitle:(NSString *)title action:(void (^)(void))action;
- (void)addRightItemWithImageName:(NSString *)imageName action:(void (^)(void))action;
- (void)addRightItemWithImageName:(NSString *)imageName itemFrame:(CGRect)frame action:(void (^)(void))action;

- (void)addRightItemWithImageNames:(NSArray *)imageNames action:(void (^)(UIButton *rightItem))action;

@end
