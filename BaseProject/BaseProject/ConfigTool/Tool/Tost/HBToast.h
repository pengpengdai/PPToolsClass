//
//  HBToast.h
//  HaiBaoApp
//
//  Created by ervin on 16/12/6.
//  Copyright © 2016年 ervin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, TostStyle){
    STYLEBLACK = 0,
    STYLEDARKGREEN = 1,
};
@interface HBToast : NSObject
+(void)showMessage:(NSString *)message;
+(void)showMessage:(NSString *)message style:(Style)style;
@end
