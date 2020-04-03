//
//  NSString+ADExtension.h
//  ADCategories_Example
//
//  Created by zhongad on 2019/3/25.
//  Copyright © 2019 goodswifter. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ADExtension)

/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  URL转码, 中文字符解码
 */
- (instancetype)URLEncoding;

@end

NS_ASSUME_NONNULL_END
