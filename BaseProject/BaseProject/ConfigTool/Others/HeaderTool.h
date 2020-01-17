//
//  HeaderTool.h
//  BaseProject
//
//  Created by ios on 2018/8/3.
//  Copyright © 2018年 ios. All rights reserved.
//

#ifndef HeaderTool_h
#define HeaderTool_h



#pragma mark-------屏幕适配------------
//屏宽高
#define DP_Screen [UIScreen mainScreen]
#define DP_WIDTH DP_Screen.bounds.size.width
#define DP_HEIGHT DP_Screen.bounds.size.height
//屏适配
#define DP_SPWIDTH DP_WIDTH/375.0
#define DP_SPHEIGHT DP_HEIGHT/667.0
#define DP_RectMake(x,y,w,h) CGRectMake(x*DP_SPWIDTH, y*DP_SPHEIGHT, w*DP_SPWIDTH, h*DP_SPHEIGHT)
//状态栏的高度
#define DP_STATUS_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
//navbar高度
#define DP_NAVBAR_HEIGHT 44
//状态栏+导航条（距离头部高度）
#define DP_TOPHEIGHT (DP_STATUS_HEIGHT + DP_NAVBAR_HEIGHT)
//tabbar高度
#define DP_TABBAR_HEIGHT  ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
//倍图比例
#define DP_SALEC [[UIScreen mainScreen] scale]


#pragma mark-------color-------------
#define DP_RGBA_Color(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define DP_RGB_Color(r, g, b) DP_RGBA_Color(r, g, b, 1.0)
#define DP_COLOR_HEX(STR) [UIColor DP_ColorWithHexString:DP_STRING(STR)]
#define DP_COLOR_HEXSTR(str) [UIColor DP_ColorWithHexString:str]

#pragma mark--------- STRING -----------
//字符串
#define DP_STRING(STR) [NSString stringWithCString:__STRING(STR) encoding:NSUTF8StringEncoding]
#define DP_STRING_FORMAT(...) [NSString stringWithFormat:__VA_ARGS__]
//字符串
#define DP_StringFormat(Y,S) [NSString stringWithFormat:@"%@%@",Y,S]

#pragma mark--------- Font ------------
//字体的大小
#define DP_Font(x) [UIFont systemFontOfSize:(x)]
//字体的大小传入字体宽度
#define DP_FontWeight(Size,UIFontWeight) [UIFont systemFontOfSize:Size weight:UIFontWeight]
#define DP_FontWithName(Name,Size) [UIFont fontWithName:Name size:Size]
#pragma mark-------- 通知 -------------
#define DP_NotificationCenter [NSNotificationCenter defaultCenter]
#pragma mark -----------弱引用、强引用--------------------
#define DP_WEAKSELF typeof(self) __weak weakSelf = self;
#define WeaklySelf(weakSelf)  __weak __typeof(&*self)weakSelf = self
#define StronglySelf(strongSelf)  __strong __typeof(&*self)strongSelf = self

/**
 *  是否开启https SSL 验证
 *
 *  @return YES为开启，NO为关闭
 */
#define openHttpsSSL NO

#pragma mark---------- Request ------------
#define DPRequestTool [[DP_Request alloc]init]
#define DPConfigInfoModel [EnvironmentType singleInterest].plistModel


#endif /* HeaderTool_h */
