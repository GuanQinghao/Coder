//
//  <prefix><name>View.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "GQHBaseView.h"


#pragma mark ------------------------------------- <delegate> -------------------------------------

NS_ASSUME_NONNULL_BEGIN

/// 自定义视图的代理
@protocol <prefix><name>ViewDelegate <NSObject>

@required

@optional

@end

NS_ASSUME_NONNULL_END


#pragma mark --------------------------------------- <view> ---------------------------------------

NS_ASSUME_NONNULL_BEGIN

/// <#Description#>
@interface <prefix><name>View : GQHBaseView

/// 视图代理回调
@property (nonatomic, weak) id<<prefix><name>ViewDelegate> qh_delegate;
/// 视图block回调
@property (nonatomic, copy) void(^qh_block)(id _Nullable result);

/// 视图数据
@property (nonatomic, strong) id qh_data;

@end

NS_ASSUME_NONNULL_END
