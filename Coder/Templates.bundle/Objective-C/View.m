//
//  <prefix><name>View.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>View.h"
#import "GQHHeader.h"


#pragma mark -

@interface <prefix><name>View ()

@end

@implementation <prefix><name>View

#pragma mark - Lifecycle
/**
 初始化控制器自定义根视图
 
 @param frame 自定义根视图的frame
 @return 自定义根视图
 */
- (instancetype)initWithFrame:(CGRect)frame {
    NSLog(@"");
    
    if (self = [super initWithFrame:frame]) {
        
        // 初始化自动布局
        [self autoLayoutWithConstraints];
        
        // 其他初始化
        
    }
    
    return self;
}

/**
 布局子视图 -> frame计算
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"");
    
}

/**
 自动布局子视图 -> 约束(mas_make只有一次,自动约束，不要计算)
 */
- (void)autoLayoutWithConstraints {
    NSLog(@"");
    
    // 列表视图
    [self addSubview:self.qh_tableView];
    [self.qh_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self).with.inset(self.qh_statusBarHeight + self.qh_navigationBarHeight);
        make.left.and.right.and.bottom.mas_equalTo(self);
    }];
}

#pragma mark - Delegate

#pragma mark - TargetMethod

#pragma mark - PrivateMethod
/**
 根据视图数据更新视图
 
 @param data 视图数据
 */
- (void)updateRootViewWithData:(id)data {
    NSLog(@"");
    
}

#pragma mark - Setter
- (void)setQh_data:(id)qh_data {
    
    _qh_data = qh_data;
    
    // 根据视图数据更新视图
    [self updateRootViewWithData:qh_data];
}

#pragma mark - Getter
- (UITableView *)qh_tableView {
    
    if (!_qh_tableView) {
        
        _qh_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _qh_tableView.backgroundColor = [UIColor whiteColor];
        _qh_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _qh_tableView.showsVerticalScrollIndicator = NO;
        
        // 列表自动计算行高
        _qh_tableView.estimatedRowHeight = 200.0f;
        _qh_tableView.rowHeight = UITableViewAutomaticDimension;
        
        if (@available(iOS 11.0, *)) {
            
            _qh_tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    
    return _qh_tableView;
}

@end


#pragma mark -

@interface <prefix><name>TableViewCell ()

@end

@implementation <prefix><name>TableViewCell

#pragma mark - Lifecycle
/**
 根据视图数据创建列表视图的行视图
 
 @param tableView 列表视图
 @param data 列表行视图数据
 @return 自定义行视图
 */
+ (instancetype)qh_tableView:(UITableView *)tableView cellWithData:(id)data {
    NSLog(@"");
    
    static NSString *identifier = @"<prefix><name>TableViewCell";
    <prefix><name>TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[<prefix><name>TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // 根据视图数据更新视图
    [cell updateCellWithData:data];
    
    return cell;
}

/**
 初始化列表自定义行视图
 
 @param style 列表自定义行视图样式
 @param reuseIdentifier 列表行视图复用标识
 @return 列表自定义行视图
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    NSLog(@"");
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 初始化自动布局
        [self autoLayoutWithConstraints];
        
        // 其他初始化
        
    }
    
    return self;
}

/**
 布局子视图 -> frame计算
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"");
    
}

/**
 自动布局子视图 -> 约束(mas_make只有一次,自动约束，不要计算)
 */
- (void)autoLayoutWithConstraints {
    NSLog(@"");
    
}

#pragma mark - Delegate

#pragma mark - TargetMethod

#pragma mark - PrivateMethod
/**
 根据视图数据更新视图
 
 @param data 列表行视图数据
 */
- (void)updateCellWithData:(id)data {
    NSLog(@"");
    
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

@interface <prefix><name>TableViewHeaderView ()

@end

@implementation <prefix><name>TableViewHeaderView

#pragma mark - Lifecycle
/**
 根据视图数据创建列表视图的头视图
 
 @param tableView 列表视图
 @param data 列表头视图数据
 @return 自定义头视图
 */
+ (instancetype)qh_tableView:(UITableView *)tableView headerViewWithData:(id)data {
    NSLog(@"");
    
    static NSString *identifier = @"<prefix><name>TableViewHeaderView";
    <prefix><name>TableViewHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!headerView) {
        
        headerView = [[<prefix><name>TableViewHeaderView alloc] initWithReuseIdentifier:identifier];
    }
    
    // 根据视图数据更新视图
    [headerView updateHeaderViewWithData:data];
    
    return headerView;
}

/**
 初始化列表自定义头视图
 
 @param reuseIdentifier 列表头视图复用标识
 @return 列表自定义头视图
 */
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    NSLog(@"");
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        // 初始化自动布局
        [self autoLayoutWithConstraints];
        
        // 其他初始化
        
    }
    
    return self;
}

/**
 布局子视图 -> frame计算
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"");
    
}

/**
 自动布局子视图 -> 约束(mas_make只有一次,自动约束，不要计算)
 */
- (void)autoLayoutWithConstraints {
    NSLog(@"");
    
}

#pragma mark - Delegate

#pragma mark - TargetMethod

#pragma mark - PrivateMethod
/**
 根据视图数据更新视图
 
 @param data 列表头视图数据
 */
- (void)updateHeaderViewWithData:(id)data {
    NSLog(@"");
    
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

@interface <prefix><name>TableViewFooterView ()

@end

@implementation <prefix><name>TableViewFooterView

#pragma mark - Lifecycle
/**
 根据视图数据创建列表视图的尾视图
 
 @param tableView 列表视图
 @param data 列表尾视图数据
 @return 自定义尾视图
 */
+ (instancetype)qh_tableView:(UITableView *)tableView footerViewWithData:(id)data {
    NSLog(@"");
    
    static NSString *identifier = @"<prefix><name>TableViewFooterView";
    <prefix><name>TableViewFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!footerView) {
        
        footerView = [[<prefix><name>TableViewFooterView alloc] initWithReuseIdentifier:identifier];
    }
    
    // 根据视图数据更新视图
    [footerView updateFooterViewWithData:data];
    
    return footerView;
}

/**
 初始化列表自定义尾视图
 
 @param reuseIdentifier 列表尾视图复用标识
 @return 列表自定义尾视图
 */
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    NSLog(@"");
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        // 初始化自动布局
        [self autoLayoutWithConstraints];
        
        // 其他初始化
        
    }
    
    return self;
}

/**
 布局子视图 -> frame计算
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"");
    
}

/**
 自动布局子视图 -> 约束(mas_make只有一次,自动约束，不要计算)
 */
- (void)autoLayoutWithConstraints {
    NSLog(@"");
    
}

#pragma mark - Delegate

#pragma mark - TargetMethod

#pragma mark - PrivateMethod
/**
 根据视图数据更新视图
 
 @param data 列表尾视图数据
 */
- (void)updateFooterViewWithData:(id)data {
    NSLog(@"");
    
}

#pragma mark - Setter
- (void)setQh_data:(id)qh_data {
    
    _qh_data = qh_data;
    
    // 更新根视图数据
    [self updateFooterViewWithData:qh_data];
}

#pragma mark - Getter

@end
