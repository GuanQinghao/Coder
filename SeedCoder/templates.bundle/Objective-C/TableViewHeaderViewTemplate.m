//
//  <prefix><name>TableViewHeaderView.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>TableViewHeaderView.h"


NSString * const HEADER_<uppercase> = @"<prefix><name>TableViewHeaderView";

@interface <prefix><name>TableViewHeaderView ()

@end

@implementation <prefix><name>TableViewHeaderView

#pragma mark --------------------------- <lifecycle> ---------------------------

/// 根据视图数据创建列表视图的头视图
/// @param tableView 列表视图
/// @param section 列表视图组索引值
/// @param data 列表头视图数据
+ (instancetype)s_tableView:(UITableView *)tableView viewForSection:(NSInteger)section data:(id)data {
    NSLog(@"");
    
    <prefix><name>TableViewHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HEADER_<uppercase>];
    if (!headerView) {
        
        headerView = [[<prefix><name>TableViewHeaderView alloc] initWithReuseIdentifier:HEADER_<uppercase>];
    }
    
    // 根据视图数据更新视图
    headerView.s_data = data;
    
    return headerView;
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

#pragma mark ---------------------------- <layout> ----------------------------

/// 自动布局子视图 -> 约束(mas_make只有一次,自动约束,不需要计算)
- (void)autoLayoutWithConstraints {
    NSLog(@"");
    
}

#pragma mark --------------------- <delegate & datasource> ---------------------

#pragma mark ---------------------------- <method> ----------------------------

#pragma mark - public method

#pragma mark - target method

#pragma mark - private method

/// 根据视图数据更新视图内容
/// @param data 列表头视图数据
- (void)updateHeaderViewContentWith:(id)data {
    NSLog(@"");
    
}

#pragma mark ------------------------ <setter & getter> ------------------------

#pragma mark - setter

- (void)setS_data:(id)s_data {
    [super setS_data:s_data];
    
    // 更新视图内容
    [self updateHeaderViewContentWith:s_data];
}

#pragma mark - getter

@end
