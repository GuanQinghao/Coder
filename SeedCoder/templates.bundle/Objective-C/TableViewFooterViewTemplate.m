//
//  <prefix><name>TableViewFooterView.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>TableViewFooterView.h"


@interface <prefix><name>TableViewFooterView ()

@end

@implementation <prefix><name>TableViewFooterView

#pragma mark --------------------------- <lifecycle> ---------------------------

/// 根据视图数据创建列表视图的尾视图
/// @param tableView 列表视图
/// @param section 列表视图组索引值
/// @param data 列表尾视图数据
+ (instancetype)s_tableView:(UITableView *)tableView viewForSection:(NSInteger)section data:(id)data {
    NSLog(@"");
    
    static NSString *identifier = @"<prefix><name>TableViewFooterView";
    <prefix><name>TableViewFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!footerView) {
        
        footerView = [[<prefix><name>TableViewFooterView alloc] initWithReuseIdentifier:identifier];
    }
    
    // 根据视图数据更新视图
    footerView.s_data = data;
    
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
/// @param data 列表尾视图数据
- (void)updateFooterViewContentWith:(id)data {
    NSLog(@"");
    
}

#pragma mark ------------------------ <setter & getter> ------------------------

#pragma mark - setter

- (void)setS_data:(id)s_data {
    [super setS_data:s_data];
    
    // 更新尾视图内容
    [self updateFooterViewContentWith:s_data];
}

#pragma mark - getter

@end
