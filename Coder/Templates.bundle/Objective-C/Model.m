//
//  <prefix><name>Model.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>Model.h"
#import "GQHHeader.h"


@implementation <prefix><name>Model

/// 模型字段映射
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    
    return @{
             
             @"qh_ID" : @[@"id",@"iD",@"Id"],
             };
}

/// 模型类映射
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    
    return @{
             
//             @"qh_books" : GQHBookModel.class,
             };
}

/// 增-
+ (void)qh_create<name>WithParameters:(NSDictionary *)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure {
    DLog(@"");
    
}

/// 查-
+ (void)qh_read<name>WithParameters:(NSDictionary *)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message, <prefix><name>Model *model))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure {
    DLog(@"");
    
}

/// 改-
+ (void)qh_update<name>WithParameters:(NSDictionary *)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure {
    DLog(@"");
    
}

/// 删-
+ (void)qh_delete<name>WithParameters:(NSDictionary *)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure {
    DLog(@"");
    
}

/// 列表-
+ (void)qh_fetch<name>sWithParameters:(NSDictionary *)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message, NSArray<<prefix><name>Model *> *models))success failure:(void(^)(NSNumber *code, NSString *message, NSError *error))failure {
    DLog(@"");
    
}

@end
