//
//  <prefix><name>Model.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "GQHBaseModel.h"


NS_ASSUME_NONNULL_BEGIN


/**
 <#Description#>
 */
@interface <prefix><name>Model : GQHBaseModel

/**
 ID
 */
@property (nonatomic, copy) NSString *qh_ID;

/**
 模型类
 */
//@property (nonatomic, strong) NSArray<GQHBookModel *> *qh_books;

#pragma mark -
/**
 增-
 
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 */
+ (void)qh_create<name>WithParameters:(id)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure;

/**
 查-
 
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 */
+ (void)qh_read<name>WithParameters:(id)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message, <prefix><name>Model *model))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure;

/**
 改-
 
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 */
+ (void)qh_update<name>WithParameters:(id)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure;

/**
 删-
 
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 */
+ (void)qh_delete<name>WithParameters:(id)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure;

/**
 列表-
 
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 */
+ (void)qh_fetch<name>sWithParameters:(id)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message, NSArray<<prefix><name>Model *> *models))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
