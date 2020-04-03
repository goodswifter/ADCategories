//
//  UIView+ADFrame.m
//  TableViewSpinnerDemo
//
//  Created by jingshi on 2017/7/24.
//  Copyright © 2017年 zhongad. All rights reserved.
//

#import "UIView+ADFrame.h"

@implementation UIView (ADFrame)

#pragma mark - shortcuts for frame properties
- (CGPoint)ad_origin {
    return self.frame.origin;
}
- (void)setAd_origin:(CGPoint)ad_origin {
    CGRect frame = self.frame;
    frame.origin = ad_origin;
    self.frame = frame;
}

- (CGSize)ad_size {
    return self.frame.size;
}
- (void)setAd_size:(CGSize)ad_size {
    CGRect frame = self.frame;
    frame.size = ad_size;
    self.frame = frame;
}

#pragma mark - shortcuts for positions
- (CGFloat)ad_centerX {
    return self.center.x;
}
- (void)setAd_centerX:(CGFloat)ad_centerX {
    self.center = CGPointMake(ad_centerX, self.center.y);
}

- (CGFloat)ad_centerY {
    return self.center.y;
}
- (void)setAd_centerY:(CGFloat)ad_centerY {
    self.center = CGPointMake(self.center.x, ad_centerY);
}

#pragma mark - 上下左右
- (CGFloat)ad_top {
    return self.frame.origin.y;
}
- (void)setAd_top:(CGFloat)ad_top {
    CGRect frame = self.frame;
    frame.origin.y = ad_top;
    self.frame = frame;
}

- (CGFloat)ad_bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setAd_bottom:(CGFloat)ad_bottom {
    CGRect frame = self.frame;
    frame.origin.y = ad_bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)ad_left {
    return self.frame.origin.x;
}
- (void)setAd_left:(CGFloat)ad_left {
    CGRect frame = self.frame;
    frame.origin.x = ad_left;
    self.frame = frame;
}

- (CGFloat)ad_right {
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setAd_right:(CGFloat)ad_right {
    CGRect frame = self.frame;
    frame.origin.x = ad_right - self.frame.size.width;
    self.frame = frame;
}

#pragma mark - frame
- (CGFloat)ad_x {
    return self.frame.origin.x;
}
- (void)setAd_x:(CGFloat)ad_x {
    CGRect frame = self.frame;
    frame.origin.x = ad_x;
    self.frame = frame;
}

- (CGFloat)ad_y {
    return self.frame.origin.y;
}
- (void)setAd_y:(CGFloat)ad_y {
    CGRect frame = self.frame;
    frame.origin.y = ad_y;
    self.frame = frame;
}

- (CGFloat)ad_width {
    return self.frame.size.width;
}
- (void)setAd_width:(CGFloat)ad_width {
    CGRect frame = self.frame;
    frame.size.width = ad_width;
    self.frame = frame;
}

- (CGFloat)ad_height {
    return self.frame.size.height;
}
- (void)setAd_height:(CGFloat)ad_height {
    CGRect frame = self.frame;
    frame.size.height = ad_height;
    self.frame = frame;
}

@end
