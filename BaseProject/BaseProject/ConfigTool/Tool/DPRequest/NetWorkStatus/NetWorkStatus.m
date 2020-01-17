//
//  NetWorkStatus.m
//  BaseProject
//
//  Created by ios on 2018/8/22.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "NetWorkStatus.h"



@implementation NetWorkStatus
+(void)DPGetNetworkStatus
{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
                //            case AFNetworkReachabilityStatusUnknown:
                //                NSLog(@"未知");
                //                break;
                
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"3G|4G");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi");
                break;
                
            default:
                break;
                
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}


@end
