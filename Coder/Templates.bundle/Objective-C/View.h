//
//  <prefix><name>View.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "GQHBaseView.h"


/// 视图自定义代理
@protocol <prefix><name>ViewDelegate <NSObject>

@required

@optional

@end


NS_ASSUME_NONNULL_BEGIN

@interface <prefix><name>View : GQHBaseView

/// 视图代理
@property (nonatomic, weak) id<<prefix><name>ViewDelegate> qh_delegate;

/// 列表视图
@property (nonatomic, strong) UITableView *qh_tableView;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface <prefix><name>ViewCell : UITableViewCell

/// 视图代理
@property (nonatomic, weak) id<<prefix><name>ViewDelegate> qh_delegate;
/// cell的data
@property (nonatomic, strong) NSDictionary *qh_data;

/// 根据data创建cell
+ (instancetype)qh_tableView:(UITableView *)tableView cellWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
