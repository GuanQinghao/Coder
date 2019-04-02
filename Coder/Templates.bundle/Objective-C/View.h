//
//  <prefix><name>View.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "GQHBaseView.h"


#pragma mark -
#pragma mark - 视图自定义代理
#pragma mark -

@protocol <prefix><name>ViewDelegate <NSObject>

@required

@optional

@end


#pragma mark -
#pragma mark - 自定义根视图
#pragma mark -

NS_ASSUME_NONNULL_BEGIN

@interface <prefix><name>View : GQHBaseView

/// 视图代理
@property (nonatomic, weak) id<<prefix><name>ViewDelegate> qh_delegate;

/// 列表视图
@property (nonatomic, strong) UITableView *qh_tableView;

@end

NS_ASSUME_NONNULL_END


#pragma mark -
#pragma mark - <#comment#>
#pragma mark -

NS_ASSUME_NONNULL_BEGIN

@interface <prefix><name>TableViewCell : UITableViewCell

/// 视图代理
@property (nonatomic, weak) id<<prefix><name>ViewDelegate> qh_delegate;
/// 视图数据
@property (nonatomic, strong) id qh_data;

/// 根据视图数据创建视图
+ (instancetype)qh_tableView:(UITableView *)tableView cellWithData:(id)data;

@end

NS_ASSUME_NONNULL_END


#pragma mark -
#pragma mark - <#comment#>
#pragma mark -

NS_ASSUME_NONNULL_BEGIN

@interface <prefix><name>TableViewHeaderView : UITableViewHeaderFooterView

/// 视图代理
@property (nonatomic, weak) id<<prefix><name>ViewDelegate> qh_delegate;
/// 视图数据
@property (nonatomic, strong) id qh_data;

/// 根据视图数据创建视图
+ (instancetype)qh_tableView:(UITableView *)tableView headerViewWithData:(id)data;

@end

NS_ASSUME_NONNULL_END


#pragma mark -
#pragma mark - <#comment#>
#pragma mark -

NS_ASSUME_NONNULL_BEGIN

@interface <prefix><name>TableViewFooterView : UITableViewHeaderFooterView

/// 视图代理
@property (nonatomic, weak) id<<prefix><name>ViewDelegate> qh_delegate;
/// 视图数据
@property (nonatomic, strong) id qh_data;

/// 根据视图数据创建视图
+ (instancetype)qh_tableView:(UITableView *)tableView footerViewWithData:(id)data;

@end

NS_ASSUME_NONNULL_END
