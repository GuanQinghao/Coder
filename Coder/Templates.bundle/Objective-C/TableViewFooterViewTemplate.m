//
//  <prefix><name>TableViewFooterView.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>TableViewFooterView.h"
#import "GQHGeneralHeader.h"


@interface <prefix><name>TableViewFooterView ()

@end

@implementation <prefix><name>TableViewFooterView

#pragma mark --------------------------- <lifecycle> ---------------------------

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

/// 初始化列表自定义尾视图
/// @param reuseIdentifier 列表尾视图复用标识
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

/// 布局子视图 -> frame计算
- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"");
    
}

/// 自动布局子视图 -> 约束(mas_make只有一次,自动约束,不要计算)
- (void)autoLayoutWithConstraints {
    NSLog(@"");
    
}

#pragma mark --------------------- <delegate & datasource> ---------------------

#pragma mark ---------------------------- <method> ----------------------------

#pragma mark - target method

#pragma mark - private method

/// 根据视图数据更新视图内容
/// @param data 列表尾视图数据
- (void)updateFooterViewContentWith:(id)data {
    NSLog(@"");
    
}

/// 根据视图数据更新视图布局
/// @param data 列表尾视图数据
- (void)updateFooterViewLayoutWith:(id)data {
    NSLog(@"");
    
}

#pragma mark ------------------------ <setter & getter> ------------------------

#pragma mark - setter

- (void)setQh_data:(id)qh_data {
    
    _qh_data = qh_data;
    
    // 更新尾视图内容
    [self updateFooterViewContentWith:qh_data];
    
    // 更新尾视图布局
    [self updateFooterViewLayoutWith:qh_data];
}

#pragma mark - getter

@end
