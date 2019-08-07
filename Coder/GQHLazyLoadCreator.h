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

/**
 生成代码文件的单例
 
 @return 单例
 */
+ (instancetype)creator;

/**
 根据代码块生成懒加载代码

 @param propertiesName 属性列表
 @return 懒加载代码
 */
- (NSString *)createCodeWith:(NSString *)propertiesName;

@end

NS_ASSUME_NONNULL_END
