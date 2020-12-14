//
//  <prefix><name>View.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "<prefix><name>View.h"


@interface <prefix><name>View ()

@end

@implementation <prefix><name>View

#pragma mark --------------------------- <lifecycle> ---------------------------

/// 初始化控制器自定义根视图
/// @param frame 自定义根视图的frame
- (instancetype)initWithFrame:(CGRect)frame {
    NSLog(@"");
    
    if (self = [super initWithFrame:frame]) {
        
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
    
    // 列表视图
    [self addSubview:self.s_tableView];
    [self.s_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self).with.inset(self.s_statusBarHeight + self.s_navigationBarHeight);
        make.left.and.right.and.bottom.mas_equalTo(self);
    }];
}

#pragma mark --------------------- <delegate & datasource> ---------------------

#pragma mark ---------------------------- <method> ----------------------------

#pragma mark - target method

#pragma mark - private method

#pragma mark ------------------------ <setter & getter> ------------------------

#pragma mark - setter

#pragma mark - getter

- (SeedBaseTableView *)s_tableView {
    
    if (!_s_tableView) {
        
        _s_tableView = [SeedBaseTableView s_tableViewWith:OxFFFFFF];
    }
    
    return _s_tableView;
}

@end
