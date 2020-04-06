//
//  <prefix><name>TableViewFooterView.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>TableViewFooterView.h"
#import "GQHGeneralHeader.h"


#pragma mark -------------------------------------- <footer> --------------------------------------

@interface <prefix><name>TableViewFooterView ()

@end

@implementation <prefix><name>TableViewFooterView

#pragma mark - Lifecycle
/// 根据视图数据创建列表视图的尾视图
/// @param tableView 列表视图
/// @param section 列表视图组索引值
/// @param data 列表尾视图数据
+ (instancetype)qh_tableView:(UITableView *)tableView footerViewForSection:(NSInteger)section data:(id)data {
    NSLog(@"");
    
    static NSString *identifier = @"<prefix><name>TableViewFooterView";
    <prefix><name>TableViewFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!footerView) {
        
        footerView = [[<prefix><name>TableViewFooterView alloc] initWithReuseIdentifier:identifier];
    }
    
    // 根据视图数据更新视图
    footerView.qh_data = data;
    
    return footerView;
}

/// 初始化列表自定义头视图
/// @param reuseIdentifier 列表头视图复用标识
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    NSLog(@"");
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        // 初始化自动布局
        [self autoLayoutWithConstraints];
        
        // 其他初始化
        
    }
    
    return self;
}

/// 布局子视图 -> frame计算
- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"");
    
}

/// 自动布局子视图 -> 约束(mas_make只有一次,自动约束,不要计算)
- (void)autoLayoutWithConstraints {
    NSLog(@"");
    
}

#pragma mark - Delegate

#pragma mark - TargetMethod

#pragma mark - PrivateMethod
/// 根据视图数据更新视图
/// @param data 列表头视图数据
- (void)updateFooterViewWithData:(id)data {
    NSLog(@"");
    
}

#pragma mark - Setter
- (void)setQh_data:(id)qh_data {
    
    _qh_data = qh_data;
    
    // 更新头视图数据
    [self updateFooterViewWithData:qh_data];
}

#pragma mark - Getter

@end
