//
//  SeedCreator.h
//  SeedCoder
//
//  Created by Hao on 2020/12/17.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface SeedCreator : NSObject

+ (instancetype)creator;

/// 生成代码片段
/// @param content 输入的指定内容
- (NSString *)createCodeSnippetWith:(NSString *)content;

/// 根据模版生成代码文件
/// @param content 指定的内容
/// @param prefix 前缀
/// @param path 代码文件保存路径
- (BOOL)createCodeFilesWith:(NSString *)content prefix:(NSString *)prefix saveToPath:(NSString *)path;

/// 根据模版和类型生成代码文件
/// @param type 模版类型
/// @param classesName 类名
/// @param prefix 文件前缀
/// @param path 文件保存路径
//- (BOOL)createFiles:(GQHTemplateFileType)type with:(NSString *)classesName prefix:(NSString *)prefix saveToPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
