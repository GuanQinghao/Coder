//
//  <prefix><name>View.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>View.h"
#import "GQHHeader.h"


#pragma mark -
#pragma mark - 自定义根视图
#pragma mark -

@interface <prefix><name>View ()

@end

@implementation <prefix><name>View

#pragma mark - Lifecycle
/// 初始化控制器自定义根视图
- (instancetype)initWithFrame:(CGRect)frame {
    DLog();
    
    if (self = [super initWithFrame:frame]) {
        
        // 初始化自动布局
        [self autoLayoutWithConstraints];
        
        // 其他初始化
        
    }
    
    return self;
}

/// 布局子视图 -> frame计算
- (void)layoutSubviews {
    [super layoutSubviews];
    DLog();
    
}

/// 自动布局子视图 -> 约束(mas_make只有一次,自动约束，不要计算)
- (void)autoLayoutWithConstraints {
    DLog();
    
    [self addSubview:self.qh_tableView];
    [self.qh_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self).with.inset(self.qh_statusBarHeight + self.qh_navigationBarHeight);
        make.left.and.right.and.bottom.mas_equalTo(self);
    }];
}

#pragma mark - Delegate

#pragma mark - TargetMethod

#pragma mark - PrivateMethod

#pragma mark - Setter

#pragma mark - Getter
/// 列表视图
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


#pragma mark -
#pragma mark - <#comment#>
#pragma mark -

@interface <prefix><name>ViewCell ()

@end

@implementation <prefix><name>ViewCell

#pragma mark - Lifecycle
/// 根据视图数据创建视图
+ (instancetype)qh_tableView:(UITableView *)tableView cellWithData:(id)data {
    DLog();
    
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
        
        // 初始化自动布局
        [self autoLayoutWithConstraints];
        
        // 其他初始化
        
    }
    
    return self;
}

/// 布局子视图 -> frame计算
- (void)layoutSubviews {
    [super layoutSubviews];
    DLog();
    
}

/// 自动布局子视图 -> 约束(mas_make只有一次,自动约束，不要计算)
- (void)autoLayoutWithConstraints {
    DLog();
    
}

#pragma mark - Delegate

#pragma mark - TargetMethod

#pragma mark - PrivateMethod
/// 根据视图数据更新视图
- (void)updateCellWithData:(id)data {
    DLog();
    
}

#pragma mark - Setter
- (void)setQh_data:(id)qh_data {
    
    _qh_data = qh_data;
    
    // 更新cell的数据
    [self updateCellWithData:qh_data];
}

#pragma mark - Getter

@end


#pragma mark -
#pragma mark - <#comment#>
#pragma mark -

@interface <prefix><name>ViewHeaderView ()

@end

@implementation <prefix><name>ViewHeaderView

#pragma mark - Lifecycle
/// 根据视图数据创建视图
+ (instancetype)qh_tableView:(UITableView *)tableView headerViewWithData:(id)data {
    DLog();
    
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

/// 布局子视图 -> frame计算
- (void)layoutSubviews {
    [super layoutSubviews];
    DLog();
    
}

/// 自动布局子视图 -> 约束(mas_make只有一次,自动约束，不要计算)
- (void)autoLayoutWithConstraints {
    DLog();
    
}

#pragma mark - Delegate

#pragma mark - TargetMethod

#pragma mark - PrivateMethod
/// 根据视图数据更新视图
- (void)updateHeaderViewWithData:(id)data {
    DLog();
    
}

#pragma mark - Setter
- (void)setQh_data:(id)qh_data {
    
    _qh_data = qh_data;
    
    // 更新头视图数据
    [self updateHeaderViewWithData:qh_data];
}

#pragma mark - Getter

@end


#pragma mark -
#pragma mark - <#comment#>
#pragma mark -

@interface <prefix><name>ViewFooterView ()

@end

@implementation <prefix><name>ViewFooterView

#pragma mark - Lifecycle
/// 根据视图数据创建视图
+ (instancetype)qh_tableView:(UITableView *)tableView footerViewWithData:(id)data {
    DLog();
    
    static NSString *identifier = @"<prefix><name>ViewFooterView";
    <prefix><name>ViewFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!footerView) {
        
        footerView = [[<prefix><name>ViewFooterView alloc] initWithReuseIdentifier:identifier];
    }
    
    // 根据视图数据更新视图
    [footerView updateFooterViewWithData:data];
    
    return footerView;
}

/// 初始化列表组自定义尾视图
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    DLog();
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        // 初始化自动布局
        [self autoLayoutWithConstraints];
        
        // 其他初始化
        
    }
    
    return self;
}

/// 布局自定义子视图
- (void)layoutSubviews {
    DLog();
    
}

#pragma mark - Delegate

#pragma mark - TargetMethod

#pragma mark - PrivateMethod
/// 根据视图数据更新视图
- (void)updateFooterViewWithData:(id)data {
    DLog();
    
}

#pragma mark - Setter
- (void)setQh_data:(id)qh_data {
    
    _qh_data = qh_data;
    
    // 更新根视图数据
    [self updateFooterViewWithData:qh_data];
}

#pragma mark - Getter

@end
