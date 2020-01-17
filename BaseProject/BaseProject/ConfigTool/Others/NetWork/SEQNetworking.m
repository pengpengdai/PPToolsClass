//
//  SEQNetWorking.m
//  AFNetworkingDemo
//
//  Created by ervin on 2017/9/7.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import "SEQNetworking.h"
static SEQNetworking *netWorking = nil;
@interface SEQNetworking ()
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@end
@implementation SEQNetworking
+ (instancetype)sharedNetwork{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netWorking = [[SEQNetworking alloc] init];
    });
    return netWorking;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        self.sessionManager = [AFHTTPSessionManager manager];
        
    }
    return self;
}

- (AFHTTPRequestSerializer *)requestSeriailzerForRequest:(SEQRequest *)request {
    AFHTTPRequestSerializer *requestSerializer = request.requestSerializer;
    requestSerializer.timeoutInterval = [request timeoutInterval];
    NSArray *authorizationHeaderFieldArray = [request requestHeaderFieldArray];
    if (authorizationHeaderFieldArray != nil) {
        [requestSerializer setAuthorizationHeaderFieldWithUsername:authorizationHeaderFieldArray.firstObject password:authorizationHeaderFieldArray.lastObject];
    }
    NSDictionary *headerFieldValueDictionary = [request requestHeaderFieldValueDictionary];
    if (headerFieldValueDictionary != nil) {
        for (NSString *httpHeaderField in headerFieldValueDictionary.allKeys) {
            NSString *value = [headerFieldValueDictionary objectForKey:httpHeaderField];
            [requestSerializer setValue:value forHTTPHeaderField:httpHeaderField];
        }
    }
    SEQLog(@"\n==========请求头==========\n[请求头：%@]\n==========请求头打印结束==========",requestSerializer.HTTPRequestHeaders);
    return requestSerializer;
}

