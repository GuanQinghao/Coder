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

/// 列表视图
@property (nonatomic, strong) UITableView *qh_tableView;

@end


@interface <prefix><name>ViewCell : UITableViewCell

@end
