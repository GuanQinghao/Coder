//
//  <prefix><name>Model.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>Model.h"


@implementation <prefix><name>Model

#pragma mark ----------------------------- <mock> -----------------------------

/// 初始化Mock数据
- (instancetype)init {
    
    if (self = [super init]) {
        
        // mock
        
    }
    return self;
}

#pragma mark ---------------------------- <method> ----------------------------

#pragma mark - public method

#pragma mark - private method

#pragma mark ----------------------------- <parse> -----------------------------

/// 模型字段映射
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    
    return @{
        
        @"s_id" : @[@"id",@"iD",@"Id"],
    };
}

/// 模型类映射
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    
    return @{
        
        // @"s_books" : SeedBookModel.class,
    };
}

#pragma mark ---------------------- <archive & unarchive> ----------------------

#pragma mark ------------------------------ <api> ------------------------------

/// 增-<#Description#>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)s_create<name>With:(id)parameters handler:(void (^)(BOOL status, NSNumber * _Nonnull code, NSString * _Nonnull message, id _Nonnull data))handler {
    
}

/// 查-<#Description#>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)s_read<name>With:(id)parameters handler:(void (^)(BOOL status, NSNumber * _Nonnull code, NSString * _Nonnull message, id _Nonnull data))handler {
    
}

/// 改-<#Description#>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)s_update<name>With:(id)parameters handler:(void (^)(BOOL status, NSNumber * _Nonnull code, NSString * _Nonnull message, id _Nonnull data))handler {
    
}

/// 删-<#Description#>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)s_delete<name>With:(id)parameters handler:(void (^)(BOOL status, NSNumber * _Nonnull code, NSString * _Nonnull message, id _Nonnull data))handler {
    
}

/// 列表-<#Description#>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)s_fetch<name>sWith:(id)parameters handler:(void (^)(BOOL status, NSNumber * _Nonnull code, NSString * _Nonnull message, id _Nonnull data))handler {
    
}

#pragma mark ------------------------ <setter & getter> ------------------------

#pragma mark - setter

#pragma mark - getter

@end
