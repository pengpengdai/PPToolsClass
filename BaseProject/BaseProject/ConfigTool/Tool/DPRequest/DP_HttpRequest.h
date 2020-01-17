//
//  DP_HttpRequest.h
//  BaseProject
//
//  Created by ios on 2018/8/21.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
//成功回调
typedef void(^HttpRequestSuccess)(id task , id resultOBJ);
//失败回调
typedef void(^HttpRequestFailure)(id task , NSError *error);
//请求方式
typedef enum : NSUInteger {
    DP_RequestGet,
    DP_RequestPost,
    DP_RequestPut,
    DP_RequestDelete,
    DP_RequestPost_FormDate
} DP_RequestType;

@interface DP_HttpWork : NSObject

//常规网络请求
+(void)HttpRequestType:(DP_RequestType )requestType andHttpUrl:(NSString *)httpUrl andParameters:(NSDictionary *)param andSuccessBlock:(HttpRequestSuccess )success andFailure:(HttpRequestFailure )failure;

@end

@interface DP_HttpRequest : NSObject

@property(nonatomic,strong)AFHTTPSessionManager *sessionManager;
//基础参数
@property(nonatomic)DP_RequestType type;
@property(nonatomic,strong)NSDictionary *parm;
@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)HttpRequestSuccess success;
@property(nonatomic,strong)HttpRequestFailure failure;
//请求类型
@property (nonatomic, strong) AFHTTPRequestSerializer <AFURLRequestSerialization> * requestSerializer;
//返回类型
@property (nonatomic, strong) AFHTTPResponseSerializer <AFURLResponseSerialization> * responseSerializer;

//可选设置
//是否需要打印结果日志
@property(nonatomic,assign)BOOL isResultLog;
//是否需要showError
@property(nonatomic,assign)BOOL isShowError;

-(void)beginRequest;

@end
