//
//  <prefix><name>View.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>View.h"


@interface <prefix><name>View ()

@end

@implementation <prefix><name>View

#pragma mark --------------------------- <lifecycle> ---------------------------

/// 初始化控制器自定义根视图
/// @param frame 自定义根视图的frame
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

/// 自动布局子视图 -> 约束(mas_make只有一次,自动约束,不要计算)
- (void)autoLayoutWithConstraints {
    NSLog(@"");
    
    // 列表视图
    [self addSubview:self.qh_tableView];
    [self.qh_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self).with.inset(self.qh_statusBarHeight + self.qh_navigationBarHeight);
        make.left.and.right.and.bottom.mas_equalTo(self);
    }];
    
    // 集合视图
    // [self addSubview:self.qh_collectionView];
    // [self.qh_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
    //
    //     make.top.mas_equalTo(self).with.inset(self.qh_statusBarHeight + self.qh_navigationBarHeight);
    //     make.left.and.right.and.bottom.mas_equalTo(self);
    // }];
}

#pragma mark --------------------- <delegate & datasource> ---------------------

#pragma mark ---------------------------- <method> ----------------------------

#pragma mark - target method

#pragma mark - private method

/// 根据视图数据更新视图内容
/// @param data 视图数据
- (void)updateRootViewContentWith:(id)data {
    NSLog(@"");
    
}

/// 根据视图数据更新视图布局
/// @param data 视图数据
- (void)updateRootViewLayoutWith:(id)data {
    NSLog(@"");
    
}

#pragma mark ------------------------ <setter & getter> ------------------------

#pragma mark - setter

- (void)setQh_data:(id)qh_data {
    
    _qh_data = qh_data;
    
    // 更新视图内容
    [self updateRootViewContentWith:qh_data];
    
    // 更新视图布局
    [self updateRootViewLayoutWith:qh_data];
}

#pragma mark - getter

- (UITableView *)qh_tableView {
    
    if (!_qh_tableView) {
        
        _qh_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _qh_tableView.backgroundColor = [UIColor whiteColor];
        _qh_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _qh_tableView.showsVerticalScrollIndicator = NO;
        _qh_tableView.showsHorizontalScrollIndicator = NO;
        
        // 列表自动计算行高
        _qh_tableView.estimatedRowHeight = 200.0f;
        _qh_tableView.rowHeight = UITableViewAutomaticDimension;
        
        if (@available(iOS 11.0, *)) {
            
            _qh_tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    
    return _qh_tableView;
}

- (UICollectionView *)qh_collectionView {
    
    if (!_qh_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        // CGRectZero
        _qh_collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _qh_collectionView.bounces = YES;
        _qh_collectionView.pagingEnabled = NO;
        _qh_collectionView.showsVerticalScrollIndicator = NO;
        _qh_collectionView.showsHorizontalScrollIndicator = NO;
        _qh_collectionView.backgroundColor = [UIColor whiteColor];
        
        if (@available(iOS 11.0, *)) {
            
            _qh_collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    
    return _qh_collectionView;
}

@end
