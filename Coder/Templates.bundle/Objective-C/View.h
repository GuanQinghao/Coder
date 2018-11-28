//
//  <prefix><name>View.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "GQHBaseView.h"


@protocol <prefix><name>ViewDelegate <NSObject>

@required

@optional

@end


@interface <prefix><name>View : GQHBaseView

/// 代理
@property (nonatomic, weak) id<<prefix><name>ViewDelegate> qh_delegate;

/// 列表视图
@property (nonatomic, strong) UITableView *qh_tableView;

@end


@interface <prefix><name>ViewCell : UITableViewCell

/// 代理
@property (nonatomic, weak) id<<prefix><name>ViewDelegate> qh_delegate;

@end
