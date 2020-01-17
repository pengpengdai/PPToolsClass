//
//  SEQChainRequest.m
//  AFNetworkingDemo
//
//  Created by ervin on 2017/10/25.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import "SEQChainRequest.h"
#import "SEQNetworking.h"
@interface SEQChainRequest ()

@end
@implementation SEQChainRequest

- (SEQChainRequest *(^)(SEQRequestType))method{
    return ^(SEQRequestType Method){
        self.requestMethod = Method;
        return self;
    };
}

- (SEQChainRequest *(^)(NSString *))requestUrl{
    return ^(NSString *url){
        self.url = url;
        return self;
    };
}

- (SEQChainRequest *(^)(NSDictionary *))param{
    return ^(NSDictionary *para){
        self.paramters = para;
        return self;
    };
}

- (SEQChainRequest *(^)(NSArray<IURequestUploadFile *> *))formFiles {
    return ^(NSArray<IURequestUploadFile *> *files) {
        self.files = files;
        return self;
    };
}

- (SEQChainRequest *(^)(ResponseSuccess))responseSuccess{
    return ^(ResponseSuccess responseSuccess){
        self.success = responseSuccess;
        return self;
    };
}
- (SEQChainRequest *(^)(ResponseFailure))responseFailure{
    return ^(ResponseFailure responseFailure){
        self.failure = responseFailure;
        return self;
    };
}
- (SEQChainRequest *(^)(ResponseProgress))responseProgress{
    return ^(ResponseProgress responseProgress){
        self.progress = responseProgress;
        return self;
    };
}

- (SEQChainRequest *(^)(void))requestStart{
    return ^(){
        [[SEQNetworking sharedNetwork] startRequestAPIWith:self progress:self.progress success:self.success failure:self.failure];
        return self;
    };
}
@end
