//
//  UILabel+DPLabel.m
//  BaseProject
//
//  Created by iOS on 2019/8/13.
//  Copyright © 2019 ios. All rights reserved.
//

#import "UILabel+DPLabel.h"

@implementation UILabel (DPLabel)
+ (UILabel *)makeDPLabel:(void(^)(UILabel *pp))ppMake{
    UILabel *ppLabel = [[UILabel alloc]init];
    ppMake(ppLabel);
    return ppLabel;
};

+ (UILabel *)labelMake:(labelMake)labelBlock{
    UILabel *ll = [UILabel new];
    labelBlock(ll);
    return ll;
}

- (UILabel * _Nonnull (^)(NSString * _Nonnull))setDPText{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(float fontSize))setDPFont{
    return ^(float fontSize){
        self.font = DP_Font(fontSize);
        return self;
    };
}

- (UILabel * _Nonnull (^)(NSString * _Nonnull))setDPTextColor{
    return ^(NSString *textColor){
        self.textColor = DP_COLOR_HEXSTR(textColor);
        return self;
    };
}

@end
