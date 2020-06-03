//
//  <prefix><name>Model.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "GQHBaseModel.h"


NS_ASSUME_NONNULL_BEGIN

/// <#Description#>
@interface <prefix><name>Model : GQHBaseModel <NSSecureCoding>

/// 模型类
// @property (nonatomic, strong) NSArray<GQHBookModel *> *qh_books;

#pragma mark -

/// 增-<name>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)qh_create<name>With:(nullable id)parameters handler:(nullable void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler;

/// 查-<name>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)qh_read<name>With:(nullable id)parameters handler:(nullable void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler;

/// 改-<name>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)qh_update<name>With:(nullable id)parameters handler:(nullable void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler;

/// 删-<name>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)qh_delete<name>With:(nullable id)parameters handler:(nullable void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler;

/// 列表-<name>
/// @param parameters 请求参数
/// @param handler 请求结果回调处理
+ (void)qh_fetch<name>sWith:(nullable id)parameters handler:(nullable void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler;

@end

NS_ASSUME_NONNULL_END
