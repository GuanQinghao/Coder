//
//  SeedPropertyCodeCreator.m
//  SeedCoder
//
//  Created by Hao on 2020/12/18.
//

#import "SeedPropertyCodeCreator.h"

@implementation SeedPropertyCodeCreator

#pragma mark - override

+ (instancetype)creator {
    
    return [[SeedPropertyCodeCreator alloc] init];
}

/// 生成代码块
/// @param content 输入的内容
- (NSString *)createCodeSnippetWith:(NSString *)content {
    
    // JSON字符串转字典
    NSData *JSONData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:NULL];
    
    // 输出属性字符串
    NSMutableString *result = [NSMutableString string];
    
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
        
        // 数对象
        if ([value isKindOfClass:[NSNumber class]]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, strong) NSNumber *%@;", obj];
        }
        // 数组对象
        if ([value isKindOfClass:[NSArray class]]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, strong) NSArray *%@;", obj];
        }
        // 字典对象
        if ([value isKindOfClass:[NSDictionary class]]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, strong) NSDictionary *%@;", obj];
        }
        // 字符串对象
        if ([value isKindOfClass:[NSString class]]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, copy) NSString *%@;", obj];
        }
        // BOOL值
        if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            
            property = [NSString stringWithFormat:@"/// <#Description#>\n@property (nonatomic, assign) BOOL %@;", obj];
        }
        
        if (property.length > 0) {
            
            [result appendFormat:@"%@\n",property];
        }
    }];
    
    return result;
}

@end
