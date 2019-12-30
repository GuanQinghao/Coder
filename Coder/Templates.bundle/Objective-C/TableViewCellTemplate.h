//
//  <prefix><name>TableViewCell.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark ----------------------------------- <cell delegate> -----------------------------------

NS_ASSUME_NONNULL_BEGIN

/**
 自定义视图的代理
 */
@protocol <prefix><name>TableViewCellDelegate <NSObject>

@required

@optional

@end

NS_ASSUME_NONNULL_END


#pragma mark --------------------------------------- <cell> ---------------------------------------

NS_ASSUME_NONNULL_BEGIN

/**
 列表视图的自定义行视图
 */
@interface <prefix><name>TableViewCell : UITableViewCell

/**
 视图代理
 */
@property (nonatomic, weak) id<<prefix><name>TableViewCellDelegate> qh_delegate;

/**
 视图数据
 */
@property (nonatomic, strong) id qh_data;

/**
 根据视图数据创建列表视图的行视图
 
 @param tableView 列表视图
 @param data 列表行视图数据
 @return 自定义行视图
 */
+ (instancetype)qh_tableView:(UITableView *)tableView cellWithData:(nullable id)data;

@end

NS_ASSUME_NONNULL_END
