//
//  <prefix><name>CollectionReusableFooterView.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>CollectionReusableFooterView.h"
#import "GQHGeneralHeader.h"


@interface <prefix><name>CollectionReusableFooterView ()

@end

@implementation <prefix><name>CollectionReusableFooterView

#pragma mark --------------------------- <lifecycle> ---------------------------

/// 根据视图数据创建集合视图的尾视图
/// @param collectionView 集合视图
/// @param indexPath 集合视图尾视图索引值
/// @param data 集合视图尾视图数据
+ (instancetype)qh_collectionView:(UICollectionView *)collectionView footerViewForIndexPath:(NSIndexPath *)indexPath data:(id)data {
    NSLog(@"");
    
    <prefix><name>CollectionReusableFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier: NSStringFromClass([<prefix><name>CollectionReusableFooterView class]) forIndexPath:indexPath];
    
    // 根据视图数据更新视图
    footerView.qh_data = data;
    
    return footerView;
}

/// 初始化集合视图自定义尾视图
/// @param frame 集合视图尾视图frame
- (instancetype)initWithFrame:(CGRect)frame {
    NSLog(@"");
    
    if (self = [super initWithFrame:frame]) {
        
        // 初始化自动布局
        [self autoLayoutWithConstraints];
        
        // 其他初始化
        
    }
    
    return self;
}

#pragma mark ---------------------------- <layout> ----------------------------

/// 布局子视图 -> frame计算
- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"");
    
}

/// 自动布局子视图 -> 约束(mas_make只有一次,自动约束，不需要计算)
- (void)autoLayoutWithConstraints {
    NSLog(@"");
    
}

#pragma mark --------------------- <delegate & datasource> ---------------------

#pragma mark ---------------------------- <method> ----------------------------

#pragma mark - target method

#pragma mark - private method

/// 根据视图数据更新视图内容
/// @param data 集合尾视图数据
- (void)updateFooterViewContentWith:(id)data {
    NSLog(@"");
    
}

#pragma mark ------------------------ <setter & getter> ------------------------

#pragma mark - setter

- (void)setQh_data:(id)qh_data {
    
    _qh_data = qh_data;
    
    // 更新尾视图内容
    [self updateFooterViewContentWith:qh_data];
}

#pragma mark - getter

@end
