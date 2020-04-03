//
//  NSObject+ADProperty.m
//  ADCategories_Example
//
//  Created by zhongad on 2019/3/26.
//  Copyright © 2019 goodswifter. All rights reserved.
//

#import "NSObject+ADProperty.h"

@implementation NSObject (ADProperty)

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict {
    
    NSMutableString *strM = [NSMutableString string];
    [strM appendFormat:@"\n"];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
//        NSLog(@"%@ - %@", propertyName, [value class]);
        
        NSString *code = nil;
        if ([value isKindOfClass:[NSString class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;", propertyName];
        } else if ([value isKindOfClass:[NSNumber class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@;", propertyName];
        } else if ([value isKindOfClass:[NSArray class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;", propertyName];
        } else if ([value isKindOfClass:[NSDictionary class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;", propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;", propertyName];
        }
        if (code) {
            [strM appendFormat:@"/** <#注释#> */\n%@\n", code];
        }
    }];
    NSLog(@"%@", strM);
}

@end
