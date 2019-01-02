//
//  <prefix><name>Model.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "GQHBaseModel.h"


@interface <prefix><name>Model : GQHBaseModel

/// ID
@property (nonatomic, copy) NSString *qh_ID;

/// 模型类
//@property (nonatomic, strong) NSArray<GQHBookModel *> *qh_books;

/// 增-
+ (void)qh_create<name>WithParameters:(NSDictionary *)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message))success failure:(void(^)(NSError *error))failure;

/// 查-
+ (void)qh_read<name>WithParameters:(NSDictionary *)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message, <prefix><name>Model *model))success failure:(void(^)(NSError *error))failure;

/// 改-
+ (void)qh_update<name>WithParameters:(NSDictionary *)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message))success failure:(void(^)(NSError *error))failure;

/// 删-
+ (void)qh_delete<name>WithParameters:(NSDictionary *)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message))success failure:(void(^)(NSError *error))failure;

/// 列表-
+ (void)qh_fetch<name>sWithParameters:(NSDictionary *)parameters success:(void(^)(BOOL status, NSNumber *code, NSString *message, NSArray<<prefix><name>Model *> *models))success failure:(void(^)(NSError *error))failure;

@end
