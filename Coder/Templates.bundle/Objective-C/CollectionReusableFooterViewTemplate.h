//
//  <prefix><name>CollectionReusableFooterView.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark ----------------------------------- <delegate> -----------------------------------

NS_ASSUME_NONNULL_BEGIN

/// 自定义视图的代理
@protocol <prefix><name>CollectionReusableFooterViewDelegate <NSObject>

@required

@optional

@end

NS_ASSUME_NONNULL_END


#pragma mark -------------------------------------- <footer> --------------------------------------

NS_ASSUME_NONNULL_BEGIN

/// 集合视图的自定义头视图
@interface <prefix><name>CollectionReusableFooterView : UICollectionReusableView

/// 视图代理
@property (nonatomic, weak) id<<prefix><name>CollectionReusableFooterViewDelegate> qh_delegate;
/// 视图block回调
@property (nonatomic, copy) void (^qh_block)(id _Nullable sender);

/// 视图数据
@property (nonatomic, strong) id qh_data;

/// 根据视图数据创建集合视图的尾视图
/// @param collectionView 集合视图
/// @param indexPath 集合视图尾视图索引值
/// @param data 集合视图尾视图数据
+ (instancetype)qh_collectionView:(UICollectionView *)collectionView footerViewForIndexPath:(nullable NSIndexPath *)indexPath data:(nullable id)data;

@end

NS_ASSUME_NONNULL_END
