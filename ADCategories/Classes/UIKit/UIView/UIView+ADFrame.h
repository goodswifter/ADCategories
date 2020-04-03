//
//  UIView+ADFrame.h
//
//  Created by zhongad on 2017/7/24.
//  Copyright © 2017年 zhongad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ADFrame)

/** 注意 */
//- (CGFloat)x;
//- (void)setX:(CGFloat)x;
/** 在分类中声明@property, 只会生成方法的声明, 不会生成方法的实现和带有_下划线的成员变量*/

#pragma mark - shortcuts for frame properties
@property (nonatomic, assign) CGPoint ad_origin;
@property (nonatomic, assign) CGSize ad_size;

#pragma mark - shortcuts for positions
@property (nonatomic, assign) CGFloat ad_centerX;
@property (nonatomic, assign) CGFloat ad_centerY;

#pragma mark - 上下左右
@property (nonatomic, assign) CGFloat ad_top;
@property (nonatomic, assign) CGFloat ad_bottom;
@property (nonatomic, assign) CGFloat ad_left;
@property (nonatomic, assign) CGFloat ad_right;

#pragma mark - frame
@property (nonatomic, assign) CGFloat ad_x;
@property (nonatomic, assign) CGFloat ad_y;
@property (nonatomic, assign) CGFloat ad_width;
@property (nonatomic, assign) CGFloat ad_height;

@end
