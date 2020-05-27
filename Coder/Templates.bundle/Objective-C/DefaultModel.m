//
//  <prefix><name>Model.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>Model.h"


/// 本地归档文件名
static NSString * const kFileName = @"name.file";

@implementation <prefix><name>Model

/// 初始化Mock数据
- (instancetype)init {
    
    if (self = [super init]) {
        
        // mock
        
    }
    return self;
}

/// 模型字段映射
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    
    return @{
             
             @"qh_id" : @[@"id",@"iD",@"Id"],
             };
}

/// 模型类映射
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    
    return @{
             
//             @"qh_books" : GQHBookModel.class,
             };
}

/// 获取本地文件保存路径
/// @param file 文件名
+ (NSString *)filePathWith:(NSString * _Nonnull )file {
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:kFileName];
    NSLog(@"本地文件保存路径:%@",filePath);
    
    return filePath;
}

/// 编码解档
/// @param coder 编码器
- (instancetype)initWithCoder:(NSCoder *)coder {
    
    if (self = [super init]) {
        
        self.qh_id = [coder decodeObjectForKey:@"qh_id"];
    }
    
    return self;
}

/// 编码归档
/// @param coder 编码器
- (void)encodeWithCoder:(NSCoder *)coder {
    
    [coder encodeObject:self.qh_id forKey:@"qh_id"];
}

/// 安全编码
+ (BOOL)supportsSecureCoding {
    
    return YES;
}

#pragma mark -
/// 增-<name>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)qh_create<name>With:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

/// 查-<name>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)qh_read<name>With:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

/// 改-<name>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)qh_update<name>With:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

/// 删-<name>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)qh_delete<name>With:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

/// 列表-<name>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)qh_fetch<name>sWith:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

#pragma mark - Setter

#pragma mark - Getter

@end
