//
//  UIBarButtonItem+JSExtension.h
//  JSOLMine_Example
//
//  Created by zhongaidong on 2020/1/3.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (JSExtension)

/// 添加Item(只有图片)
/// @param icon 普通图片
/// @param highIcon 高亮图片
/// @param target 当前目标类
/// @param action 监听方法
+ (UIBarButtonItem *)js_itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;

/// 左item(图片 + 标题)
/// @param icon 普通图片
/// @param highIcon 高亮图片
/// @param title 标题
/// @param target 当前目标类
/// @param action 监听方法
+ (UIBarButtonItem *)js_leftItemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon title:(NSString *)title target:(id)target action:(SEL)action;

/// 右item(图片 + 标题)
/// @param icon 普通图片
/// @param highIcon 高亮图片
/// @param title 标题
/// @param target 当前目标类
/// @param action 监听方法
+ (UIBarButtonItem *)js_rightItemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon title:(NSString *)title target:(id)target action:(SEL)action;

/// item(只有标题)
/// @param title 标题
/// @param target 当前目标类
/// @param action 监听方法
+ (UIBarButtonItem *)js_itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

/// 返回item(back + 点击事件)
/// @param target 当前目标类
/// @param action 监听方法
+ (UIBarButtonItem *)js_itemWithBackTarget:(id)target action:(SEL)action;

/// 返回item(Dismiss)
/// @param target 当前目标类
+ (UIBarButtonItem *)js_itemWithDismissTarget:(id)target;

/// 返回item(RootViewController)
/// @param target 当前目标类
+ (UIBarButtonItem *)js_itemToRootTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
