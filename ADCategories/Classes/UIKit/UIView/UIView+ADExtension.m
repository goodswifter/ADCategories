//
//  UIView+ADExtension.m
//  ADCategories_Example
//
//  Created by zhongad on 2019/3/25.
//  Copyright © 2019 goodswifter. All rights reserved.
//

#import "UIView+ADExtension.h"

@implementation UIView (ADExtension)

@dynamic ad_currentVC;

#pragma mark - 打印view的subviews的关系树
- (void)ad_recursiveDescription {
    fprintf(stderr, "%s\n", [[NSString stringWithFormat:@"%@", self] UTF8String]);
    
    [self printSubviewsWithIndentation:0];
    
    fprintf(stderr, "\n");
}

- (void)printSubviewsWithIndentation:(int)indentation {
    for (UIView *subview in self.subviews) {
        NSMutableString *currentViewDescription = [NSMutableString string];
        for (int j = 0; j <= indentation; j++) {
            [currentViewDescription appendString:@"   | "];
        }
        [currentViewDescription appendFormat:@"%@", subview];
        
        fprintf(stderr,"%s\n", [currentViewDescription UTF8String]);
        
        [subview printSubviewsWithIndentation:indentation + 1];
    }
}

#pragma mark - 获取当前视图所在的控制器
- (UIViewController *)ad_currentVC {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma mark - 从Xib创建视图
+ (instancetype)ad_viewFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
