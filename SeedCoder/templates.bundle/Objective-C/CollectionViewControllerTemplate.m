//
//  <prefix><name>Controller.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#pragma mark - other

#pragma mark - model

#pragma mark - view

#pragma mark - controller
#import "<prefix><name>Controller.h"


#pragma mark -

@interface <prefix><name>Controller () <
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

/// 集合视图
@property (nonatomic, strong) SeedBaseCollectionView *collectionView;

/// 数据源(共用视图布局数据模型)
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation <prefix><name>Controller

#pragma mark --------------------------- <lifecycle> ---------------------------

/// 视图加载完成
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"");
    
    // 布局视图
    [self autoLayoutWithConstraints];
}

/// 视图即将显示
/// @param animated 是否显示动画效果
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"");
    
}

#pragma mark ---------------------------- <layout> ----------------------------

/// 自动布局子视图 -> 约束(mas_make只有一次,自动约束,不要计算)
- (void)autoLayoutWithConstraints {
    NSLog(@"");
    
    // 集合视图
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.view).with.inset(self.view.s_statusBarHeight + self.view.s_navigationBarHeight);
        make.left.and.right.and.bottom.mas_equalTo(self.view);
    }];
}

#pragma mark --------------------- <delegate & datasource> ---------------------

#pragma mark - UICollectionViewDelegate

/// 点击选择集合视图单元格视图
/// @param collectionView 集合视图
/// @param indexPath 选择的单元格视图索引值
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"");
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

#pragma mark - UICollectionViewDataSource

/// 集合视图各组的单元格个数
/// @param collectionView 集合视图
/// @param section 集合视图某组的索引值
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"");
    
    return 5;
}

/// 集合视图的各单元格视图
/// @param collectionView 集合视图
/// @param indexPath 集合视图某单元格索引值
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"");
    
    return [UICollectionViewCell new];
}

/// 集合视图的总组数
/// @param collectionView 集合视图
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSLog(@"");
    
    return 1;
}

/// 集合视图每组的附加视图(头视图和尾视图)
/// @param collectionView 集合视图
/// @param kind 附加视图的类型
/// @param indexPath 集合视图某组的索引值
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"");
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        return [UICollectionReusableView new];
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        
        return [UICollectionReusableView new];
    }
    
    return [UICollectionReusableView new];
}

#pragma mark - UICollectionViewDelegateFlowLayout

/// 集合视图单元格的尺寸大小
/// @param collectionView 集合视图
/// @param collectionViewLayout 集合视图布局
/// @param indexPath 单元格索引值
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"");
    
    return CGSizeZero;
}

/// 集合视图索引视图的边距
/// @param collectionView 集合视图
/// @param collectionViewLayout 集合视图的布局
/// @param section 集合视图某组的索引值
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    NSLog(@"");
    
    return UIEdgeInsetsZero;
}

/// 集合视图各组的单元格最小行间距(垂向距离)
/// @param collectionView 集合视图
/// @param collectionViewLayout 集合视图布局
/// @param section 集合视图组索引值
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    NSLog(@"");
    
    return CGFLOAT_MIN;
}

/// 集合视图各组的单元格最小列间距(水平距离)
/// @param collectionView 集合视图
/// @param collectionViewLayout 集合视图布局
/// @param section 集合视图组索引值
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    NSLog(@"");
    
    return CGFLOAT_MIN;
}

/// 集合视图头视图的大小
/// @param collectionView 集合视图
/// @param collectionViewLayout 集合视图布局
/// @param section 集合视图头视图的索引值
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    NSLog(@"");
    
    return CGSizeZero;
}

/// 集合视图尾视图的大小
/// @param collectionView 集合视图
/// @param collectionViewLayout 集合视图布局
/// @param section 集合视图尾视图的索引值
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    NSLog(@"");
    
    return CGSizeZero;
}

#pragma mark ---------------------------- <method> ----------------------------

#pragma mark - public method

#pragma mark - target method

#pragma mark - private method

#pragma mark - api method

#pragma mark ------------------------ <setter & getter> ------------------------

#pragma mark - setter

#pragma mark - getter

- (SeedBaseCollectionView *)collectionView {
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [SeedBaseCollectionView s_collectionViewWith:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        // 集合视图注册cell
        //[_collectionView registerClass:UICollectionViewCell.class.class forCellWithReuseIdentifier:NSStringFromClass(UICollectionViewCell.class)];
        // 集合视图注册headerView
        //[_collectionView registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(UICollectionReusableView.class)];
        // 集合视图注册footerView
        //[_collectionView registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(UICollectionReusableView.class)];
    }
    
    return _collectionView;
}

- (NSMutableArray *)dataSourceArray {
    
    if (!_dataSourceArray) {
        
        _dataSourceArray = [NSMutableArray array];
    }
    
    return _dataSourceArray;
}

@end
