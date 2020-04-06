//
//  <prefix><name>CollectionViewCell.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>CollectionViewCell.h"
#import "GQHGeneralHeader.h"


#pragma mark --------------------------------------- <cell> ---------------------------------------

@interface <prefix><name>CollectionViewCell ()

@end

@implementation <prefix><name>CollectionViewCell

#pragma mark - Lifecycle
/// 根据视图数据创建集合视图的单元格视图
/// @param collectionView 集合视图
/// @param indexPath 单元格视图索引值
/// @param data 单元格视图数据
+ (instancetype)qh_collectionView:(UICollectionView *)collectionView cellForIndexPath:(NSIndexPath *)indexPath data:(id)data {
    NSLog(@"");
    
    <prefix><name>CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([<prefix><name>CollectionViewCell class]) forIndexPath:indexPath];
    
    // 根据视图数据更新视图
    cell.qh_data = data;
    
    return cell;
}

/// 初始化集合视图自定义单元格视图
/// @param frame 单元格视图frame
- (instancetype)initWithFrame:(CGRect)frame {
    NSLog(@"");
    
    if (self = [super initWithFrame:frame]) {
        
        // 初始化自动布局
        [self autoLayoutWithConstraints];
        
        // 其他初始化
        
    }
    
    return self;
}

/// 布局子视图 -> frame计算
- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"");
    
}

/// 自动布局子视图 -> 约束(mas_make只有一次,自动约束，不要计算)
- (void)autoLayoutWithConstraints {
    NSLog(@"");
    
}

#pragma mark - Delegate

#pragma mark - TargetMethod

#pragma mark - PrivateMethod
/// 根据视图数据更新视图
/// @param data 集合视图单元格视图数据
- (void)updateCellWithData:(id)data {
    NSLog(@"");
    
}

#pragma mark - Setter
- (void)setQh_data:(id)qh_data {
    
    _qh_data = qh_data;
    
    // 更新cell的数据
    [self updateCellWithData:qh_data];
}

#pragma mark - Getter

@end
