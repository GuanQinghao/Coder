//
//  <prefix><name>View.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "GQHBaseView.h"


#pragma mark --------------------------- <protocol> ---------------------------

NS_ASSUME_NONNULL_BEGIN

/// 控制器自定义根视图的代理协议
@protocol <prefix><name>ViewDelegate <NSObject>

@required

@optional

@end

NS_ASSUME_NONNULL_END


#pragma mark --------------------------- <root view> ---------------------------

NS_ASSUME_NONNULL_BEGIN

/// 控制器自定义根视图
@interface <prefix><name>View : GQHBaseView

/// 视图代理
@property (nonatomic, weak) id<<prefix><name>ViewDelegate> qh_delegate;
/// 视图block回调
@property (nonatomic, copy) void (^qh_block)(id _Nullable sender);

/// 视图数据
@property (nonatomic, strong) id qh_data;

/// 列表视图
@property (nonatomic, strong) UITableView *qh_tableView;

@end

NS_ASSUME_NONNULL_END
