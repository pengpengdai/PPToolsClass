//
//  DP_Request.m
//  BaseProject
//
//  Created by ios on 2018/8/15.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "DP_Request.h"

@implementation DP_Request
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sessionManager=[AFHTTPSessionManager manager];
    }
    return self;
}
-(DP_Request *(^)(DP_RequestType))requestType
{
    return ^(DP_RequestType requestType){
        self.type = requestType;
        return self;
    };
}
-(DP_Request *(^)(NSString *))requestUrl
{
    return ^(NSString *requestUrl)
    {
        self.url=requestUrl;
        return self;
    };
}
-(DP_Request *(^)(NSDictionary *))requestParam
{
    return ^(NSDictionary *requestParam)
    {
        self.parm=requestParam;
        return self;
    };
}
-(DP_Request *(^)(HttpRequestFailure))resultfailure
{
    return ^(HttpRequestFailure resultfailure)
    {
        self.failure = resultfailure;
        return self;
    };
}
-(DP_Request *(^)(HttpRequestSuccess))resultsuccess
{
    return ^(HttpRequestSuccess resultsuccess)
    {
        self.success = resultsuccess;
        return self;
    };
}
-(DP_Request *(^)(BOOL))isLog
{
    return ^(BOOL isLog)
    {
        self.isResultLog=isLog;
        return self;
    };
}
-(DP_Request *(^)(void))startRequest
{
    return ^()
    {
        [self beginRequest];
        return self;
    };
}
@end
