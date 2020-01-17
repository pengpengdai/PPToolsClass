//
//  BaseCodeModel.h
//  BaseProject
//
//  Created by ios on 2018/8/21.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCodeModel : NSObject
@property(nonatomic,assign) NSInteger code;
@property(nonatomic,strong) NSDictionary *data;
@property(nonatomic,strong) NSString *msg;
@end
