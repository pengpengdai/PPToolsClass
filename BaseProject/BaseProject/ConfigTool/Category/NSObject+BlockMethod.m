//
//  NSObject+BlockMethod.m
//  runtime_001
//
//  Created by ios on 2018/8/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "NSObject+BlockMethod.h"
#import <objc/runtime.h>

@implementation NSObject (BlockMethod)

-(SEL)dp_selectorBlock:(callback)block
{
    if (!block) {
      [NSException raise:@"block can not be nil" format:@"%@ selectorBlock error", self];
    }
    NSString *selName=[NSString stringWithFormat:@"selector_%p:", block];
    SEL sel=NSSelectorFromString(selName);
    class_addMethod([self class], sel, (IMP)dpp_selectorImp, "v@:@");
    objc_setAssociatedObject(self, sel, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return sel;
}
void dpp_selectorImp(id self, SEL _cmd, id arg)
{
    callback block=objc_getAssociatedObject(self, _cmd);
    if (block) {
        block(self,arg);
    }
}

@end
