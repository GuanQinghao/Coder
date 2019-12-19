//
//  <prefix><name>View.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark -

NS_ASSUME_NONNULL_BEGIN

/**
 <#Description#>
 */
@interface <prefix><name>View : UIView

/**
 视图代理
 */
@property (nonatomic, weak) id qh_delegate;

/**
 视图数据
 */
@property (nonatomic, strong) id qh_data;

@end

NS_ASSUME_NONNULL_END
