//
//  GQHPropertyCreator.h
//  Coder
//
//  Created by Mac on 2019/2/1.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface GQHPropertyCreator : NSObject

/**
 生成代码文件的单例
 
 @return 单例
 */
+ (instancetype)creator;

/**
 根据JSON字符串生成属性

 @param JSONString JSON 字符串
 @return 属性列表
 */
- (NSString *)createCodeWith:(NSString *)JSONString;

@end

NS_ASSUME_NONNULL_END
