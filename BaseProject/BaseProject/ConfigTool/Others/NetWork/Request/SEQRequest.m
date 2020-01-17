//
//  SEQRequest.m
//  AFNetworkingDemo
//
//  Created by ervin on 2017/10/23.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import "SEQRequest.h"
#import "SEQNetworking.h"
@interface SEQRequest ()
@end
@implementation SEQRequest

+ (SEQRequest *)callInit{
    return [[self alloc] init];
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.requestMethod = RequestGet;
        self.paramters = @{};
        
    }
    return self;
}
- (NSTimeInterval)timeoutInterval{
    if (!_timeoutInterval) {
        _timeoutInterval = 20;
    }
    return _timeoutInterval;
}

- (AFHTTPRequestSerializer *)requestSerializer{
    if (!_requestSerializer) {
        _requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return _requestSerializer;
}

- (AFHTTPResponseSerializer *)responseSerializer{
    if (!_responseSerializer) {
        _responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return _responseSerializer;
}

- (NSArray *)requestHeaderFieldArray {
    return nil;
}

- (NSDictionary *)requestHeaderFieldValueDictionary{
    return nil;
}


- (void)netWorkMothed:(SEQRequestType)mothed paramers:(NSDictionary *)paramers success:(ResponseSuccess)success failure:(ResponseFailure)failure{
    self.requestMethod = mothed;
    self.paramters = paramers;
//    self.requestHeaderFieldValueDictionary = [self requestHeaderFieldValueDictionary];
    [[SEQNetworking sharedNetwork] startRequestAPIWith:self progress:nil success:success failure:failure];
}

@end
