//
//  <prefix><name>TableViewHeaderView.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark ----------------------------------- <delegate> -----------------------------------

NS_ASSUME_NONNULL_BEGIN

/// 自定义视图的代理
@protocol <prefix><name>TableViewHeaderViewDelegate <NSObject>

@required

@optional

@end

NS_ASSUME_NONNULL_END


#pragma mark -------------------------------------- <header> --------------------------------------

NS_ASSUME_NONNULL_BEGIN

/// 列表视图的自定义头视图
@interface <prefix><name>TableViewHeaderView : UITableViewHeaderFooterView

/// 视图代理
@property (nonatomic, weak) id<<prefix><name>TableViewHeaderViewDelegate> qh_delegate;
/// 视图block回调
@property (nonatomic, copy) void(^qh_block)(id _Nullable sender);

/// 视图数据
@property (nonatomic, strong) id qh_data;

/// 根据视图数据创建列表视图的头视图
/// @param tableView 列表视图
/// @param section 列表视图组索引值
/// @param data 列表尾视图数据
+ (instancetype)qh_tableView:(UITableView *)tableView headerViewForSection:(NSInteger)section data:(nullable id)data;

@end

NS_ASSUME_NONNULL_END
