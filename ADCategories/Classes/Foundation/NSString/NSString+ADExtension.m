//
//  NSString+ADExtension.m
//  ADCategories_Example
//
//  Created by zhongad on 2019/3/25.
//  Copyright © 2019 goodswifter. All rights reserved.
//

#import "NSString+ADExtension.h"

@implementation NSString (ADExtension)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (instancetype)URLEncoding {
    NSCharacterSet *allowedCharacters = [NSCharacterSet URLFragmentAllowedCharacterSet];
    NSString *encodedString = [self stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    return encodedString;
}

@end
