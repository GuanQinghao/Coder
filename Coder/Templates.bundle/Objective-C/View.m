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

/// 初始化自定义根视图
- (instancetype)initWithFrame:(CGRect)frame {
    DLog();
    
    if (self = [super initWithFrame:frame]) {
        
        [self loadLocalData];
        [self layoutUserInterface];
    }
    
    return self;
}

#pragma mark --Data
/// 加载本地数据
- (void)loadLocalData {
    DLog();
    
}

#pragma mark --View
/// 布局自定义用户视图
- (void)layoutUserInterface {
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

/// 根据data创建cell
+ (instancetype)qh_tableView:(UITableView *)tableView cellWithData:(NSDictionary *)data {
    
    static NSString *identifier = @"<prefix><name>ViewCell";
    <prefix><name>ViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[<prefix><name>ViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

/// 初始化列表自定义行视图
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    DLog();
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self loadLocalData];
        [self layoutUserInterface];
    }
    
    return self;
}

#pragma mark --Data
/// 加载本地数据
- (void)loadLocalData {
    DLog();
    
}

#pragma mark --View
/// 布局自定义用户视图
- (void)layoutUserInterface {
    DLog();
    
}

#pragma mark --Delegate

#pragma mark --TargetMethod

#pragma mark --PrivateMethod

#pragma mark --Setter

#pragma mark --Getter

@end
