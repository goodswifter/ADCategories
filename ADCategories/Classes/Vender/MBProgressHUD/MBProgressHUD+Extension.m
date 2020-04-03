//
//  MBProgressHUD+Extension.m
//  MBHUDDemo
//
//  Created by zhongaidong on 2020/4/2.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "MBProgressHUD+Extension.h"

// 显示时长
#define kHudShowTime 1.5
static CGFloat secondPerText = 0.16;

@implementation MBProgressHUD (Extension)

#pragma mark - Public Function
#pragma mark - 在指定的view上显示hud
/// 显示提示消息
+ (void)showMessage:(NSString *)message toView:(UIView * _Nullable)view {
    [self show:message icon:nil view:view];
}

/// 显示成功消息
+ (void)showSuccess:(NSString *)success toView:(UIView * _Nullable)view {
    [self show:success icon:@"success.png" view:view];
}

/// 显示失败消息
+ (void)showError:(NSString *)error toView:(UIView * _Nullable)view {
    [self show:error icon:@"error.png" view:view];
}

/// 显示警告消息
+ (void)showWarning:(NSString *)Warning toView:(UIView *  _Nullable)view {
    [self show:Warning icon:@"warn" view:view];
}

+ (void)showActivityMessage:(NSString *)message view:(UIView *)view {
    if (view == nil)
        view = [self keyWindow];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 再设置模式
    hud.mode = MBProgressHUDModeIndeterminate;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
}

#pragma mark - 在window上显示hud
+ (void)showMessage:(NSString *)message {
    [self showMessage:message toView:nil];
}

+ (void)showSuccess:(NSString *)success {
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error {
    [self showError:error toView:nil];
}

+ (void)showWarning:(NSString *)Warning {
    [self showWarning:Warning toView:nil];
}

+ (void)showMessageWithImageName:(NSString *)imageName message:(NSString *)message {
    
}

+ (void)showActivityMessage:(NSString *)message {
    [self showActivityMessage:message view:nil];
}

/// 在底部显示提示消息
+ (void)showBottomMessage:(NSString *)message {
    // 隐藏之前的HUD
    [self hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[self keyWindow] animated:YES];
    // Set the text mode to show only text.
    hud.mode = MBProgressHUDModeText;
    // Move to bottm center.
    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    
    [hud hideAnimated:YES afterDelay:[self showTimeWithMessage:message]];
}

#pragma mark - 隐藏菊花
+ (void)hideHUD {
    [self hideHUDForView:nil];
}

+ (void)hideHUDForView:(UIView * _Nullable)view {
    if (view == nil)
        view = [self keyWindow];
    
    [self hideHUDForView:view animated:YES];
}

#pragma mark - Private Function
/// 显示信息
/// @param text 信息内容
/// @param icon 图标
/// @param view 显示的视图
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    // 隐藏之前的HUD
    [self hideHUD];
    if (view == nil)
        view = [self keyWindow];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    
    // 判断是否显示图片
    if (!icon.length) {
        hud.mode = MBProgressHUDModeText;
    } else {
        // 设置图片
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]];
        img = (!img ? img : [UIImage imageNamed:icon]);
        hud.customView = [[UIImageView alloc] initWithImage:img];
        // 再设置模式
        hud.mode = MBProgressHUDModeCustomView;
    }
    
    // 设置Label显示行数
    hud.label.numberOfLines = 10;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 隐藏消失
    [hud hideAnimated:YES afterDelay:[self showTimeWithMessage:text]];
}

/// 根据消息的长度计算显示时间
+ (CGFloat)showTimeWithMessage:(NSString *)message {
    if (message.length) {
        CGFloat time = message.length * secondPerText;
        return MAX(MIN(time, 5), kHudShowTime);
    }
    return 0;
}

/// 获取keyWindow
+ (UIWindow *)keyWindow {
    static __weak UIWindow *cachedKeyWindow = nil;
    
    UIWindow *originalKeyWindow = nil;
    
    if (@available(iOS 13.0, *)) {
        NSSet<UIScene *> *connectedScenes = [UIApplication sharedApplication].connectedScenes;
        for (UIScene *scene in connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive && [scene isKindOfClass:[UIWindowScene class]]) {
                UIWindowScene *windowScene = (UIWindowScene *)scene;
                for (UIWindow *window in windowScene.windows) {
                    if (window.isKeyWindow) {
                        originalKeyWindow = window;
                        break;
                    }
                }
            }
        }
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 130000
        originalKeyWindow = [UIApplication sharedApplication].keyWindow;
#endif
    }
    // If original key window is not nil and the cached keywindow is also not original keywindow then changing keywindow.
    if (originalKeyWindow) {
        cachedKeyWindow = originalKeyWindow;
    }
    
    return cachedKeyWindow;
}

@end
