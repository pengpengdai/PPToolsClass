//
//  UILabel+PPLayout.h
//  BaseProject
//
//  Created by iOS on 2019/8/16.
//  Copyright © 2019 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+IUChain.h"

NS_ASSUME_NONNULL_BEGIN
@interface UILabel (PPLayout)

@property(readonly,nonatomic,copy) UILabel *(^ppText)(NSString *text);      // default is nil
@property(readonly,nonatomic,copy) UILabel *(^ppFont)(UIFont *font);    // default is nil (system font 17 plain)
@property(readonly,nonatomic,copy) UILabel *(^ppFontSize)(float fontSize);      // SystemFont
@property(readonly,nonatomic,copy) UILabel *(^ppTextColor)(UIColor *textColor);
@property(readonly,nonatomic,copy) UILabel *(^ppTextColorHex)(NSString *colorHex);      // default is nil (text draws black)
@property(readonly,nonatomic,copy) UILabel *(^ppShadowColor)(UIColor *shadowColor);
@property(readonly,nonatomic,copy) UILabel *(^ppShadowColorHex)(NSString *shadowColorHex);// default is nil (no shadow)
@property(readonly,nonatomic,copy) UILabel *(^ppShadowOffset)(CGSize shadowOffset);   // default is CGSizeMake(0, -1) -- a top shadow
@property(readonly,nonatomic,copy) UILabel *(^ppTextAlignment)(NSTextAlignment textAlignment);;   // default is NSTextAlignmentNatural (before iOS 9, the default was NSTextAlignmentLeft)
@property(readonly,nonatomic,copy) UILabel *(^ppLineBreakMode)(NSLineBreakMode lineBreakMode);   // default is NSLineBreakByTruncatingTail. used for single and multiple lines of text

// the underlying attributed string drawn by the label, if set, the label ignores the properties above.
@property(readonly,nonatomic,copy) UILabel *(^ppAttributedText)(NSAttributedString *attributedText); //NS_AVAILABLE_IOS(6_0);   default is nil

// the 'highlight' property is used by subclasses for such things as pressed states. it's useful to make it part of the base class as a user property

@property(readonly,nonatomic,copy) UILabel *(^ppHighlightedTextColor)(UIColor *highlightedTextColor);   // default is nil
@property(readonly,nonatomic,copy) UILabel *(^ppHighlighted)(BOOL highlighted);       // default is NO
@property(readonly,nonatomic,copy) UILabel *(^ppUserInteractionEnabled)(BOOL userInteractionEnabled);  // default is NO
@property(readonly,nonatomic,copy) UILabel *(^ppEnabled)(BOOL enabled);                 // default is YES. changes how the label is drawn

// this determines the number of lines to draw and what to do when sizeToFit is called. default value is 1 (single line). A value of 0 means no limit
// if the height of the text reaches the # of lines or the height of the view is less than the # of lines allowed, the text will minimumScaleFactorbe
// truncated using the line break mode.

@property(readonly,nonatomic,copy) UILabel *(^ppNumberOfLines)(NSInteger numberOfLines);

// these next 3 properties allow the label to be autosized to fit a certain width by scaling the font size(s) by a scaling factor >= the minimum scaling factor
// and to specify how the text baseline moves when it needs to shrink the font.

@property(readonly,nonatomic,copy) UILabel *(^ppAdjustsFontSizeToFitWidth)(BOOL adjustsFontSizeToFitWidth);     // default is NO
@property(readonly,nonatomic,copy) UILabel *(^ppBaselineAdjustment)(UIBaselineAdjustment baselineAdjustment); // default is UIBaselineAdjustmentAlignBaselines
@property(readonly,nonatomic,copy) UILabel *(^ppMinimumScaleFactor)(CGFloat minimumScaleFactor);//NS_AVAILABLE_IOS(6_0)  default is 0.0


// Tightens inter-character spacing in attempt to fit lines wider than the available space if the line break mode is one of the truncation modes before starting to truncate.
// The maximum amount of tightening performed is determined by the system based on contexts such as font, line width, etc.
@property(readonly,nonatomic,copy) UILabel *(^ppAllowsDefaultTighteningForTruncation)(BOOL allowsDefaultTighteningForTruncation);   // NS_AVAILABLE_IOS(9_0); // default is NO

// Support for constraint-based layout (auto layout)
// If nonzero, this is used when determining -intrinsicContentSize for multiline labels
@property(readonly,nonatomic,copy) UILabel *(^ppPreferredMaxLayoutWidth)(CGFloat preferredMaxLayoutWidth) NS_AVAILABLE_IOS(6_0);// NS_AVAILABLE_IOS(6_0);


// If YES, the UILabel will scroll its text while any of its immediate or distant superviews become focused. Also, lineBreakMode, adjustsFontSizeToFitWidth, and allowsDefaultTighteningForTruncation are ignored.
@property(readonly,nonatomic,copy) UILabel *(^ppEnablesMarqueeWhenAncestorFocused)(BOOL enablesMarqueeWhenAncestorFocused) API_AVAILABLE(tvos(12.0)) API_UNAVAILABLE(ios, watchos);


// deprecated:
@property(readonly,nonatomic,copy) UILabel *(^ppMinimumFontSize)(CGFloat minimumFontSize) NS_DEPRECATED_IOS(2_0, 6_0) __TVOS_PROHIBITED; // deprecated - use minimumScaleFactor. default is 0.0

// Non-functional.  Hand tune by using NSKernAttributeName to affect tracking, or consider using the allowsDefaultTighteningForTruncation property.
@property(readonly,nonatomic,copy) UILabel *(^ppAdjustsLetterSpacingToFitWidth)(BOOL adjustsLetterSpacingToFitWidth) NS_DEPRECATED_IOS(6_0,7_0) __TVOS_PROHIBITED;


@end

NS_ASSUME_NONNULL_END
