//
//  <prefix><name>Model.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "SeedBaseModel.h"


NS_ASSUME_NONNULL_BEGIN

/// <#Description#>
@interface <prefix><name>Model : SeedBaseModel <NSSecureCoding>

#pragma mark --------------------------- <property> ---------------------------

#pragma mark - auxiliary property

#pragma mark - business property

/// 模型类
// @property (nonatomic, strong) NSArray<SeedBookModel *> *s_books;

#pragma mark ---------------------------- <method> ----------------------------

#pragma mark ------------------------------ <api> ------------------------------

/// 增-<#Description#>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)s_create<name>With:(nullable id)parameters handler:(nullable void (^)(BOOL status, NSNumber *code, NSString *message, id data))handler;

/// 查-<#Description#>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)s_read<name>With:(nullable id)parameters handler:(nullable void (^)(BOOL status, NSNumber *code, NSString *message, id data))handler;

/// 改-<#Description#>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)s_update<name>With:(nullable id)parameters handler:(nullable void (^)(BOOL status, NSNumber *code, NSString *message, id data))handler;

/// 删-<#Description#>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)s_delete<name>With:(nullable id)parameters handler:(nullable void (^)(BOOL status, NSNumber *code, NSString *message, id data))handler;

/// 列表-<#Description#>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)s_fetch<name>sWith:(nullable id)parameters handler:(nullable void (^)(BOOL status, NSNumber *code, NSString *message, id data))handler;

@end

NS_ASSUME_NONNULL_END
