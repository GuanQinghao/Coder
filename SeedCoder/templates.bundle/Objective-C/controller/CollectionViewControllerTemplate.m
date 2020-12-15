//
//  <prefix><name>Controller.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#pragma mark - other

#pragma mark - model

#pragma mark - view
#import "<prefix><name>View.h"

#pragma mark - controller
#import "<prefix><name>Controller.h"


#pragma mark -

@interface <prefix><name>Controller () <
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

/// 自定义根视图
@property (nonatomic, strong) <prefix><name>View *rootView;

/// 数据源(共用视图布局数据模型)
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation <prefix><name>Controller

#pragma mark --------------------------- <lifecycle> ---------------------------

/// 1.加载系统根视图或自定义根视图
- (void)loadView {
    [super loadView];
    NSLog(@"");
    
    self.view = self.rootView;
}

/// 2.视图加载完成
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"");
    
}

/// 3.视图即将显示
/// @param animated 是否显示动画效果
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"");
    
}

/// 4.视图即将布局其子视图
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"");
    
}

/// 5.视图已经布局其子视图
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"");
    
}

/// 6.视图已经显示
/// @param animated 是否显示动画效果
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"");
    
}

/// 7.视图即将消失
/// @param animated 是否显示动画效果
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"");
    
}

/// 8.视图已经消失
/// @param animated 是否显示动画效果
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"");
    
}

/// 9.视图被销毁
- (void)dealloc {
    NSLog(@"");
    
}

#pragma mark --------------------- <delegate & datasource> ---------------------

#pragma mark - UITableViewDelegate

/// 列表视图的各行高度
/// @param tableView 列表视图
/// @param indexPath 列表视图某行的索引值
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"");
    
    return 50.0f;
}

/// 选中列表视图的某行视图
/// @param tableView 列表视图
/// @param indexPath 选中列表视图的某行视图的索引值
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"");
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/// 列表视图的组头视图高度
/// @param tableView 列表视图
/// @param section 列表视图的某组索引值
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSLog(@"");
    
    return CGFLOAT_MIN;
}

/// 列表视图的组自定义头视图
/// @param tableView 列表视图
/// @param section 列表视图的某组索引值
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSLog(@"");
    
    // 头视图数据data
    // NSMutableDictionary *data = [NSMutableDictionary dictionary];
    
    // 自定义头视图
    UIView *headerView = [[UIView alloc] init];
    // headerView = [<#TableViewHeaderView#> qh_tableView:tableView headerViewForSection:section data:data];
    
    return headerView;
}

/// 列表视图的组尾视图高度
/// @param tableView 列表视图
/// @param section 列表视图的某组索引值
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    NSLog(@"");
    
    return CGFLOAT_MIN;
}

/// 列表视图的组自定义尾视图
/// @param tableView 列表视图
/// @param section 列表视图的某组索引值
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    NSLog(@"");
    
    // 尾视图数据data
    // NSMutableDictionary *data = [NSMutableDictionary dictionary];
    
    // 自定义尾视图
    UIView *footerView = [[UIView alloc] init];
    // footerView = [<#TableViewFooterView#> qh_tableView:tableView footerViewForSection:section data:data];
    
    return footerView;
}

#pragma mark - UITableViewDataSource

/// 列表视图的总组数
/// @param tableView 列表视图
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"");
    
    return 1;
}

/// 列表视图的各组行数
/// @param tableView 列表视图
/// @param section 列表视图的某组索引值
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"");
    
    return 5;
}

/// 列表视图的行视图
/// @param tableView 列表视图
/// @param indexPath 列表视图某行的索引值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"");
    
    // 数据data
    // NSMutableDictionary *data = [NSMutableDictionary dictionary];
    
    // 列表视图行视图cell
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    // cell = [<#TableViewCell#> qh_tableView:tableView cellForIndexPath:indexPath data:data];
    
    return cell;
}

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
    
    // 数据data
    // NSMutableDictionary *data = [NSMutableDictionary dictionary];
    
    // 集合视图单元格视图cell
    UICollectionViewCell *cell = [[UICollectionViewCell alloc] init];
    // cell = [<#CollectionViewCell#> qh_collectionView:collectionView cellForIndexPath:indexPath data:data];
    
    return cell;
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
        
        // 头视图数据data
        // NSMutableDictionary *data = [NSMutableDictionary dictionary];
        
        // 自定义头视图
        UICollectionReusableView *headerView = [[UICollectionReusableView alloc] init];
        // headerView = [<#UICollectionReusableView#> qh_collectionView:collectionView headerViewForIndexPath:indexPath data:data];
        
        return headerView;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        
        // 尾视图数据data
        // NSMutableDictionary *data = [NSMutableDictionary dictionary];
        
        // 自定义头视图
        UICollectionReusableView *footerView = [[UICollectionReusableView alloc] init];
        // footerView = [<#UICollectionReusableView#> qh_collectionView:collectionView footerViewForIndexPath:indexPath data:data];
        
        return footerView;
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

#pragma mark - <prefix><name>ViewDelegate

#pragma mark ---------------------------- <method> ----------------------------

#pragma mark - target method

#pragma mark - private method

#pragma mark ------------------------ <setter & getter> ------------------------

#pragma mark - setter

#pragma mark - getter

- (<prefix><name>View *)rootView {
    
    if (!_rootView) {
        
        _rootView = [[<prefix><name>View alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _rootView.backgroundColor = [UIColor whiteColor];
        _rootView.qh_delegate = self;
        
        // 列表视图
        _rootView.qh_tableView.delegate = self;
        _rootView.qh_tableView.dataSource = self;
        
        // 集合视图
        _rootView.qh_collectionView.delegate = self;
        _rootView.qh_collectionView.dataSource = self;
        
        // 集合视图注册cell
        // [_rootView.qh_collectionView registerClass:UICollectionViewCell.class.class forCellWithReuseIdentifier:NSStringFromClass(UICollectionViewCell.class)];
        // 集合视图注册headerView
        // [_rootView.qh_collectionView registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(UICollectionReusableView.class)];
        // 集合视图注册footerView
        // [_rootView.qh_collectionView registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(UICollectionReusableView.class)];
    }
    
    return _rootView;
}

- (NSMutableArray *)dataSourceArray {
    
    if (!_dataSourceArray) {
        
        _dataSourceArray = [NSMutableArray array];
    }
    
    return _dataSourceArray;
}

@end
