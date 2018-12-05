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
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self loadLocalData];
        [self loadUserInterface];
    }
    
    return self;
}

#pragma mark --Data
- (void)loadLocalData {
    DLog();
    
}

#pragma mark --View
- (void)loadUserInterface {
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
        
        _qh_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
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
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self loadLocalData];
        [self loadUserInterface];
    }
    
    return self;
}

#pragma mark --Data
- (void)loadLocalData {
    DLog();
    
}

#pragma mark --View
- (void)loadUserInterface {
    DLog();
    
}

#pragma mark --Delegate

#pragma mark --TargetMethod

#pragma mark --PrivateMethod

#pragma mark --Setter

#pragma mark --Getter

@end
