//
//  UIBarButtonItem+JSExtension.m
//  JSOLMine_Example
//
//  Created by zhongaidong on 2020/1/3.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "UIBarButtonItem+JSExtension.h"

#define kJSNavTitleFont @14
#define kJSNavItemFont [UIFont systemFontOfSize:14]
#define kJSPadding 12

@implementation UIBarButtonItem (JSExtension)

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [self initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

/// 字体的基本设置
- (void)setup {
    
}

#pragma mark - Public Function
+ (UIBarButtonItem *)js_itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action {
    UIButton *button = [self buttonWithIcon:icon highIcon:highIcon target:target action:action];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)js_leftItemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon title:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *button = [self buttonWithIcon:icon highIcon:highIcon target:target action:action];
//    button.imageEdgeInsets = UIEdgeInsetsMake(0, -18 * RATIO, 0, 0);
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, -5 * RATIO, 0, 0);
    // 返回标题所占的尺寸大小
    CGSize textSize = [self sizeWithString:title];
    [button setTitle:title forState:UIControlStateNormal];
    CGFloat buttonW = textSize.width + button.currentImage.size.width + 10;
    CGFloat buttonH = button.currentImage.size.height;
    button.frame = CGRectMake(0, 0, buttonW, buttonH);
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)js_rightItemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon title:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *button = [self buttonWithIcon:icon highIcon:highIcon target:target action:action];
//    button.imageEdgeInsets = UIEdgeInsetsMake(0, 5 * RATIO, 0, 0);
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, 18 * RATIO, 0, 0);

    // 返回标题所占的尺寸大小
    CGSize textSize = [self sizeWithString:title];
    [button setTitle:title forState:UIControlStateNormal];
    CGFloat buttonW = textSize.width + button.currentImage.size.width;
    CGFloat buttonH = button.currentImage.size.height;
    button.frame = CGRectMake(0, 0, buttonW, buttonH);
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)js_itemWithBackTarget:(id)target action:(SEL)action {
    return [self js_itemWithIcon:@"hp_back" highIcon:@"hp_back_high" target:target action:action];
}

+ (UIBarButtonItem *)js_itemWithDismissTarget:(id)target {
    return [self js_itemWithIcon:@"hp_back" highIcon:@"hp_back_high" target:target action:@selector(backWithDismiss:)];
}

+ (UIBarButtonItem *)js_itemToRootTarget:(id)target {
    return [self js_itemWithIcon:@"hp_back" highIcon:@"hp_back_high" target:target action:@selector(backWithToRootVC:)];
}

#pragma mark - Private Function
- (void)backWithToRootVC:(id)target {
    [target popToRootViewControllerAnimated:YES];
}

- (void)backWithDismiss:(id)target {
    [target dismissViewControllerAnimated:YES completion:^{}];
}

/// 返回一个字符串所占的尺寸大小
+ (CGSize)sizeWithString:(NSString *)str {
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:str];
    NSRange range = NSMakeRange(0, attrStr.length);
    NSDictionary *dic = [attrStr attributesAtIndex:0 effectiveRange:&range];   // 获取该段attributedString的属性字典
    // 计算文本的大小
    CGSize size = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) // 用于计算文本绘制时占据的矩形块
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                       attributes:dic        // 文字的属性
                                          context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
    return size;
}

/// 通过图片创建一个按钮
+ (UIButton *)buttonWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = kJSNavItemFont;
    button.frame = (CGRect){CGPointZero, button.currentImage.size};
    // 宽度 +20
//    button.ad_width += 20;
    // 内容左对齐
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIBarButtonItem *)js_itemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button setTitleColor:GlobalTextHighColor forState:UIControlStateHighlighted];
    button.titleLabel.font = kJSNavItemFont;
    CGSize size = [self sizeWithString:title];
    button.frame = CGRectMake(0, 0, size.width + kJSPadding, size.height);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
