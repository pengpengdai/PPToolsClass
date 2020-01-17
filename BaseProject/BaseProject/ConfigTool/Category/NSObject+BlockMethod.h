//
//  NSObject+BlockMethod.h
//  runtime_001
//
//  Created by ios on 2018/8/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^callback)(id weakobj, id arg);

@interface NSObject (BlockMethod)

-(SEL)dp_selectorBlock:(callback)block;

@end
