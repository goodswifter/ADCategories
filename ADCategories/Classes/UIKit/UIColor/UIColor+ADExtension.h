//
//  UIColor+ADExtension.h
//  ADCategories_Example
//
//  Created by zhongad on 2019/11/7.
//  Copyright © 2019 goodswifter. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 根据RGBA生成颜色
#define ADCOLOR_RGBA(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
/// 根据RGB生成颜色
#define ADCOLOR_RGB(r, g, b) ADCOLOR_RGBA(r, g, b, 1)

@interface UIColor (ADExtension)

/// 获取随机颜色
+ (UIColor *)ad_randomColor;

/// 根据十六进制数获取颜色
/// @param hexInteger 十六进数 如 0xffffff
+ (UIColor *)ad_colorWithHexInteger:(NSInteger)hexInteger;

/// 根据十六进制数获取颜色
/// @param hexInteger 十六进数 如 0xffffff
/// @param alpha 透明度
+ (UIColor *)ad_colorWithHexInteger:(NSInteger)hexInteger alpha:(CGFloat)alpha;

/// 从 #十六进制字符串 获取颜色
/// @param stringToConvert #十六进制字符串 如 #ffffff or ffffff
+ (UIColor *)ad_colorWithHexString:(NSString *)stringToConvert;

/// 从 #十六进制字符串 获取颜色
/// @param stringToConvert #十六进制字符串 如 #ffffff or ffffff
+ (UIColor *)ad_colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
