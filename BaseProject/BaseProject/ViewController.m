//
//  ViewController.m
//  BaseProject
//
//  Created by ios on 2018/7/16.
//  Copyright © 2018年 ios. All rights reserved.c
//

#import "ViewController.h"
#import "UILabel+DPLabel.h"
#import "UILabel+PPLayout.h"
#import <objc/runtime.h>
#define PColor DP_RGB_Color(249, 214, 72)
#define UColor DP_RGB_Color(223, 223, 223)

#define SSIU_MESSAGE_SEND(type) ^(type obj) { [self setValue:@(obj) forKey:key]; return self; };

@interface ViewController ()

@property(nonatomic,assign) NSInteger bun;

@property(nonatomic,strong) UIProgressView *progress;

@end

@implementation ViewController

- (void)createView : (float )c{
    
    
    self.progress = [[UIProgressView alloc]initWithFrame:CGRectZero];
    self.progress.progressTintColor = PColor;
    self.progress.trackTintColor = UColor;
    self.progress.progress = c/6.0;
    [self.view addSubview:self.progress];
    
    [self.progress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.centerY.equalTo(self.view);
        make.height.mas_equalTo(4);
    }];
    
    
    NSArray *arr = @[@"短的",@"长长长长长长",@"----长长长长----",@"2312",@"1",@"2019-2-3",@"2"];
    
    for (int i = 0; i < 7; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10 + (DP_WIDTH - 40)/6*i, self.view.frame.size.height/2 - 10.5, 21, 21)];
        imageView.image = [UIImage imageNamed:i > c ? @"noneSelect" : @"select"];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:imageView];
        
        UILabel *label = [[UILabel alloc]init];
        label.font = DP_Font(8);
        label.textColor = DP_COLOR_HEX(#000000);
        label.text = arr[i];
        [self.view addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(imageView).offset(i%2 ? 30 : -30);
            make.centerX.equalTo(imageView);
        }];
    }
    
    [self addChildViewController:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createView:3];
//    return;
    _bun = 0;
    UIButton *btn=[[UIButton alloc]initWithFrame:DP_RectMake(1,1, 373, 665)];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    btn.titleLabel.font=DP_Font(22);
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitleColor:DP_COLOR_HEX(000000) forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(geCode) forControlEvents:UIControlEventTouchUpInside];
    
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
    }];
    
    
    [btn addTarget:self action:[self dp_selectorBlock:^(id weakobj, id arg) {
        
    }] forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:btn];
    
    return;
    
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(140, 100, 100, 20)];
    label1.textColor=DP_COLOR_HEX(000000);
    label1.font=DP_Font(20);
    label1.text=@"你好";
    label1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:label1];
    
//    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 20)];
//    label1.backgroundColor=[UIColor clearColor];
//    label2.textColor=DP_COLOR_HEX(000000);
//    label2.font=DP_FontWeight(20, UIFontWeightMedium);
//    label2.text=@"你好";
//    [self.view addSubview:label2];
    
    label1.setDPText(@"hehehe").setDPFont(30).setDPTextColor(@"#F00F3E");
    
    UILabel *dppLabe = [UILabel makeDPLabel:^(UILabel * _Nonnull pp) {
        pp.setDPText(@"牛逼").setDPTextColor(@"#000000").setDPFont(30);
    }];
    [self.view addSubview:dppLabe];
    
    
    
    
    UILabel *dpLabe = [UILabel labelMake:^(UILabel *label) {
        label.setDPText(@"牛逼");
        label.setDPTextColor(@"#0ee0eF");
        label.setDPFont(30);
    }];
    dpLabe.frame = CGRectMake(20, 360, 100, 30);
    [self.view addSubview:dpLabe];
//    dpLabe.ppFontSize(40).ppTextColorHex(ff3ef3);
    
    

    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"20秒的");
    });
    
    NSTimer *tmer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:tmer forMode:NSDefaultRunLoopMode];
    
    
    
    UILabel *ppLabel = [UILabel labelMake:^(UILabel *label) {
        label.ppText(@"呵呵哒").ppFontSize(20).ppTextColor(DP_COLOR_HEX(#000000));
    }];
    [self.view addSubview:ppLabel];

}
- (void)timerRun{
    _bun ++ ;
    NSLog(@"dfsfds%ld",_bun);

    
}
-(void)btnClick
{
    NSLog(@"点击了");
    NSDictionary *dict=@{@"mobile":@"18656736921"};
    DPRequestTool.requestType(DP_RequestPost).requestUrl(GetVerificationCode_URL).requestParam(dict).resultsuccess(^(id task, id resultOBJ) {
        NSLog(@"%@",resultOBJ);
    }).resultfailure(^(id task, NSError *error) {
        NSLog(@"%@",error);
    }).startRequest();
}

- (void)geCode{
    
    NSLog(@"点击了");
    NSDictionary *dict=@{@"mobile":@"18656736921"};
    DPRequestTool.requestType(DP_RequestPost).requestUrl(GetVerificationCode_URL).requestParam(dict).resultsuccess(^(id task, id resultOBJ) {
        NSLog(@"%@",resultOBJ);
    }).resultfailure(^(id task, NSError *error) {
        NSLog(@"%@",error);
    }).startRequest();

    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DPConfigInfoModel.NetworkBaseUrl,GetVerificationCode_URL]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Get请求返回的响应信息：%@",[NSJSONSerialization
                                  JSONObjectWithData:data options:kNilOptions error:nil]);
    }];
    
    NSURLSessionDataTask *taskT = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Get请求返回的响应信息：%@",[NSJSONSerialization
                                  JSONObjectWithData:data options:kNilOptions error:nil]);
    }];
    
//    NSLog(@"%@-------%@",task,taskT);
}

@end
