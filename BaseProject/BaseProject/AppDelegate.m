//
//  AppDelegate.m
//  BaseProject
//
//  Created by ios on 2018/7/16.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"

@interface AppDelegate ()

@property(nonatomic)DP_ProjectEnvironment copyAppEnvironment;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [EnvironmentType singleInterest].evcironmentType=self.copyAppEnvironment=DP_MasterType;
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    CGPoint location = [[[event allTouches] anyObject] locationInView:self.window];
    CGRect statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
    if (CGRectContainsPoint(statusBarFrame, location)) {
        UITouch *touch = [touches anyObject];
        if (touch.tapCount == 3) {
            if (self.copyAppEnvironment==DP_AppStoreType) {
                return;
            }else
            {
                [HBToast showMessage:[EnvironmentType singleInterest].evcironmentType==DP_MasterType?@"切换到正式环境":@"切换到测试环境"];
                [EnvironmentType singleInterest].evcironmentType= [EnvironmentType singleInterest].evcironmentType==DP_MasterType?DP_AppStoreType:DP_MasterType;
            }
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
