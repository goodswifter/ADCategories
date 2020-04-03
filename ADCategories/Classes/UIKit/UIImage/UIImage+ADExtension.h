//
//  UIImage+ADExtension.h
//  ADCategories_Example
//
//  Created by zhongad on 2019/10/29.
//  Copyright © 2019 goodswifter. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ADExtension)

/// 根据颜色生成一张尺寸为 1*1 的相同颜色图片
+ (UIImage *)ad_imageWithColor:(UIColor *)color;

/// 拉伸图片
/// @param name 图片名称
+ (UIImage *)ad_resizableImageNamed:(NSString *)name;

/// 保留最原始的图片, 导航栏和标签栏使用
/// @param name 图片名称
+ (UIImage *)ad_originalImageNamed:(NSString *)name;

/// 从(自己)大图中, 按照指定区域, 裁剪出小图
/// @param rect 裁剪的区域
- (UIImage *)ad_imageWithClipRect:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
