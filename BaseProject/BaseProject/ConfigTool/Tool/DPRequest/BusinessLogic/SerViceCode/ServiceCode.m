//
//  ServiceCode.m
//  BaseProject
//
//  Created by ios on 2018/8/21.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "ServiceCode.h"

@implementation ServiceCode

+(BOOL )processBusinessCode:(BaseCodeModel *)model
{
    if (model.code==0) {
        return YES;
    }else
    {
        [self showErrorMessage:model.msg];
        return NO;
    }
}
+(void)showErrorMessage:(NSString *)msg
{
    [HBToast showMessage:msg];
}

@end
