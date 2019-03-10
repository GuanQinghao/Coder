//
//  <prefix><name>View.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>View.h"
#import "GQHHeader.h"


@interface <prefix><name>View ()

@end


@implementation <prefix><name>View

/// 初始化控制器自定义根视图
- (instancetype)initWithFrame:(CGRect)frame {
    DLog();
    
    if (self = [super initWithFrame:frame]) {
        
        // 其他初始化
        
    }
    
    return self;
}

/// 布局自定义子视图
- (void)layoutSubviews {
    DLog();
    
    [self addSubview:self.qh_tableView];
    [self.qh_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self).with.inset(self.qh_statusBarHeight + self.qh_navigationBarHeight);
        make.left.and.right.and.bottom.mas_equalTo(self);
    }];
}

#pragma mark --Delegate

#pragma mark --TargetMethod

#pragma mark --PrivateMethod

#pragma mark --Setter

#pragma mark --Getter
- (UITableView *)qh_tableView {
    
    if (!_qh_tableView) {
        
        _qh_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _qh_tableView.backgroundColor = UIColor.whiteColor;
        _qh_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _qh_tableView.showsVerticalScrollIndicator = NO;
        
        if (@available(iOS 11.0, *)) {
            
            _qh_tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    
    return _qh_tableView;
}

@end


@interface <prefix><name>ViewCell ()

@end


@implementation <prefix><name>ViewCell

/// 根据视图数据创建视图
+ (instancetype)qh_tableView:(UITableView *)tableView cellWithData:(NSDictionary *)data {
    
    static NSString *identifier = @"<prefix><name>ViewCell";
    <prefix><name>ViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[<prefix><name>ViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // 根据视图数据更新视图
    [cell updateCellWithData:data];
    
    return cell;
}

/// 初始化列表自定义行视图
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    DLog();
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 其他初始化
        
    }
    
    return self;
}

/// 布局自定义子视图
- (void)layoutSubviews {
    DLog();
    
}

#pragma mark --Delegate

#pragma mark --TargetMethod

#pragma mark --PrivateMethod
/// 根据视图数据更新视图
- (void)updateCellWithData:(NSDictionary *)data {
    DLog();
    
}

#pragma mark --Setter
- (void)setQh_data:(NSDictionary *)qh_data {
    
    _qh_data = qh_data;
    
    // 更新cell的数据
    [self updateCellWithData:qh_data];
}

#pragma mark --Getter

@end


@interface <prefix><name>ViewHeaderView ()

@end


@implementation <prefix><name>ViewHeaderView

/// 根据视图数据创建视图
+ (instancetype)qh_tableView:(UITableView *)tableView headerViewWithData:(NSDictionary *)data {
    
    static NSString *identifier = @"<prefix><name>ViewHeaderView";
    <prefix><name>ViewHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!headerView) {
        
        headerView = [[<prefix><name>ViewHeaderView alloc] initWithReuseIdentifier:identifier];
    }
    
    // 根据视图数据更新视图
    [headerView updateHeaderViewWithData:data];
    
    return headerView;
}

/// 初始化列表组自定义头视图
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    DLog();
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        // 其他初始化
        
    }
    
    return self;
}

/// 布局自定义子视图
- (void)layoutSubviews {
    DLog();
    
}

#pragma mark --Delegate

#pragma mark --TargetMethod

#pragma mark --PrivateMethod
/// 根据视图数据更新视图
- (void)updateHeaderViewWithData:(NSDictionary *)data {
    DLog();
    
}

#pragma mark --Setter
- (void)setQh_data:(NSDictionary *)qh_data {
    
    _qh_data = qh_data;
    
    // 更新头视图数据
    [self updateHeaderViewWithData:qh_data];
}

#pragma mark --Getter

@end


@interface <prefix><name>ViewFooterView ()

@end


@implementation <prefix><name>ViewFooterView

/// 根据视图数据创建视图
+ (instancetype)qh_tableView:(UITableView *)tableView footerViewWithData:(nonnull NSDictionary *)data {
    
    static NSString *identifier = @"<prefix><name>ViewFooterView";
    <prefix><name>ViewFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!footerView) {
        
        footerView = [[<prefix><name>ViewFooterView alloc] initWithReuseIdentifier:identifier];
    }
    
    // 根据视图数据更新视图
    [footerView updateFooterViewWithData:data];
    
    return footerView;
}

/// 初始化列表组自定义根视图
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    DLog();
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        // 其他初始化
        
    }
    
    return self;
}

/// 布局自定义子视图
- (void)layoutSubviews {
    DLog();
    
}

#pragma mark --Delegate

#pragma mark --TargetMethod

#pragma mark --PrivateMethod
/// 根据视图数据更新视图
- (void)updateFooterViewWithData:(NSDictionary *)data {
    DLog();
    
}

#pragma mark --Setter
- (void)setQh_data:(NSDictionary *)qh_data {
    
    _qh_data = qh_data;
    
    // 更新根视图数据
    [self updateFooterViewWithData:qh_data];
}

#pragma mark --Getter

@end
