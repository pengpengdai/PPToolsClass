//
//  SEQRequestPlugin.h
//  YMShiHang
//
//  Created by ervin on 2017/10/31.
//  Copyright © 2017年 ervin. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol SEQRequestPlugin <NSObject>
@optional
- (void)requestWillStart;
- (void)requestWillComplete;
- (void)requestDidComplete;
- (void)requestFailure;
@end
@interface SEQRequestPluginBase : NSObject



@end
