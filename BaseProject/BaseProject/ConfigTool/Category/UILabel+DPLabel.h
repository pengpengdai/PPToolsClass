//
//  UILabel+DPLabel.h
//  BaseProject
//
//  Created by iOS on 2019/8/13.
//  Copyright © 2019 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^labelMake)(UILabel *label);

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (DPLabel)

+ (UILabel *)labelMake:(labelMake )labelBlock;

+ (UILabel *)makeDPLabel:(void(^)(UILabel *pp))ppMake;

@property(readonly,nonatomic,copy) UILabel *(^setDPText)(NSString *text);

@property(readonly,nonatomic,copy) UILabel *(^setDPTextColor)(NSString *color);

- (UILabel *(^)(float fontSize))setDPFont;

//@property(nonatomic,strong) UILabel *name;

@end

NS_ASSUME_NONNULL_END
