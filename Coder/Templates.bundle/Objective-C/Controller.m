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
- (void)loadView {
    // 添加自定义视图
    DLog();
    
    self.view = self.rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    DLog();
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    DLog();
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    DLog();
    
}

#pragma mark --Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"aCell";
    <prefix><name>ViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[<prefix><name>ViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = UIColor.clearColor;
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *footer = [[UIView alloc] init];
    footer.backgroundColor = UIColor.clearColor;
    
    return footer;
}

#pragma mark --TargetMethod

#pragma mark --PrivateMethod

#pragma mark --Setter

#pragma mark --Getter
- (<prefix><name>View *)rootView {
    
    if (!_rootView) {
        
        _rootView = [[<prefix><name>View alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _rootView.qh_tableView.delegate = self;
        _rootView.qh_tableView.dataSource = self;
        _rootView.qh_delegate = self;
    }
    
    return _rootView;
}

@end

