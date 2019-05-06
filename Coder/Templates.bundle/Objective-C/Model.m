//
//  <prefix><name>Model.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>Model.h"
#import "GQHHeader.h"


@implementation <prefix><name>Model

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

#pragma mark -
/**
 增-
 
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 */
+ (void)qh_create<name>WithParameters:(id)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure {
    
}

/**
 查-
 
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 */
+ (void)qh_read<name>WithParameters:(id)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message, <prefix><name>Model *model))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure {
    
}

/**
 改-
 
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 */
+ (void)qh_update<name>WithParameters:(id)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure {
    
}

/**
 删-
 
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 */
+ (void)qh_delete<name>WithParameters:(id)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure {
    
}

/**
 列表-
 
 @param parameters 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 */
+ (void)qh_fetch<name>sWithParameters:(id)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message, NSArray<<prefix><name>Model *> *models))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure {
    
}

@end
