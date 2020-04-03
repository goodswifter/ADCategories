//
//  UIColor+ADExtension.m
//  ADCategories_Example
//
//  Created by zhongad on 2019/11/7.
//  Copyright © 2019 goodswifter. All rights reserved.
//

#import "UIColor+ADExtension.h"

@implementation UIColor (ADExtension)

+ (UIColor *)ad_randomColor {
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    CGFloat a = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

+ (UIColor *)ad_colorWithHexInteger:(NSInteger)hexInteger {
    return [self ad_colorWithHexInteger:hexInteger alpha:1];
}

+ (UIColor *)ad_colorWithHexInteger:(NSInteger)hexInteger alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((hexInteger & 0xFF0000) >> 16))/255.0
                           green:((float)((hexInteger & 0xFF00) >> 8))/255.0
                            blue:((float)(hexInteger & 0xFF))/255.0
                           alpha:alpha];
}

+ (UIColor *)ad_colorWithHexString:(NSString *)stringToConvert {
    return [self ad_colorWithHexString:stringToConvert alpha:1];
}

+ (UIColor *)ad_colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha {
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];//字符串处理
    // 例子，stringToConvert #ffffff
    if ([cString length] < 6)
        return [UIColor whiteColor]; // 如果非十六进制，返回白色
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1]; // 去掉头
    if ([cString length] != 6) // 去头非十六进制，返回白色
        return [UIColor whiteColor];
    
    // 分别取RGB的值
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    // NSScanner把扫描出的制定的字符串转换成Int类型
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    // 转换为UIColor 再返回
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

@end
