 //
//  SZNetworking.m
//  TigeryeProject
//
//  Created by ervin on 2017/12/15.
//  Copyright © 2017年 张伯林. All rights reserved.
//

#import "GLNetworking.h"
#import "GLBaseModel.h"
//#import "GLGuidePageVC.h"
@interface GLNetworking ()
@property (nonatomic, assign) BOOL isShowTost;
@end

@implementation GLNetworking
- (instancetype)init{
    if (self == [super init]) {
        self.isShowTost = YES;
    }
    return self;
}
- (SEQChainRequest *(^)(BOOL isShow))showTost{
    return ^(BOOL isShow){
        self.isShowTost = isShow;
        return self;
    };
}
- (NSString *)baseUrl{
    NSString *url = [NetworkProtocolOBJ sharedNetworkProtocolOBJ].XBMyteamBaseURL;
    return url;
}
- (NSDictionary *)requestHeaderFieldValueDictionary{

    return @{@"From-Client":@"iOS",@"Version":[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]};
}
- (void)requestWillStart{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: [NSURL URLWithString:self.url]];
    for (NSHTTPCookie *cookie in cookies) {
        NSLog(@"cookie---Session,name:= %@,valuie = %@",cookie.name,cookie.value);
    }
}
- (void)requestDidComplete:(NSURLSessionDataTask *)task response:(id)responseObj{
    GLBaseModel *baseModel = [GLBaseModel mj_objectWithKeyValues:responseObj];
    if ([baseModel.code isEqualToString:@"0"]) {
        if (self.success) {
            self.success(task, responseObj);
        }
    }else if ([baseModel.code isEqualToString:@"-1"]) {
        if (self.isShowTost) {
//            [HBToast showMessage:baseModel.msg];
        }
        if (self.failure) {
            self.failure(task, nil);
        }
    }else if ([baseModel.code isEqualToString:@"102"]) {//无效参数
//        if (self.isShowTost) {
//            [HBToast showMessage:baseModel.msg];
//        }
        NSLog(@"-----------无效参数----------");
        if (self.failure) {
            self.failure(task, nil);
        }
    }else if ([baseModel.code isEqualToString:@"-403"]) {//需要登录
//        if ([self.url containsString:Group_link]) {
//            if (self.failure) {
//                [HBToast showMessage:@"没有登录"];
//                self.failure(task, nil);
//            }
//            return;
//        }
//        UIViewController *currentController=[GLNetworking getCurrentVC];
//        if ([currentController isKindOfClass:[GLGuidePageVC class]]) {
//            return;
//        }
//        [HBToast showMessage:@"登录过期,请重新登录"];
//        [APP_USER_INFO removeLoginSession];
//        GLGuidePageVC *guide=[[GLGuidePageVC alloc]init];
//        GLNavigationController *nav=[[GLNavigationController alloc]initWithRootViewController:guide];
//        [[GLNetworking getCurrentVC].navigationController presentViewController:nav animated:YES completion:^{
//            [GLNetworking getCurrentVC].navigationController.tabBarController.selectedIndex = 0;
//            [[GLNetworking getCurrentVC].navigationController popViewControllerAnimated:NO];
//        }];
//        if (self.failure) {
//            self.failure(task, nil);
//        }
    }else{
        if (self.isShowTost) {
            [HBToast showMessage:baseModel.msg];
        }
        if (self.failure) {
            self.failure(task, nil);
        }
    }
}
- (void)requestFailure:(NSError *)error{
    if (self.isShowTost) {
        [self showErrorMessge:error];
    }
}
/**
 *  请求失败提示
 */
- (void)showErrorMessge:(NSError*)error {
    if (error) {
        NSData *responseData = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        if (responseData) {
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:NULL];
            NSLog(@"请求失败error: %@",response);
            if ([response[@"error"] isKindOfClass:[NSString class]]) {
                [HBToast showMessage:@"网络连接失败，请重试"];
                return;
            }
            NSDictionary *errDict = response[@"error"];
            if (errDict == nil) {
                [HBToast showMessage:@"网络连接失败，请重试"];
                return;
            }
            if ([[errDict allKeys] containsObject:@"code"]) {
//                NSString *code = errDict[@"code"];
//                if ([StringTool isBlankString:code]) {
//                    [HBToast showMessage:@"网络连接失败"];
//                    return;
//                }
            }
            if ([[errDict allKeys] containsObject:@"message"]){
                NSString *errorMsg = errDict[@"message"];
                
                if (errorMsg==nil||[errorMsg isKindOfClass:[NSNull class]]) {
                    [HBToast showMessage:@"网络连接失败，请重试"];
                } else {
                    [HBToast showMessage:errorMsg];
                }
            }
        } else {
            if (![AFNetworkReachabilityManager sharedManager].reachable) {
                [HBToast showMessage:@"网络连接失败，请重试"];
            } else {
                [HBToast showMessage:@"网络连接失败，请重试"];
            }
        }
    } else {
        [HBToast showMessage:@"网络连接失败，请重试"];
    }
}

+(UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

+(UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}
@end
