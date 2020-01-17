//
//  SZNetworking.h
//  TigeryeProject
//
//  Created by ervin on 2017/12/15.
//  Copyright © 2017年 张伯林. All rights reserved.
//

#import "SEQChainRequest.h"

#define GLREQUEST [[GLNetworking alloc] init]
@interface GLNetworking : SEQChainRequest
- (SEQChainRequest *(^)(BOOL isShow))showTost;
@end
