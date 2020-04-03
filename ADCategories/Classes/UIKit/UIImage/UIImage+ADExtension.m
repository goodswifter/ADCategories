//
//  UIImage+ADExtension.m
//  ADCategories_Example
//
//  Created by zhongad on 2019/10/29.
//  Copyright © 2019 goodswifter. All rights reserved.
//

#import "UIImage+ADExtension.h"

@implementation UIImage (ADExtension)

+ (UIImage *)ad_imageWithColor:(UIColor *)color {
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (UIImage *)ad_resizableImageNamed:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    
    // 过时了
//    CGFloat leftCapWidth = image.size.width * 0.5;
//    CGFloat topCapHeight = image.size.height * 0.5;
//    UIImage *stretchableImage = [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    
    // 推荐这种
    CGFloat halfImageW = image.size.width * 0.5;
    CGFloat halfImageH = image.size.height * 0.5;
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(halfImageH, halfImageW, halfImageH, halfImageW) resizingMode:UIImageResizingModeStretch];
}

/// 保留最原始的图片, 导航栏和标签栏使用
/// @param name 图片名称
+ (UIImage *)ad_originalImageNamed:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

// CG Core Graphics 是属于系统底层的API, 针对像素进行操作的
- (UIImage *)ad_imageWithClipRect:(CGRect)rect {
    // 截取小图
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    // 生成图像
    UIImage *image =[UIImage imageWithCGImage:imageRef];
    // 释放对象
    CGImageRelease(imageRef);
    return image;
}

@end
