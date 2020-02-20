//
//  <prefix><name>Controller.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#pragma mark Other

#pragma mark Model

#pragma mark View
#import "<prefix><name>View.h"

#pragma mark Controller
#import "<prefix><name>Controller.h"


#pragma mark -

@interface <prefix><name>Controller () <UITableViewDelegate, UITableViewDataSource, <prefix><name>ViewDelegate>

/// 自定义根视图
@property (nonatomic, strong) <prefix><name>View *rootView;

/// 数据源
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation <prefix><name>Controller

#pragma mark ------------------------------------- <lifecycle> -------------------------------------
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

#pragma mark ------------------------------- <delegate & datasource> -------------------------------
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
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    
    // 视图cell
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    // cell = [<#TableViewCell#> qh_tableView:tableView cellForIndexPath:indexPath data:data];
    
    return cell;
}

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
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    
    // 自定义头视图
    UIView *headerView = [[UIView alloc] init];
    // headerView = [<#TableViewHeaderView#> qh_tableView:tableView headerViewWithData:data];
    
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
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    
    // 自定义尾视图
    UIView *footerView = [[UIView alloc] init];
    // footerView = [<#TableViewFooterView#> qh_tableView:tableView footerViewWithData:data];
    
    return footerView;
}

#pragma mark - <prefix><name>ViewDelegate

#pragma mark -------------------------------------- <method> ---------------------------------------
#pragma mark - TargetMethod

#pragma mark - PrivateMethod

#pragma mark ---------------------------------- <setter & getter> ----------------------------------
#pragma mark - Setter

#pragma mark - Getter
- (<prefix><name>View *)rootView {
    
    if (!_rootView) {
        
        _rootView = [[<prefix><name>View alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _rootView.backgroundColor = [UIColor whiteColor];
        _rootView.qh_tableView.delegate = self;
        _rootView.qh_tableView.dataSource = self;
        _rootView.qh_delegate = self;
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
