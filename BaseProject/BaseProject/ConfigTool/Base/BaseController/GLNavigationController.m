//
//  SZNavigationController.m
//  SZOutreachProject
//
//  Created by 张伯林 on 2017/12/9.
//  Copyright © 2017年 张伯林. All rights reserved.
//

#import "GLNavigationController.h"

@interface GLNavigationController ()

@end

@implementation GLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [GLScreenTool sharedManager].topHeight = self.navigationBar.frame.size.height + GL_STATUS_HEIGHT;
//    [GLScreenTool sharedManager].navbarHeight = self.navigationBar.frame.size.height;
    self.interactivePopGestureRecognizer.delegate = self;
    self.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationBar.translucent = NO;
}
+ (void)initialize {
    
    /**
     *  status Bar
     */
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
    
    /**
     * Navigation BackgroundColor
     */
//    [[UINavigationBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor] size:CGSizeMake([[UIScreen mainScreen] currentMode].size.width, 64)]  forBarMetrics:UIBarMetricsDefault];
    
    /**
     *  Navigation Title Color
     */
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor blackColor], NSForegroundColorAttributeName,nil]];
    
    /**
     *  统一导航条系统返回按钮图片，并通过偏移隐藏标题
     */
//    UIImage *backImage = [[UIImage imageNamed:@"ic_back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 40, 0, 0)];
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
//                                                         forBarMetrics:UIBarMetricsDefault];
    
    // 5.设置状态栏样式
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
}
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    @autoreleasepool
    {
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        UIGraphicsBeginImageContext(rect.size);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context,
                                       
                                       color.CGColor);
        
        CGContextFillRect(context, rect);
        
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return img;
    }
}

-(UIBarButtonItem *)creatBackButton
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame=CGRectMake(0, 0, 25, 25);
    [backBtn setImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(popSelf) forControlEvents:UIControlEventTouchUpInside];
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    return leftItem;

//    return [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_back"]style:UIBarButtonItemStylePlain target:self action:@selector(popSelf)];
//
    //或[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(popSelf)];
    
}

-(void)popSelf

{
    
    [self popViewControllerAnimated:YES];
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
//    if ( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated == YES )
//    {
//        self.interactivePopGestureRecognizer.enabled = NO;
//    }

    [super pushViewController:viewController animated:animated];
//            self.interactivePopGestureRecognizer.enabled = YES;

    if (viewController.navigationItem.leftBarButtonItem ==  nil && self.viewControllers.count >1) {
        viewController.navigationItem.leftBarButtonItem = [self creatBackButton];
    }
    

}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated {
//    if ( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated == YES )
//    {
//        self.interactivePopGestureRecognizer.enabled = NO;
//    }

    [super setViewControllers:viewControllers animated:animated];
    UIViewController *viewController = viewControllers.lastObject;
    if (viewController.navigationItem.leftBarButtonItem ==nil && self.viewControllers.count >1) {
        viewController.navigationItem.leftBarButtonItem = [self creatBackButton];
        
    }

}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
//    if ( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated == YES )
//    {
//        self.interactivePopGestureRecognizer.enabled = NO;
//    }
    
    return  [super popToRootViewControllerAnimated:animated];
    
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    if( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] )
//    {
//        self.interactivePopGestureRecognizer.enabled = NO;
//    }
    
    return [super popToViewController:viewController animated:animated];
    
}

#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}


-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    
    if ( gestureRecognizer == self.interactivePopGestureRecognizer )
    {
        if ( self.viewControllers.count < 2 || self.visibleViewController == [self.viewControllers objectAtIndex:0] )
        {
            return NO;
        }
    }
    
    return YES;
}

///// 当前的导航控制器是否可以旋转
//-(BOOL)shouldAutorotate{
//    
//    return YES;
//}

////设置支持的屏幕旋转方向
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//
//    return self.interfaceOrientationMask;
//}
//
////设置presentation方式展示的屏幕方向
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    
//    return self.interfaceOrientation;
//}
@end
