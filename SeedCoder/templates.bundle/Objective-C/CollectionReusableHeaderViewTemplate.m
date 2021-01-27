//
//  <prefix><name>CollectionReusableHeaderView.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>CollectionReusableHeaderView.h"


@interface <prefix><name>CollectionReusableHeaderView ()

@end

@implementation <prefix><name>CollectionReusableHeaderView

#pragma mark --------------------------- <lifecycle> ---------------------------

/// 根据视图数据创建集合视图的组视图
/// @param collectionView 集合视图
/// @param indexPath 集合视图组索引值
/// @param data 集合视图组视图数据
+ (instancetype)s_collectionView:(UICollectionView *)collectionView supplementaryViewForIndexPath:(NSIndexPath *)indexPath data:(id)data {
    NSLog(@"");
    
    <prefix><name>CollectionReusableHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier: NSStringFromClass([<prefix><name>CollectionReusableHeaderView class]) forIndexPath:indexPath];
    
    // 根据视图数据更新视图
    headerView.s_data = data;
    
    return headerView;
}

/// 初始化集合视图组视图
/// @param frame 集合视图组视图frame
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

/// 自动布局子视图 -> 约束(mas_make只有一次,自动约束，不需要计算)
- (void)autoLayoutWithConstraints {
    NSLog(@"");
    
}

#pragma mark --------------------- <delegate & datasource> ---------------------

#pragma mark ---------------------------- <method> ----------------------------

#pragma mark - public method

#pragma mark - target method

#pragma mark - private method

/// 根据视图数据更新视图内容
/// @param data 集合视图组视图数据
- (void)updateHeaderViewContentWith:(id)data {
    NSLog(@"");
    
}

#pragma mark ------------------------ <setter & getter> ------------------------

#pragma mark - setter

- (void)setS_data:(id)s_data {
    [super setS_data:s_data];
    
    // 更新组视图内容
    [self updateHeaderViewContentWith:s_data];
}

#pragma mark - getter

@end
