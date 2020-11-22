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

@interface <prefix><name>Controller ()

/// 自定义根视图
@property (nonatomic, strong) <prefix><name>View *rootView;

/// 数据源
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

#pragma mark --------------------- <delegate & datasource> ---------------------

#pragma mark - UITableViewDelegate

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
    
    UIView *headerView = [[UIView alloc] init];
    //headerView = [<#TableViewHeaderView#> s_tableView:tableView viewForSection:section data:<#(nullable id)#>];
    
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
    
    UIView *footerView = [[UIView alloc] init];
    //footerView = [<#TableViewHeaderView#> s_tableView:tableView viewForSection:section data:<#(nullable id)#>];
    
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
    
    //<#TableViewCell#> *cell = [<#TableViewCell#> s_tableView:tableView cellForIndexPath:indexPath data:<#(nullable id)#>];
    //return cell;
    
    return [UITableViewCell new];
}

#pragma mark ---------------------------- <method> ----------------------------

#pragma mark - target method

#pragma mark - private method

#pragma mark - api method

#pragma mark ------------------------ <setter & getter> ------------------------

#pragma mark - setter

#pragma mark - getter

- (<prefix><name>View *)rootView {
    
    if (!_rootView) {
        
        _rootView = [[<prefix><name>View alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _rootView.backgroundColor = [UIColor whiteColor];
        _rootView.s_tableView.delegate = self;
        _rootView.s_tableView.dataSource = self;
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
