//
//  EnvironmentType.m
//  BaseProject
//
//  Created by ios on 2018/8/22.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "EnvironmentType.h"

@implementation EnvironmentType

static EnvironmentType* _instance = nil;

+(instancetype)singleInterest
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init] ;
    });
    return _instance ;
}
-(void)setEvcironmentType:(DP_ProjectEnvironment)evcironmentType
{
    _evcironmentType=evcironmentType;
    switch (evcironmentType) {
        case DP_AppStoreType:
        {
            NSString *path = [[NSBundle mainBundle] pathForResource:@"DP_AppStore" ofType:@"plist"];
            NSDictionary *dict=[NSDictionary dictionaryWithContentsOfFile:path];
            self.plistModel=[EnvironmentJsonModel mj_objectWithKeyValues:dict];
        }
            break;
        case DP_MasterType:
        {
            NSString *path = [[NSBundle mainBundle] pathForResource:@"DP_Master" ofType:@"plist"];
            NSDictionary *dict=[NSDictionary dictionaryWithContentsOfFile:path];
            self.plistModel=[EnvironmentJsonModel mj_objectWithKeyValues:dict];
        }
            break;
        case DP_ReleaseType:
        {
            NSString *path = [[NSBundle mainBundle] pathForResource:@"DP_Release" ofType:@"plist"];
            NSDictionary *dict=[NSDictionary dictionaryWithContentsOfFile:path];
            self.plistModel=[EnvironmentJsonModel mj_objectWithKeyValues:dict];
        }
            break;
        default:
            break;
    }
}
@end
