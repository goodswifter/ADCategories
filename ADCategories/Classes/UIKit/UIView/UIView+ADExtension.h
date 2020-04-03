//
//  UIView+ADExtension.h
//  ADCategories_Example
//
//  Created by zhongad on 2019/3/25.
//  Copyright © 2019 goodswifter. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ADExtension)

/**
 获取视图所在的控制器
 */
@property (nonatomic, strong) UIViewController *ad_currentVC;

/**
 递归打印 view 的 subviews 的关系树
 lldb:[xxxView recursiveDescription]
 */
- (void)ad_recursiveDescription;

/**
 从Xib创建视图
 */
+ (instancetype)ad_viewFromXib;

@end

NS_ASSUME_NONNULL_END
