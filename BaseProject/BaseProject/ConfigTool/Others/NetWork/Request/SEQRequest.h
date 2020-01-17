//
//  SEQRequest.h
//  AFNetworkingDemo
//
//  Created by ervin on 2017/10/23.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "IURequestUploadFile.h"

#if DEBUG

# define SEQLog(fmt, ...) NSLog((fmt), ##__VA_ARGS__);
#define SEQBaseUrl self.baseUrlDebug

#else

# define SEQLog(...);
#define SEQBaseUrl self.baseUrlRelease

#endif

#define KEYWINDOW [UIApplication sharedApplication].keyWindow

#define SEQWeakObj(o) __weak typeof(o) o##Weak = o;
#define SEQStrongObj(o) __strong typeof(o) o##Strong = o;

/**
 Http方法
 
 - RequestPost: Post
 - RequestGet: Get
 - RequestUpload: Upload
 - QRequestDelegate: Delegate
 */
typedef NS_ENUM(NSUInteger, SEQRequestType) {
    RequestGet,
    RequestPost,
    RequestPut,
    RequestDelete,
    RequestPost_FORM_DATA
};

/**
 传递给业务层的数据类型
 
 - SEQResponseDictionary: 字典
 - SEQResponseString: 字符串
 - SEQResponseData: 数据
 */
typedef NS_ENUM(NSUInteger, SEQResponseType) {
    SEQResponseDictionary,
    SEQResponseString,
    SEQResponseData
};

/**
 成功回调
 
 @param task task
 @param responseObj 返回数据
 */
typedef void(^ResponseSuccess)(NSURLSessionDataTask *task, id responseObj);

/**
 失败回调
 
 @param task task
 @param error error
 */
typedef void(^ResponseFailure)(NSURLSessionDataTask *task, NSError *error);

/**
 进度条回调
 
 @param progress 进度
 */
typedef void(^ResponseProgress)(NSProgress *progress);


/**
 请求协议
 */
@protocol SEQRequestProtocol <NSObject>

- (void)requestWillStart;
- (void)requestWillComplete;
- (void)requestDidComplete:(NSURLSessionDataTask *)task response:(id)responseObj;

/**
 请求失败公共处理， 一般用于添加Tost 或者全局错误处理 如：登录超时
 */
- (void)requestFailure:(NSError *)error;
@end

@interface SEQRequest : NSObject <SEQRequestProtocol>

+ (SEQRequest *)callInit;

@property (nonatomic, copy) ResponseSuccess success;//成功回调
@property (nonatomic, copy) ResponseFailure failure;//失败回调
@property (nonatomic, copy) ResponseProgress progress;//进度条回调

@property (nonatomic) SEQRequestType requestMethod;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, strong) NSDictionary *paramters;

@property (nonatomic, strong) NSArray <IURequestUploadFile *> *files;

@property (nonatomic, strong) AFHTTPRequestSerializer *requestSerializer; //请求类型

@property (nonatomic, strong) AFHTTPResponseSerializer *responseSerializer;//响应类型

@property (nonatomic, assign) NSTimeInterval timeoutInterval; //超时时间

@property (nonatomic, strong) NSArray *requestHeaderFieldArray;//请求头数组设置

@property (nonatomic, strong) NSDictionary *requestHeaderFieldValueDictionary;//请求头value

@property (nonatomic, copy) NSString *baseUrl;
- (void)netWorkMothed:(SEQRequestType)mothed paramers:(NSDictionary *)paramers success:(ResponseSuccess)success failure:(ResponseFailure)failure;
@end
