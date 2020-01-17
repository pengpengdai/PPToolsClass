//
//  CustomMadeOBJ.m
//  Woxin2.0
//
//  Created by Elty on 10/5/14.
//  Copyright (c) 2014 le ting. All rights reserved.
//

//测试服务器
#define NetWorkProtocol_BaseURL  @"NetWorkProtocol_BaseURL"//后台接口api

#define NetWorkProtocol_Public @"NetWorkProtocol_Public"//公共服务api

#define NetWorkProtocol_Html @"NetWorkProtocol_Html"//html服务api

#import "NetworkProtocolOBJ.h"

@interface NetworkProtocolOBJ()
{
    NSDictionary *_customMadeDic;
    XBApp_Type _type;
}
@end


@implementation NetworkProtocolOBJ

+ (NetworkProtocolOBJ *)sharedNetworkProtocolOBJ{
    static dispatch_once_t onceToken;
    static NetworkProtocolOBJ *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NetworkProtocolOBJ alloc] init];
    });
    return sharedInstance;
}


- (void)setAppType:(XBApp_Type)type{
    NSString *path = nil;
    
    switch (type) {
        case XBApp_Type_AppStore:
            path =  [[NSBundle mainBundle] pathForResource:@"AppStoreNetworkProtocol" ofType:@"plist"];
            break;
        case XBApp_Type_Release:
            path =  [[NSBundle mainBundle] pathForResource:@"ReleaseNetworkProtocol" ofType:@"plist"];
            break;
        case XBApp_Type_Master:
            path =  [[NSBundle mainBundle] pathForResource:@"MasterNetworkProtocol" ofType:@"plist"];
            break;
        default:  NSLog(@"-------- 警告!未选择打包模式 --------------");
            break;
    }
    
    _customMadeDic = [NSDictionary dictionaryWithContentsOfFile:path];
//    [RefreshStatus SimpleInterest].pushStateStr=_customMadeDic[@"PushState"];
}
//正式
//#define HTTIP @"http://scbank.51vest.com/api"
//#define HTML_URL @"http://scbank.51vest.com/neo-bank/html"
//#define PublicHttp @"https://public-service-gateway.51doro.com/api"

//new正式
//#define HTTIP @"https://srcbank.51vest.com/api"
//#define HTML_URL @"https://srcbank.51vest.com/neo-bank/html"
//#define PublicHttp @"https://public-service-gateway.51doro.com/api"

//选择接口
- (NSString*)XBMyteamBaseURL{
    NSString *merchantName = [_customMadeDic objectForKey:NetWorkProtocol_BaseURL];
    return merchantName;
}

/**
 选择html api
 */
- (NSString *)XBMYteamHtmlURL{
    NSString *merchantName = [_customMadeDic objectForKey:NetWorkProtocol_Html];
    return merchantName;
}
/**
 选择公共服务 api
 */
- (NSString *)XBMYteamPublicURL{
    NSString *merchantName = [_customMadeDic objectForKey:NetWorkProtocol_Public];
    return merchantName;
}
- (XBApp_Type)appType{
    return _type;
}

@end
