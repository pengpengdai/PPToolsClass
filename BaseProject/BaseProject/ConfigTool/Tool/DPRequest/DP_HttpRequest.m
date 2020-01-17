//
//  DP_HttpRequest.m
//  BaseProject
//
//  Created by ios on 2018/8/21.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "DP_HttpRequest.h"
#import "BaseCodeModel.h"
#import "ServiceCode.h"

#pragma mark ------------- 常规封装 -------------------
@implementation DP_HttpWork
+(void)HttpRequestType:(DP_RequestType )requestType andHttpUrl:(NSString *)httpUrl andParameters:(NSDictionary *)param andSuccessBlock:(HttpRequestSuccess )success andFailure:(HttpRequestFailure )failure
{
    NSString *baseUrl=[NSString stringWithFormat:@"https://golf-release.huajiweiye.com/api/%@",httpUrl];
    httpUrl = [baseUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *currentVersion =[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"From-Client"];
    [manager.requestSerializer setValue:currentVersion forHTTPHeaderField:@"Version"];
    manager.requestSerializer.timeoutInterval = 30;
    /**
     *  请求队列的最大并发数
     */
    //    manager.operationQueue.maxConcurrentOperationCount = 5;
    switch (requestType) {
        case DP_RequestGet:
        {
            [manager GET:httpUrl parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(task,responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(task,error);
                }
            }];
            
        }
            break;
        case DP_RequestPost:
        {
            [manager POST:httpUrl parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(task,responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(task,error);
                }
            }];
            
        }
            break;
        case DP_RequestDelete:
        {
            [manager DELETE:httpUrl parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(task,responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(task,error);
                }
            }];
        }
            break;
        case DP_RequestPut:
        {
            [manager PUT:httpUrl parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(task,responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(task,error);
                }
            }];
        }
            break;
        case DP_RequestPost_FormDate:
        {
            
        }
            break;
        default:
            break;
    }
    
    
}
#pragma mark-----------验证证书-----------
+ (AFSecurityPolicy*)customSecurityPolicy{
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"证书名" ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    NSSet *set = [[NSSet alloc]initWithObjects:certData, nil];
    securityPolicy.pinnedCertificates = set;
    
    return securityPolicy;
}
@end
@implementation DP_HttpRequest
-(void)beginRequest
{
    NSString *baseUrl=[NSString stringWithFormat:@"%@%@",[EnvironmentType singleInterest].plistModel.NetworkBaseUrl,self.url];
    NSString* httpUrl = [baseUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    self.sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *currentVersion =[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [self.sessionManager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"From-Client"];
    [self.sessionManager.requestSerializer setValue:currentVersion forHTTPHeaderField:@"Version"];
    self.sessionManager.requestSerializer.timeoutInterval = 15;
    /**
     *  请求队列的最大并发数
     */
    //    manager.operationQueue.maxConcurrentOperationCount = 5;
    switch (self.type) {
        case DP_RequestGet:
        {
            [self.sessionManager GET:httpUrl parameters:self.parm progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self processSuccessful:task andResults:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self processFailure:task andResults:error];
            }];
            
        }
            break;
        case DP_RequestPost:
        {
            [self.sessionManager POST:httpUrl parameters:self.parm progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self processSuccessful:task andResults:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self processFailure:task andResults:error];
            }];
            
        }
            break;
        case DP_RequestDelete:
        {
            [self.sessionManager DELETE:httpUrl parameters:self.parm success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self processSuccessful:task andResults:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self processFailure:task andResults:error];
            }];
        }
            break;
        case DP_RequestPut:
        {
            [self.sessionManager PUT:httpUrl parameters:self.parm success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self processSuccessful:task andResults:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self processFailure:task andResults:error];
            }];
        }
            break;
        case DP_RequestPost_FormDate:
        {
            
        }
            break;
        default:
            break;
    }
}
-(void)processSuccessful:(NSURLSessionDataTask *)task andResults:(id)responseObject
{
    BaseCodeModel *codeModel=[BaseCodeModel mj_objectWithKeyValues:responseObject];
    if (self.isResultLog) {
        NSLog(@"%@",responseObject);
    }
    
    if ([ServiceCode processBusinessCode:codeModel]) {
        if (self.success) {
            self.success(task, codeModel.data);
        }
    }
}
-(void)processFailure:(NSURLSessionDataTask *)task andResults:(NSError *)error
{
    /*
     判断是否是网络问题
    */
    if (self.isResultLog) {
        NSLog(@"%@",error);
    }
    if (self.failure) {
        self.failure(task, error);
    }
}
@end
