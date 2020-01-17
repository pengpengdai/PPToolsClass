//
//  EnvironmentType.h
//  BaseProject
//
//  Created by ios on 2018/8/22.
//  Copyright © 2018年 ios. All rights reserved.
//
//工程环境的配置
#import <Foundation/Foundation.h>
#import "EnvironmentType.h"
#import "EnvironmentJsonModel.h"

typedef enum : NSUInteger {
    DP_AppStoreType,
    DP_MasterType,
    DP_ReleaseType,
} DP_ProjectEnvironment;

@interface EnvironmentType : NSObject

+(instancetype)singleInterest;

@property(nonatomic) DP_ProjectEnvironment evcironmentType;

@property(nonatomic,strong)EnvironmentJsonModel *plistModel;


@end
