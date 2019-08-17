//
//  <prefix><name>Model.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>Model.h"
#import "GQHHeader.h"


/// 本地归档文件名
static NSString * const kFileName = @"name.file";

@implementation <prefix><name>Model

/**
 初始化Mock数据
 
 @return Mock数据
 */
- (instancetype)init {
    
    if (self = [super init]) {
        
        // mock
        
    }
    return self;
}

/**
 模型字段映射
 
 @return 模型字段映射字典
 */
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    
    return @{
             
             @"qh_ID" : @[@"id",@"iD",@"Id"],
             };
}

/**
 模型类映射
 
 @return 模型类映射字典
 */
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    
    return @{
             
//             @"qh_books" : GQHBookModel.class,
             };
}


/**
 获取本地文件保存路径
 
 @param file 文件名
 @return 本地文件保存路径
 */
+ (NSString *)filePathWith:(NSString * _Nonnull )file {
    
    // 文件夹路径
    NSString *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    return [NSString stringWithFormat:@"%@/%@", filePath, file];
}

/**
 编码解档
 
 @param aDecoder 编码器
 @return 自定义对象
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        
        self.qh_ID = [aDecoder decodeObjectForKey:@"qh_ID"];
    }
    
    return self;
}

/**
 编码归档
 
 @param aCoder 编码器
 */
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.qh_ID forKey:@"qh_ID"];
}

/**
 安全编码
 
 @return 是否支持
 */
+ (BOOL)supportsSecureCoding {
    
    return YES;
}

#pragma mark -
/**
 增-
 
 @param parameters 请求参数
 @param handler 请求结果回调处理
 */
+ (void)qh_create<name>WithParameters:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

/**
 查-
 
 @param parameters 请求参数
 @param handler 请求结果回调处理
 */
+ (void)qh_read<name>WithParameters:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

/**
 改-
 
 @param parameters 请求参数
 @param handler 请求结果回调处理
 */
+ (void)qh_update<name>WithParameters:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

/**
 删-
 
 @param parameters 请求参数
 @param handler 请求结果回调处理
 */
+ (void)qh_delete<name>WithParameters:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

/**
 列表-
 
 @param parameters 请求参数
 @param handler 请求结果回调处理
 */
+ (void)qh_fetch<name>sWithParameters:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

#pragma mark - Setter

#pragma mark - Getter

@end
