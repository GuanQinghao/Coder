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

+ (void)qh_create<name>WithParameters:(id)parameters handler:(void (^)(BOOL, NSNumber * _Nonnull, NSString * _Nonnull, id _Nonnull))handler {
    
}

+ (void)qh_read<name>WithParameters:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

+ (void)qh_update<name>WithParameters:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

+ (void)qh_delete<name>WithParameters:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

+ (void)qh_fetch<name>sWithParameters:(id)parameters handler:(void(^)(BOOL status, NSNumber *code, NSString *message, id data))handler {
    
}

@end
