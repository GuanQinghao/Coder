//
//  <prefix><name>TableViewCell.m
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>TableViewCell.h"
#import "GQHGeneralHeader.h"


@interface <prefix><name>TableViewCell ()

@end

@implementation <prefix><name>TableViewCell

#pragma mark --------------------------- <lifecycle> ---------------------------

/// 根据视图数据创建列表视图的行视图
/// @param tableView 列表视图
/// @param indexPath 列表行视图索引值
/// @param data 列表行视图数据
+ (instancetype)qh_tableView:(UITableView *)tableView cellForIndexPath:(NSIndexPath *)indexPath data:(id)data {
    NSLog(@"");
    
    static NSString *identifier = @"<prefix><name>TableViewCell";
    <prefix><name>TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[<prefix><name>TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // 根据视图数据更新视图
    cell.qh_data = data;
    
    return cell;
}

/// 初始化列表自定义行视图
/// @param style 列表行视图样式
/// @param reuseIdentifier 列表行视图复用标识
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    NSLog(@"");
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
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
/// @param data 列表行视图数据
- (void)updateCellContentWith:(id)data {
    NSLog(@"");
    
}

/// 根据视图数据更新视图布局
/// @param data 列表行视图数据
- (void)updateCellLayoutWith:(id)data {
    NSLog(@"");
    
}

#pragma mark ------------------------ <setter & getter> ------------------------

#pragma mark - setter

- (void)setQh_data:(id)qh_data {
    
    _qh_data = qh_data;
    
    // 更新行视图内容
    [self updateCellContentWith:qh_data];
    
    // 更新行视图布局
    [self updateCellLayoutWith:qh_data];
}

#pragma mark - getter

@end
