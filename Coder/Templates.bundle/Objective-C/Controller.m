//
//  <prefix><name>Controller.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#pragma mark Macro
#import "GQHHeader.h"

#pragma mark Model

#pragma mark Object

#pragma mark View
#import "<prefix><name>View.h"

#pragma mark Controller
#import "<prefix><name>Controller.h"

#pragma mark CocoaPods

#pragma mark ----------Header End----------


@interface <prefix><name>Controller () <UITableViewDelegate, UITableViewDataSource, <prefix><name>ViewDelegate>

/// 自定义根视图
@property (nonatomic, strong) <prefix><name>View *rootView;

@end


@implementation <prefix><name>Controller

#pragma mark --Lifecycle
/// 1.加载系统根视图或自定义根视图
- (void)loadView {
    DLog();
    
    self.view = self.rootView;
}

/// 2.视图加载完成
- (void)viewDidLoad {
    [super viewDidLoad];
    DLog();
    
}

/// 3.视图即将显示
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    DLog();
    
}

/// 4.视图即将布局其子视图
- (void)viewWillLayoutSubviews {
    DLog();
    
}

/// 5.视图已经布局其子视图
- (void)viewDidLayoutSubviews {
    DLog();
    
}

/// 6.视图已经显示
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    DLog();
    
}

/// 7.视图即将消失
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    DLog();
    
}

/// 8.视图已经消失
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    DLog();
    
}

/// 9.视图被销毁
- (void)dealloc {
    DLog();
    
}

#pragma mark --Delegate
#pragma mark ---UITableViewDelegate&UITableViewDataSource
/// 列表的总段数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    DLog();
    
    return 1;
}

/// 列表的各段行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    DLog();
    
    return 5;
}

/// 列表的各行高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DLog();
    
    return 50.0f;
}

/// 列表的各行单元格视图
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DLog();
    
    static NSString *identifier = @"aCell";
    <prefix><name>ViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[<prefix><name>ViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

/// 选中列表的某行单元格
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DLog();
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/// 列表的各段头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    DLog();
    
    return CGFLOAT_MIN;
}

/// 列表的各段自定义头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DLog();
    
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = UIColor.clearColor;
    
    return header;
}

/// 列表的各段根视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    DLog();
    
    return CGFLOAT_MIN;
}

/// 列表的各段自定义根视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    DLog();
    
    UIView *footer = [[UIView alloc] init];
    footer.backgroundColor = UIColor.clearColor;
    
    return footer;
}

#pragma mark ---<prefix><name>ViewDelegate

#pragma mark --TargetMethod

#pragma mark --PrivateMethod

#pragma mark --Setter

#pragma mark --Getter
- (<prefix><name>View *)rootView {
    
    if (!_rootView) {
        
        _rootView = [[<prefix><name>View alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _rootView.backgroundColor = UIColor.whiteColor;
        _rootView.qh_tableView.delegate = self;
        _rootView.qh_tableView.dataSource = self;
        _rootView.qh_delegate = self;
    }
    
    return _rootView;
}

@end
