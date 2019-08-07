//
//  GQHFileCreator.h
//  Coder
//
//  Created by Mac on 2019/2/1.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface GQHFileCreator : NSObject

/**
 生成代码文件的单例

 @return 单例
 */
+ (instancetype)creator;

/**
 根据模版生成Controller和View文件

 @param classesName 类名字符串(多个类名,分隔符隔开)
 @param prefix 文件前缀
 @param path 文件保存路径
 @return 是否成功生成
 */
- (BOOL)createControllerFilesWith:(NSString *)classesName prefix:(NSString *)prefix saveToPath:(NSString *)path;

/**
 根据模版生成Model文件

 @param classesName 类名字符串(多个类名,分隔符隔开)
 @param prefix 文件前缀
 @param path 文件保存路径
 @return 是否成功生成
 */
- (BOOL)createModelFilesWith:(NSString *)classesName prefix:(NSString *)prefix saveToPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
