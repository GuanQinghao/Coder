//
//  SeedPropertyCreator.m
//  Coder
//
//  Created by Mac on 2019/2/1.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import "SeedPropertyCreator.h"


#pragma mark -

@implementation SeedPropertyCreator

/// 单例模式代码示例 -> 不支持对象copy
static SeedPropertyCreator *singleton = nil;

/// 单例
+ (instancetype)creator {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        singleton = [[super allocWithZone:NULL] init];
    });
    
    return singleton;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    return  [self creator];
}

/// 根据JSON字符串生成属性
/// @param JSONString JSON 字符串
- (NSString *)createCodeWith:(NSString *)JSONString {
    
    // JSON字符串转字典
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:NULL];
    
    // 输出属性字符串
    NSMutableString *autoCode = [NSMutableString string];
    
    // 字典所有的key值
    NSArray *unsortedKeys = [dictionary allKeys];
    // key值排序
    NSArray *sortedKeys = [unsortedKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        // 正序
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    
    // 根据key值查询value并生成属性
    [sortedKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        id value = [dictionary objectForKey:obj];
        
        NSString *property;
        
        //
        if ([value isKindOfClass:[NSNumber class]]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, strong) NSNumber *%@;", obj];
        }
        //
        if ([value isKindOfClass:[NSArray class]]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, strong) NSArray *%@;", obj];
        }
        //
        if ([value isKindOfClass:[NSDictionary class]]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, strong) NSDictionary *%@;", obj];
        }
        //
        if ([value isKindOfClass:[NSString class]]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, copy) NSString *%@;", obj];
        }
        //
        if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, assign) BOOL %@;", obj];
        }
        
        if (property.length > 0) {
            
            [autoCode appendFormat:@"%@\n",property];
        }
        
    }];
    
    return autoCode;
}

@end
