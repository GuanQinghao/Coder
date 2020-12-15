//
//  SeedFileCreator.h
//  SeedCoder
//
//  Created by Mac on 2019/2/1.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, GQHTemplateFileType) {
    
    GQHTemplateFileTypeView,
    GQHTemplateFileTypeModel,
    
    GQHTemplateFileTypeTableViewCell,
    GQHTemplateFileTypeTableViewHeaderView,
    GQHTemplateFileTypeTableViewFooterView,
    
    GQHTemplateFileTypeCollectionViewCell,
    GQHTemplateFileTypeCollectionViewHeaderView,
    GQHTemplateFileTypeCollectionViewFooterView,
};


NS_ASSUME_NONNULL_BEGIN

@interface SeedFileCreator : NSObject

/// 代码生成单例
+ (instancetype)creator;

/// 根据模版生成Controller文件和View文件
/// @param classesName 类名字符串(多个类名,分隔符隔开)
/// @param prefix 文件前缀
/// @param path 文件保存路径
- (BOOL)createControllerFilesWith:(NSString *)classesName prefix:(NSString *)prefix saveToPath:(NSString *)path;

/// 根据模版和类型生成代码文件
/// @param type 模版类型
/// @param classesName 类名
/// @param prefix 文件前缀
/// @param path 文件保存路径
- (BOOL)createFiles:(GQHTemplateFileType)type with:(NSString *)classesName prefix:(NSString *)prefix saveToPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
