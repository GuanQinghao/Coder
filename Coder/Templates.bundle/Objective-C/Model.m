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

@end
