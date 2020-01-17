//
//  SEQRequestConfig.h
//  YMShiHang
//
//  Created by ervin on 2017/11/16.
//  Copyright © 2017年 ervin. All rights reserved.
//x

#import <Foundation/Foundation.h>
#import "NetworkProtocolOBJ.h"
@interface SEQRequestConfig : NSObject
@property (nonatomic) SEQRequestType requestMethod;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, strong) NSDictionary *paramters;
@end
