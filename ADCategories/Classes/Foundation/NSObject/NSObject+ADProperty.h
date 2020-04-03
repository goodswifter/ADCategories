//
//  NSObject+ADProperty.h
//  ADCategories_Example
//
//  Created by zhongad on 2019/3/26.
//  Copyright © 2019 goodswifter. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ADProperty)

/**
 解析字典打印属性代码
 */
+ (void)createPropertyCodeWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
