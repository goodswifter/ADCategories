//
//  NSMutableArray+ADSwizzling.m
//  03-JSON解析
//
//  Created by 钟爱东 on 2019/12/7.
//  Copyright © 2019 zhongad. All rights reserved.
//

#import "NSMutableArray+ADSwizzling.h"
#import <objc/runtime.h>

@implementation NSMutableArray (ADSwizzling)

+ (void)load {
    // 1. 获取系统方法
    Method insertMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(insertObject:atIndex:));
    
    // 2. 获取自定义方法
    Method ad_insertMethod = class_getInstanceMethod(self, @selector(ad_insertObject:atIndex:));
    
    // 3. 交换方法
    method_exchangeImplementations(insertMethod, ad_insertMethod);
}

- (void)ad_insertObject:(id)object atIndex:(NSUInteger)idx {
    if (!object) {
        [self ad_insertObject:@"" atIndex:idx];
    } else {
        [self ad_insertObject:object atIndex:idx];
    }
}

@end
