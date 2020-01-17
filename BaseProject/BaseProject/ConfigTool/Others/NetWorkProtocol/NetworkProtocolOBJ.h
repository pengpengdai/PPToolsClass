//
//  CustomMadeOBJ.h
//  Woxin2.0
//
//  Created by Elty on 10/5/14.
//  Copyright (c) 2014 le ting. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
 XBApp_Type_AppStore = 0,  //打包版本
 XBApp_Type_Release,      //release版本
 XBApp_Type_Master,     //master版本
}XBApp_Type;

@interface NetworkProtocolOBJ : NSObject

+ (NetworkProtocolOBJ*)sharedNetworkProtocolOBJ;

//选择网络环境
- (void)setAppType:(XBApp_Type)type;


//接口前缀
- (NSString*)XBMyteamBaseURL;

//查看当前环境
- (XBApp_Type)appType;
/**
 选择html api
 */
- (NSString *)XBMYteamHtmlURL;
/**
 选择公共服务 api
 */
- (NSString *)XBMYteamPublicURL;
@end
