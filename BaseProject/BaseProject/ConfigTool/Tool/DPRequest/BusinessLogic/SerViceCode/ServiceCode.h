//
//  ServiceCode.h
//  BaseProject
//
//  Created by ios on 2018/8/21.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCodeModel.h"
@interface ServiceCode : NSObject
/*
    业务逻辑处理
 */
+(BOOL )processBusinessCode:(BaseCodeModel *)model;

@end
