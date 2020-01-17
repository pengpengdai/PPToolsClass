//
//  UILabel+PPLayout.m
//  BaseProject
//
//  Created by iOS on 2019/8/16.
//  Copyright © 2019 ios. All rights reserved.
//

#import "UILabel+PPLayout.h"

@implementation UILabel (PPLayout)

- (UILabel * _Nonnull (^)(NSString * _Nonnull))ppText{
    return ^(NSString *ppText){
        self.text = ppText;
        return self;
    };
}


- (UILabel * _Nonnull (^)(UIFont * _Nonnull))ppFont{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

- (UILabel * _Nonnull (^)(float))ppFontSize{
    return ^(float fontSize){
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (UILabel * _Nonnull (^)(UIColor * _Nonnull))ppTextColor{
    return ^(UIColor *textColor){
        self.textColor = textColor;
        return self;
    };
}

-(UILabel * _Nonnull (^)(NSString * _Nonnull))ppTextColorHex{
    return ^(NSString *textColorHex){
        self.textColor = DP_COLOR_HEX(textColorHex);
        return self;
    };
}

- (UILabel * _Nonnull (^)(UIColor * _Nonnull))ppShadowColor{
    return ^(UIColor *shadowColor){
        self.shadowColor = shadowColor;
        return self;
    };
}

- (UILabel * _Nonnull (^)(NSString * _Nonnull))ppShadowColorHex{
    return ^(NSString *shadowColorHex){
        self.shadowColor = DP_COLOR_HEX(shadowColorHex);
        return self;
    };
}
- (UILabel * _Nonnull (^)(CGSize))ppShadowOffset{
    return ^(CGSize shadowOffset){
        self.shadowOffset = shadowOffset;
        return self;
    };
}

- (UILabel * _Nonnull (^)(NSTextAlignment))ppTextAlignment{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

- (UILabel * _Nonnull (^)(NSLineBreakMode))ppLineBreakMode{
    return ^(NSLineBreakMode lineBreakModel){
        self.lineBreakMode = lineBreakModel;
        return self;
    };
}

- (UILabel * _Nonnull (^)(NSAttributedString * _Nonnull))ppAttributedText{
    return ^(NSAttributedString *attributedText){
        self.attributedText = attributedText;
        return self;
    };
}

- (UILabel * _Nonnull (^)(BOOL))ppHighlighted{
    return ^(BOOL highlighted){
        self.highlighted = highlighted;
        return self;
    };
}

- (UILabel * _Nonnull (^)(UIColor * _Nonnull))ppHighlightedTextColor{
    return ^(UIColor *highlightedTextColor){
        self.highlightedTextColor = highlightedTextColor;
        return self;
    };
}

@end
