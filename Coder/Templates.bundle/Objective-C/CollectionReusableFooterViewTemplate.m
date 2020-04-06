//
//  <prefix><name>CollectionReusableFooterView.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>CollectionReusableFooterView.h"
#import "GQHGeneralHeader.h"


#pragma mark -------------------------------------- <footer> --------------------------------------

@interface <prefix><name>CollectionReusableFooterView ()

@end

@implementation <prefix><name>CollectionReusableFooterView

#pragma mark - Lifecycle

/// 根据视图数据创建集合视图的尾视图
/// @param collectionView 集合视图
/// @param indexPath 集合视图尾视图索引值
/// @param data 集合视图尾视图数据
+ (instancetype)qh_collectionView:(UICollectionView *)collectionView footerViewForIndexPath:(NSIndexPath *)indexPath data:(id)data {
    NSLog(@"");
    
    <prefix><name>CollectionReusableFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier: NSStringFromClass([<prefix><name>CollectionReusableFooterView class]) forIndexPath:indexPath];
    
    // 根据视图数据更新视图
    [footerView updateFooterViewWithData:data];
    
    return footerView;
}

/// 初始化集合视图自定义头视图
/// @param frame 集合视图头视图frame
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
/// @param data 集合尾视图数据
- (void)updateFooterViewWithData:(id)data {
    NSLog(@"");
    
}

#pragma mark - Setter
- (void)setQh_data:(id)qh_data {
    
    _qh_data = qh_data;
    
    // 更新尾视图数据
    [self updateFooterViewWithData:qh_data];
}

#pragma mark - Getter

@end