- (void)startRequestAPIWith:(SEQRequest *)request progress:(void(^)(NSProgress *progress))progress success:(ResponseSuccess)success failure:(ResponseFailure)failure{
    __block NSURLSessionDataTask *dataTask = nil;
    _sessionManager.requestSerializer = [self requestSeriailzerForRequest:request];
    _sessionManager.responseSerializer = request.responseSerializer;
    self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects: @"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
//    WEAKSELF
    request.url = [NSString stringWithFormat:@"%@%@",request.baseUrl,request.url];
    request.url = [request.url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if ([request respondsToSelector:@selector(requestWillStart)]) {
        [request requestWillStart];
    }
    SEQLog(@"\n==========请求参数==========\n[URL:]%@\n[参数:]%@\n==========请求参数与打印结束==========\n",request.url,request.paramters);
    switch (request.requestMethod) {
        case RequestGet:
        {
            dataTask = [_sessionManager GET:request.url parameters:request.paramters progress:^(NSProgress * _Nonnull downloadProgress) {

                if (progress) {
                    progress(downloadProgress);
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                SEQLog(@"\n==========请求成功==========\n[DataTask:%@]\n[URL:]%@\n[参数:]%@\n[数据:]%@\n==========请求成功打印结束==========\n",task,request.url,request.paramters,responseObject);
                if ([request respondsToSelector:@selector(requestDidComplete:response:)]) {
                    [request requestDidComplete:task response:responseObject];
                }else{
                    if (success) {
                        success(task, responseObject);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                [weakSelf errorLogin:error];
                SEQLog(@"\n*************请求失败*************\n[DataTask:%@]\n[URL:]%@\n[error:]%@\n*************请求失败打印结束*************",task,request.url,error);
                if ([request respondsToSelector:@selector(requestFailure:)]) {
                    [request requestFailure:error];
                }
                
                if (failure) {
                    failure(task,error);
                }
            }];
        }
            break;
        case RequestPost:
        {
            dataTask = [_sessionManager POST:request.url parameters:request.paramters progress:^(NSProgress * _Nonnull uploadProgress) {
                if (progress) {
                    progress(uploadProgress);
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                SEQLog(@"\n==========请求成功==========\n[DataTask:%@]\n[URL:]%@\n[参数:]%@\n[数据:]%@\n==========请求成功打印结束==========",task,request.url,request.paramters,responseObject);
                if ([request respondsToSelector:@selector(requestDidComplete:response:)]) {
                    [request requestDidComplete:task response:responseObject];
                }else{
                    if (success) {
                        success(task, responseObject);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                SEQLog(@"\n*************请求失败*************\n[DataTask:%@]\n[URL:]%@\n[error:]%@\n*************请求失败打印结束*************",task,request.url,error);
                if ([request respondsToSelector:@selector(requestFailure:)]) {
                    [request requestFailure:error];
                }
                
                if (failure) {
                    failure(task ,error);
                }
            }];
        }
            break;
        case RequestPut:
        {
            dataTask = [_sessionManager PUT:request.url parameters:request.paramters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                SEQLog(@"\n==========请求成功==========\n[DataTask:%@]\n[URL:]%@\n[参数:]%@\n[数据:]%@\n==========请求成功打印结束==========",task,request.url,request.paramters,responseObject);
                if ([request respondsToSelector:@selector(requestDidComplete:response:)]) {
                    [request requestDidComplete:task response:responseObject];
                }else{
                    if (success) {
                        success(task, responseObject);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                SEQLog(@"\n*************请求失败*************\n[DataTask:%@]\n[URL:]%@\n[error:]%@\n*************请求失败打印结束*************",task,request.url,error);
                if ([request respondsToSelector:@selector(requestFailure:)]) {
                    [request requestFailure:error];
                }
                
                if (failure) {
                    failure(task,error);
                }
            }];
        }
            break;
        case RequestDelete:
        {
            dataTask = [_sessionManager DELETE:request.url parameters:request.paramters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                SEQLog(@"\n==========请求成功==========\n[DataTask:%@]\n[URL:]%@\n[参数:]%@\n[数据:]%@\n==========请求成功打印结束==========",task,request.url,request.paramters,responseObject);
                if ([request respondsToSelector:@selector(requestDidComplete:response:)]) {
                    [request requestDidComplete:task response:responseObject];
                }else{
                    if (success) {
                        success(task, responseObject);
                    }
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                SEQLog(@"\n*************请求失败*************\n[DataTask:%@]\n[URL:]%@\n[error:]%@\n*************请求失败打印结束*************",task,request.url,error);
                if ([request respondsToSelector:@selector(requestFailure:)]) {
                    [request requestFailure:error];
                }
                
                if (failure) {
                    failure(task,error);
                }
            }];
        }
            break;
        case RequestPost_FORM_DATA:
        {
            void(^block)(id<AFMultipartFormData>) = ^(id<AFMultipartFormData>  _Nonnull formData) {
                [request.files enumerateObjectsUsingBlock:^(IURequestUploadFile * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [formData appendPartWithFileData:obj.data
                                                name:obj.name
                                            fileName:obj.fileName
                                            mimeType:obj.mimeType];
                }];
            };
            
            dataTask = [_sessionManager POST:request.url
                                  parameters:request.paramters
                   constructingBodyWithBlock:block
                                    progress:nil
                                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                         SEQLog(@"\n==========请求成功==========\n[DataTask:%@]\n[URL:]%@\n[参数:]%@\n[数据:]%@\n==========请求成功打印结束==========",task,request.url,request.paramters,responseObject);
                                         if ([request respondsToSelector:@selector(requestDidComplete:response:)]) {
                                             [request requestDidComplete:task response:responseObject];
                                         }else{
                                             if (success) {
                                                 success(task, responseObject);
                                             }
                                         }
                                     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                         SEQLog(@"\n*************请求失败*************\n[DataTask:%@]\n[URL:]%@\n[error:]%@\n*************请求失败打印结束*************",task,request.url,error);
                                         if ([request respondsToSelector:@selector(requestFailure:)]) {
                                             [request requestFailure:error];
                                         }
                                         
                                         if (failure) {
                                             failure(task,error);
                                         }
                                     }];

        }
            break;
        default:
            break;
    }
}

- (void)errorLogin:(NSError *)error{
    if (error) {
        NSData *responseData = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        if (responseData) {
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:NULL];
            NSLog(@"请求失败error: %@",response);
        }
    }
}

- (void)implementationAgent:(DelegateType)type task:(NSURLSessionDataTask *)task response:(id)responseObject error:(NSError *)error progress:(NSProgress *)progress{
    switch (type) {
        case ProgressType:
            if ([self.delegate respondsToSelector:@selector(networkingProgress:)]) {
                [self.delegate networkingProgress:progress];
            }
            break;
          
        case SuccessType:
            if ([self.delegate respondsToSelector:@selector(networkingSuccess:response:)]) {
                [self.delegate networkingSuccess:task response:responseObject];
            }
            break;
            
        case FailureType:
            if ([self.delegate respondsToSelector:@selector(networkingFailure:error:)]) {
                [self.delegate networkingFailure:task error:error];
            }
            break;
        default:
            break;
    }
}
#pragma mark ---- 自定义 -----
- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                               requestSerializer:(AFHTTPRequestSerializer *)requestSerializer
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                           error:(NSError * _Nullable __autoreleasing *)error {
    return [self dataTaskWithHTTPMethod:method requestSerializer:requestSerializer URLString:URLString parameters:parameters constructingBodyWithBlock:nil error:error];
}
- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                               requestSerializer:(AFHTTPRequestSerializer *)requestSerializer
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                       constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                                           error:(NSError * _Nullable __autoreleasing *)error {
    NSMutableURLRequest *request = nil;
    
    if (block) {
        request = [requestSerializer multipartFormRequestWithMethod:method URLString:URLString parameters:parameters constructingBodyWithBlock:block error:error];
    } else {
        request = [requestSerializer requestWithMethod:method URLString:URLString parameters:parameters error:error];
    }
    
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [_sessionManager dataTaskWithRequest:request
                           completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *_error) {
                               
                           }];
    
    return dataTask;
}
@end
