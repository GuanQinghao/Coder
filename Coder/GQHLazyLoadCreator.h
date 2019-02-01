//
//  GQHLazyLoadCreator.h
//  Coder
//
//  Created by Mac on 2019/2/1.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GQHLazyLoadCreator : NSObject

/// 单例模式代码示例 -> 不支持对象copy
+ (instancetype)creator;

/// 根据代码块生成懒加载代码
- (NSString *)createCodeWith:(NSString *)propertiesName;

@end

NS_ASSUME_NONNULL_END
