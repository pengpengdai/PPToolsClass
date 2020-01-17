//
//  DPBrowserVC.h
//  BaseProject
//
//  Created by ios on 2018/8/24.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    DP_Image_DataType,
    DP_Image_ImageType,
    DP_Image_NSURLImageType,
} DP_BrowserType;

@interface DPBrowserVC : UIViewController

@property(nonatomic,strong)UIScrollView *browserScrollView;

@property(nonatomic,assign) DP_BrowserType browserType;

@property(nonatomic,strong)NSArray *browserArr;

@end
