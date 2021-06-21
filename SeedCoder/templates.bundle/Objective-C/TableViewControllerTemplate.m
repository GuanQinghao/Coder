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

@interface <prefix><name>Controller ()

/// 列表视图
@property (nonatomic, strong) SeedBaseTableView *tableView;

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
    
    // 列表视图
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.view).with.inset(self.view.s_statusBarHeight + self.view.s_navigationBarHeight);
        make.left.and.right.and.bottom.mas_equalTo(self.view);
    }];
}

#pragma mark --------------------- <delegate & datasource> ---------------------

#pragma mark - UITableViewDelegate

/// 选中列表视图的某行视图
/// @param tableView 列表视图
/// @param indexPath 列表视图选中行视图的索引值
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"");
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/// 列表视图某组头视图高度
/// @param tableView 列表视图
/// @param section 列表视图某组的索引值
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSLog(@"");
    
    return CGFLOAT_MIN;
}

/// 列表视图某组头视图
/// @param tableView 列表视图
/// @param section 列表视图某组的索引值
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSLog(@"");
    
    return [UIView new];
}

/// 列表视图某组尾视图高度
/// @param tableView 列表视图
/// @param section 列表视图某组的索引值
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    NSLog(@"");
    
    return CGFLOAT_MIN;
}

/// 列表视图某组尾视图
/// @param tableView 列表视图
/// @param section 列表视图某组的索引值
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    NSLog(@"");
    
    return [UIView new];
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
    
    return [UITableViewCell new];
}

#pragma mark ---------------------------- <method> ----------------------------

#pragma mark - public method

#pragma mark - target method

#pragma mark - private method

#pragma mark - api method

#pragma mark ------------------------ <setter & getter> ------------------------

#pragma mark - setter

#pragma mark - getter

- (SeedBaseTableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [SeedBaseTableView s_tableViewWith:nil];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSourceArray {
    
    if (!_dataSourceArray) {
        
        _dataSourceArray = [NSMutableArray array];
    }
    
    return _dataSourceArray;
}

@end
