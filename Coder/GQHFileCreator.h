//
//  GQHFileCreator.h
//  Coder
//
//  Created by Mac on 2019/2/1.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark -
#pragma mark - <#comment#>
#pragma mark -

NS_ASSUME_NONNULL_BEGIN

@interface GQHFileCreator : NSObject

/// 单例
+ (instancetype)creator;
/// 根据模版生成Controller和View文件
- (BOOL)createControllerFilesWith:(NSString *)classesName prefix:(NSString *)prefix saveToPath:(NSString *)path;
/// 根据模版生成Model文件
- (BOOL)createModelFilesWith:(NSString *)classesName prefix:(NSString *)prefix saveToPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
