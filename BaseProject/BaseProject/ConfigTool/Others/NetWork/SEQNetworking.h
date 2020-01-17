//
//  SEQNetWorking.h
//  AFNetworkingDemo
//
//  Created by ervin on 2017/9/7.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@class SEQRequest;

typedef NS_ENUM(NSInteger, DelegateType) {
    SuccessType,
    FailureType,
    ProgressType
};

@protocol NetWorkingDelegate <NSObject>

- (void)networkingProgress:(NSProgress *)downloadProgress;

- (void)networkingSuccess:(NSURLSessionDataTask *)task response:(id)responseObje;

- (void)networkingFailure:(NSURLSessionDataTask *)task error:(NSError *)error;
@end

@interface SEQNetworking : NSObject

@property (nonatomic, weak) id<NetWorkingDelegate> delegate;

+ (instancetype)sharedNetwork;

- (void)startRequestAPIWith:(SEQRequest *)request progress:(void(^)(NSProgress *progress))progress success:(void(^)(NSURLSessionDataTask *task, id response))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;
@end
