//
//  NetWorkStatus.h
//  BaseProject
//
//  Created by ios on 2018/8/22.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    DP_AFNetworkReachabilityStatusUnknown          = -1,
    DP_AFNetworkReachabilityStatusNotReachable     = 0,
    DP_AFNetworkReachabilityStatusReachableViaWWAN = 1,
    DP_AFNetworkReachabilityStatusReachableViaWiFi = 2,
} DP_NetworkType;

@interface NetWorkStatus : NSObject

+(void)DPGetNetworkStatus;

@end
