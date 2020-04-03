//
//  MBProgressHUD+Extension.h
//  MBHUDDemo
//
//  Created by zhongaidong on 2020/4/2.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (Extension)

#pragma mark - 在指定的view上显示HUD
/// 显示提示消息
+ (void)showMessage:(NSString *)message toView:(UIView * _Nullable)view;
/// 显示成功消息
+ (void)showSuccess:(NSString *)success toView:(UIView * _Nullable)view;
/// 显示失败消息
+ (void)showError:(NSString *)error toView:(UIView * _Nullable)view;
/// 显示警告消息
+ (void)showWarning:(NSString *)Warning toView:(UIView *  _Nullable)view;
/// 显示菊花 + 消息
+ (void)showActivityMessage:(NSString*)message view:(UIView * _Nullable)view;

#pragma mark - 在window上显示HUD
+ (void)showMessage:(NSString *)message;
+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (void)showWarning:(NSString *)Warning;
+ (void)showMessageWithImageName:(NSString *)imageName message:(NSString *)message;
+ (void)showActivityMessage:(NSString *)message;
/// 在底部显示提示消息
+ (void)showBottomMessage:(NSString *)message;

#pragma mark - 隐藏HUD
+ (void)hideHUD;
+ (void)hideHUDForView:(UIView * _Nullable)view;

@end

NS_ASSUME_NONNULL_END
