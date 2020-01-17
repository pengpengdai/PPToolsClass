//
//  HBToast.m
//  HaiBaoApp
//
//  Created by ervin on 16/12/6.
//  Copyright © 2016年 ervin. All rights reserved.
//

#import "HBToast.h"
@interface HBToast()
@property (nonatomic) UILabel *tost;
@end
@implementation HBToast
+(void)showMessage:(NSString *)message{
    [[HBToast sharedManager] showWindow:message style:STYLEBLACK];
}
+(void)showMessage:(NSString *)message style:(Style)style{
    [[HBToast sharedManager] showWindow:message style:style];
}
+ (instancetype)sharedManager{
    static HBToast *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HBToast alloc] init];
        instance.tost = [[UILabel alloc] init];
        instance.tost.alpha = 0;
        instance.tost.font = DP_FontWeight(14, UIFontWeightMedium);
        instance.tost.text = @"    赋予宽度   ";
        instance.tost.textColor = [UIColor whiteColor];
        instance.tost.textAlignment = NSTextAlignmentCenter;
        instance.tost.layer.cornerRadius = 38/2;
        instance.tost.layer.masksToBounds = YES;
        UIWindow * window = [[UIApplication sharedApplication].delegate window];
        [window addSubview:instance.tost];
        [instance.tost mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(window);
            make.height.mas_equalTo(38);
            make.top.equalTo(window).offset(20);
        }];
    });
    return instance;
}
- (CGFloat)calculateRowWidth:(NSString *)string {
    NSDictionary *dic = @{NSFontAttributeName:DP_FontWeight(14, UIFontWeightMedium)};  //指定字号
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, 20)/*计算宽度时要确定高度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width + 40;
}
- (void)showWindow:(NSString *)msg style:(TostStyle)style{
    UIWindow * window = [[UIApplication sharedApplication].delegate window];
    [window addSubview:self.tost];

    [self.tost.layer removeAllAnimations];
    self.tost.text = DP_STRING_FORMAT(@"  %@            ",msg);
    switch (style) {
        case STYLEBLACK:
            self.tost.backgroundColor = DP_COLOR_HEX(2E3033);
            break;
        case STYLEDARKGREEN:
            self.tost.backgroundColor = DP_COLOR_HEX(3E706B);
            break;
        default:
            break;
    }
    DP_WEAKSELF
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.25 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [weakSelf downAnimation:msg style:style];
    });
}

- (void)downAnimation:(NSString *)msg style:(TostStyle)style{
    UIWindow * window = [[UIApplication sharedApplication].delegate window];
//    [window layoutIfNeeded];
    DP_WEAKSELF
    [self.tost mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(window).offset(50);
    }];
    [UIView animateWithDuration:.5 animations:^{
        weakSelf.tost.alpha = 1;
        [window layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self upAnimation];
    }];
}
- (void)upAnimation{
    UIWindow * window = [[UIApplication sharedApplication].delegate window];
//    [window layoutIfNeeded ];
    DP_WEAKSELF
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [weakSelf.tost mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(window).offset(20);
        }];
        [UIView animateWithDuration:.5f animations:^{
            weakSelf.tost.alpha = 0;
            [window layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    });
}
@end
