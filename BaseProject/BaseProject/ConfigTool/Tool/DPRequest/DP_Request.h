//
//  DP_Request.h
//  BaseProject
//
//  Created by ios on 2018/8/15.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "DP_HttpRequest.h"

@interface DP_Request : DP_HttpRequest

@property(readonly, nonatomic, copy)DP_Request*(^requestType)(DP_RequestType requestType);
@property(readonly, nonatomic, copy)DP_Request*(^requestParam)(NSDictionary *requestParam);
@property(readonly, nonatomic, copy)DP_Request*(^requestUrl)(NSString *requestUrl);
@property(readonly, nonatomic, copy)DP_Request*(^resultfailure)(HttpRequestFailure failure);
@property(readonly, nonatomic, copy)DP_Request*(^resultsuccess)(HttpRequestSuccess success);

@property(nonatomic,nonatomic, copy)DP_Request*(^isLog)(BOOL islog);
-(DP_Request *(^)(void))startRequest;


@end
