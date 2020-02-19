//
//  GQHPropertyCreator.m
//  Coder
//
//  Created by Mac on 2019/2/1.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import "GQHPropertyCreator.h"


#pragma mark -

@implementation GQHPropertyCreator

/// 单例模式代码示例 -> 不支持对象copy
static GQHPropertyCreator *singleton = nil;

/// 单例
+ (instancetype)creator {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        singleton = [[super allocWithZone:NULL] init];
    });
    
    return singleton;
}

- (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    return  [[self class] creator];
}

/// 根据JSON字符串生成属性
/// @param JSONString JSON 字符串
- (NSString *)createCodeWith:(NSString *)JSONString {
    
    // JSON字符串转字典
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:NULL];
    
    // 输出属性字符串
    NSMutableString *autoCode = [NSMutableString string];
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *property;
        
        //
        if ([obj isKindOfClass:[NSNumber class]]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, strong) NSNumber *%@;", key];
        }
        //
        if ([obj isKindOfClass:[NSArray class]]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, strong) NSArray *%@;", key];
        }
        //
        if ([obj isKindOfClass:[NSDictionary class]]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, strong) NSDictionary *%@;", key];
        }
        //
        if ([obj isKindOfClass:[NSString class]]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, copy) NSString *%@;", key];
        }
        //
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, assign) BOOL %@;", key];
        }
        
        if (property.length > 0) {
            
            [autoCode appendFormat:@"\n%@\n",property];
        }
    }];
    
    return autoCode;
}

@end
