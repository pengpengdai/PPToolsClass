//
//  SEQChainRequest.h
//  AFNetworkingDemo
//
//  Created by ervin on 2017/10/25.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import "SEQRequest.h"

@interface SEQChainRequest : SEQRequest

/**
 链式：请求方法；
 传入：RequestGet等；
 */
- (SEQChainRequest *(^)(SEQRequestType))method;

/**
 链式：请求链接 URL；
 */
- (SEQChainRequest *(^)(NSString *))requestUrl;

/**
 链式：参数 传入字典
 */
- (SEQChainRequest *(^)(NSDictionary *))param;

/**
 链式：参数 传入文件
 */
- (SEQChainRequest *(^)(NSArray <IURequestUploadFile *> *))formFiles;

/**
 链式：请求成功Block
 传入： ^(NSURLSessionDataTask *task, id responsedObj){}
 */
- (SEQChainRequest *(^)(ResponseSuccess))responseSuccess;

/**
 链式：请求失败Block
 传入： ^(NSURLSessionDataTask *task, NSError *error){}
 */
- (SEQChainRequest *(^)(ResponseFailure))responseFailure;

/**
 链式：开始网络请求
 */
- (SEQChainRequest *(^)(ResponseProgress))responseProgress;

- (SEQChainRequest *(^)(void))requestStart;
@end
