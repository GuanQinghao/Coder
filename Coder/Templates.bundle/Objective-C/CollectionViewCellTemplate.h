//
//  <prefix><name>CollectionViewCell.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark --------------------------- <protocol> ---------------------------

NS_ASSUME_NONNULL_BEGIN

/// 集合视图自定义单元格视图的代理协议
@protocol <prefix><name>CollectionViewCellDelegate <NSObject>

@required

@optional

@end

NS_ASSUME_NONNULL_END


#pragma mark ----------------------------- <cell> -----------------------------

NS_ASSUME_NONNULL_BEGIN

/// 集合视图的自定义单元格视图
@interface <prefix><name>CollectionViewCell : UICollectionViewCell

/// 视图代理
@property (nonatomic, weak) id<<prefix><name>CollectionViewCellDelegate> qh_delegate;
/// 视图block回调
@property (nonatomic, copy) void (^qh_block)(id _Nullable sender);

/// 视图数据
@property (nonatomic, strong) id qh_data;

/// 根据视图数据创建集合视图的单元格视图
/// @param collectionView 集合视图
/// @param indexPath 单元格视图索引值
/// @param data 单元格视图数据
+ (instancetype)qh_collectionView:(UICollectionView *)collectionView cellForIndexPath:(nullable NSIndexPath *)indexPath data:(nullable id)data;

@end

NS_ASSUME_NONNULL_END
