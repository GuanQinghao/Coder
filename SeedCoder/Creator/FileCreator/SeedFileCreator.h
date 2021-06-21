//
//  SeedFileCreator.h
//  SeedCoder
//
//  Created by Hao on 2020/12/18.
//

#import "SeedCreator.h"


/// 文件类型
typedef NS_ENUM(NSUInteger, SeedFileType) {
    
    /// 自定义视图文件
    SeedFileTypeView,
    /// 数据模型文件
    SeedFileTypeModel,
    /// 列表视图控制器文件
    SeedFileTypeTableViewController,
    /// 集合视图控制器文件
    SeedFileTypeCollectionViewController,
    
    /// 列表视图行视图
    SeedFileTypeTableViewCell,
    /// 列表视图头视图
    SeedFileTypeTableViewHeaderView,
    /// 列表视图尾视图
    SeedFileTypeTableViewFooterView,
    
    /// 集合视图单元格视图
    SeedFileTypeCollectionViewCell,
    /// 集合视图头视图
    SeedFileTypeCollectionReusableHeaderView,
    /// 集合视图尾视图
    SeedFileTypeCollectionReusableFooterView
};


NS_ASSUME_NONNULL_BEGIN

@interface SeedFileCreator : SeedCreator

/// 根据模版和类型生成代码文件
/// @param type 模版类型
/// @param name 类名称
/// @param prefix 前缀
/// @param path 文件保存路径
- (BOOL)createFile:(SeedFileType)type with:(NSString *)name prefix:(NSString *)prefix saveToPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
