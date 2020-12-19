//
//  SeedFileCreator.m
//  SeedCoder
//
//  Created by Hao on 2020/12/18.
//

#import "SeedFileCreator.h"


/// 资源包文件名
static NSString * const kBundleFileName = @"templates.bundle";

#pragma mark - collectionview

/// CollectionReusableFooterViewTemplate
static NSString * const kCollectionReusableFooterViewTemplate = @"Objective-C/CollectionReusableFooterViewTemplate";
/// CollectionReusableHeaderViewTemplate
static NSString * const kCollectionReusableHeaderViewTemplate = @"Objective-C/CollectionReusableHeaderViewTemplate";
/// CollectionViewCellTemplate
static NSString * const kCollectionViewCellTemplate = @"Objective-C/CollectionViewCellTemplate";

#pragma mark - controller

//MARK: collectionview

/// CollectionViewControllerTemplate
static NSString * const kCollectionViewControllerTemplate = @"Objective-C/CollectionViewControllerTemplate";
/// CollectionViewTemplate
static NSString * const kCollectionViewTemplate = @"Objective-C/CollectionViewTemplate";

//MARK: tableview

/// TableViewControllerTemplate
static NSString * const kTableViewControllerTemplate = @"Objective-C/TableViewControllerTemplate";
/// TableViewTemplate
static NSString * const kTableViewTemplate = @"Objective-C/TableViewTemplate";

#pragma mark - model

/// ModelTemplate
static NSString * const kModelTemplate = @"Objective-C/ModelTemplate";

#pragma mark - tableview

/// TableViewCellTemplate
static NSString * const kTableViewCellTemplate = @"Objective-C/TableViewCellTemplate";
/// TableViewFooterViewTemplate
static NSString * const kTableViewFooterViewTemplate = @"Objective-C/TableViewFooterViewTemplate";
/// TableViewHeaderViewTemplate
static NSString * const kTableViewHeaderViewTemplate = @"Objective-C/TableViewHeaderViewTemplate";

#pragma mark - view

/// ViewTemplate
static NSString * const kViewTemplate = @"Objective-C/ViewTemplate";


@interface SeedFileCreator ()

/// 模版-分隔符
@property (nonatomic, strong) NSArray *separators;
/// 模板-标记符(旧值)
@property (nonatomic, strong) NSMutableDictionary *marker;
/// 模版-替换字符(新值)
@property (nonatomic, strong) NSMutableDictionary *substitute;
/// 模板资源包文件
@property (nonatomic, strong) NSBundle *templateBundle;

@end

@implementation SeedFileCreator

+ (instancetype)creator {
    
    return [[SeedFileCreator alloc] init];
}

/// 根据模版和类型生成代码文件
/// @param type 模版类型
/// @param input 输入的内容
/// @param prefix 前缀
/// @param path 文件保存路径
- (BOOL)createFile:(SeedFileType)type with:(NSString *)input prefix:(NSString *)prefix saveToPath:(NSString *)path {
    
    // 文件类型后缀
    NSString *suffix;
    // 对应模版
    NSString *template;
    
    // 文件类型
    switch (type) {
            
        case SeedFileTypeView: {
            /// 自定义视图文件
            
            suffix = @"View";
            template = kViewTemplate;
        }
            break;
        case SeedFileTypeModel: {
            /// 数据模型文件
            
            suffix = @"Model";
            template = kModelTemplate;
        }
            break;
        case SeedFileTypeTableViewController: {
            /// 列表视图控制器文件(带有自定义根视图文件)
            
            suffix = @"Controller";
            template = kTableViewControllerTemplate;
        }
            break;
        case SeedFileTypeCollectionViewController: {
            /// 集合视图控制器文件(带有自定义根视图文件)
            
            suffix = @"Controller";
            template = kCollectionViewControllerTemplate;
        }
            break;
            
        case SeedFileTypeTableViewCell: {
            /// 列表视图行视图
            
            suffix = @"TableViewCell";
            template = kTableViewCellTemplate;
        }
            break;
        case SeedFileTypeTableViewHeaderView: {
            /// 列表视图头视图
            
            suffix = @"TableViewHeaderView";
            template = kTableViewHeaderViewTemplate;
        }
            break;
        case SeedFileTypeTableViewFooterView: {
            /// 列表视图尾视图
            
            suffix = @"TableViewFooterView";
            template = kTableViewFooterViewTemplate;
        }
            break;
        case SeedFileTypeCollectionViewCell: {
            /// 集合视图单元格视图
            
            suffix = @"CollectionViewCell";
            template = kCollectionViewCellTemplate;
        }
            break;
        case SeedFileTypeCollectionReusableHeaderView: {
            /// 集合视图头视图
            
            suffix = @"CollectionReusableHeaderView";
            template = kCollectionReusableHeaderViewTemplate;
        }
            break;
        case SeedFileTypeCollectionReusableFooterView: {
            /// 集合视图尾视图
            
            suffix = @"CollectionReusableFooterView";
            template = kCollectionReusableFooterViewTemplate;
        }
            break;
    }
    
    if (!self.templateBundle) {
        
        return NO;
    }
    
    // 解析输入的内容
    NSArray<NSString *> *names = [self parse:input by:self.separators];
    if (!names) {
        
        return NO;
    }
    
    // 文件扩展名
    NSArray *extensions = @[@".h",@".m"];
    
    for (NSString *name in names) {
        
        // 准备替换字符串字典
        [self.substitute setValue:prefix forKey:@"c"];
        [self.substitute setValue:name forKey:@"d"];
        
        if (type == SeedFileTypeTableViewController || type == SeedFileTypeCollectionViewController) {
            //MARK: 控制器模版
            
            // Controller文件夹路径
            NSString *controllerPath = [NSString stringWithFormat:@"%@/Controller",path];
            // View文件夹路径
            NSString *viewPath = [NSString stringWithFormat:@"%@/View",path];
            
            for (NSString *extension in extensions) {
                
                suffix = @"Controller";
                if (type == SeedFileTypeCollectionViewController) {
                    template = kCollectionViewControllerTemplate;
                } else if (type == SeedFileTypeTableViewController) {
                    template = kTableViewControllerTemplate;
                }
                // 模板文件路径
                NSString *templatePath = [self.templateBundle pathForResource:[NSString stringWithFormat:@"%@%@",template,extension] ofType:nil];
                // 模版文件内容
                NSMutableString *templateContent = [self readTemplateContentsWith:templatePath];
                // 替换指定字符串
                templateContent = [self replace:templateContent with:self.substitute where:self.marker];
                // 创建文件
                NSData *data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
                // 文件名
                NSString *fileName = [NSString stringWithFormat:@"%@%@%@%@",prefix,name,suffix,extension];
                
                if (![self createFileAtPath:controllerPath withName:fileName contents:data]) {
                    
                    NSLog(@"Create file failed: %@",fileName);
                    return NO;
                }
                
                suffix = @"View";
                // 模板文件路径
                if (type == SeedFileTypeTableViewController) {
                    template = kTableViewTemplate;
                } else if (type == SeedFileTypeCollectionViewController) {
                    template = kCollectionViewTemplate;
                }
                
                templatePath = [self.templateBundle pathForResource:[NSString stringWithFormat:@"%@%@",template,extension] ofType:nil];
                // 模版文件内容
                templateContent = [self readTemplateContentsWith:templatePath];
                // 替换指定字符串
                templateContent = [self replace:templateContent with:self.substitute where:self.marker];
                // 创建文件
                data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
                // 文件名
                fileName = [NSString stringWithFormat:@"%@%@%@%@",prefix,name,suffix,extension];
                
                if (![self createFileAtPath:viewPath withName:fileName contents:data]) {
                    
                    NSLog(@"Create file failed: %@",fileName);
                    return NO;
                }
            }
        } else {
            //MARK: 其他模版
            
            for (NSString *extension in extensions) {
                
                // 模板文件路径
                NSString *templatePath = [self.templateBundle pathForResource:[NSString stringWithFormat:@"%@%@",template,extension] ofType:nil];
                // 模版文件内容
                NSMutableString *templateContent = [self readTemplateContentsWith:templatePath];
                // 替换指定字符串
                templateContent = [self replace:templateContent with:self.substitute where:self.marker];
                // 创建文件
                NSData *data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
                // 文件名
                NSString *fileName = [NSString stringWithFormat:@"%@%@%@%@",prefix,name,suffix,extension];
                
                if (![self createFileAtPath:path withName:fileName contents:data]) {
                    
                    NSLog(@"Create file failed: %@",fileName);
                    return NO;
                }
            }
        }
    }
    
    return YES;
}

#pragma mark - private method

/// 根据分隔符解析输入的内容
/// @param input 输入的内容
/// @param separator 分割符
- (NSArray<NSString *> *)parse:(NSString *)input by:(NSArray *)separator {
    
    NSMutableArray<NSString *> *result = [NSMutableArray array];
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:[separator componentsJoinedByString:@""]];
    
    NSArray<NSString *> *names = [input componentsSeparatedByCharactersInSet:set];
    [names enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj && obj.length > 0) {
            
            [result addObject:obj];
        }
    }];
    
    return [result copy];
}

/// 根据路径、文件名、文件内容创建文件夹和文件
/// @param path 文件路径
/// @param name 文件名
/// @param data 文件内容
- (BOOL)createFileAtPath:(NSString *)path withName:(NSString *)name contents:(NSData *)data {
    
    NSFileManager *manager = NSFileManager.defaultManager;
    if (![manager fileExistsAtPath:path]) {
        
        NSError *error;
        // 创建文件夹
        if (![manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error]) {
            NSLog(@"%@",error);
            return NO;
        }
    }
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",path, name];
    
    return [[NSFileManager defaultManager] createFileAtPath:filePath contents:data attributes:nil];
}

/// 替换文本内容中的指定字符串
/// @param previous 文本内容
/// @param substitute 新字符串
/// @param marker 需要替换的字符串
- (NSMutableString *)replace:(NSMutableString *)previous with:(NSDictionary *)substitute where:(NSDictionary *)marker {
    
    NSMutableString *result = previous;
    NSArray *keys = marker.allKeys;
    for (id key in keys) {
        
        NSString *oldValue = [marker valueForKey:key];
        NSString *newValue = [substitute valueForKey:key];
        
        if (oldValue && newValue) {
            
            result = (NSMutableString *)[result stringByReplacingOccurrencesOfString:oldValue withString:newValue];
        } else {
            
            NSLog(@"The new value is not exist! and the old value is %@.", oldValue);
        }
    }
    
    return result;
}

/// 根据资源包模版文件的路径返回模版文件的内容
/// @param path 模版文件的路径
- (NSMutableString *)readTemplateContentsWith:(NSString *)path {
    
    NSError *error;
    NSMutableString *result = [NSMutableString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        
        NSLog(@"%@",error);
    }
    
    return result;
}

#pragma mark - getter

- (NSMutableDictionary *)marker {
    
    if (!_marker) {
        
        _marker = [NSMutableDictionary dictionary];
        [_marker setValue:@"<year>" forKey:@"a"];
        [_marker setValue:@"<date>" forKey:@"b"];
        [_marker setValue:@"<prefix>" forKey:@"c"];
        [_marker setValue:@"<name>" forKey:@"d"];
    }
    
    return _marker;
}

- (NSMutableDictionary *)substitute {
    
    if (!_substitute) {
        
        // 日期
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd";
        NSString *date = [formatter stringFromDate:[NSDate date]];
        NSString *year = [date substringToIndex:4];
        
        _substitute = [NSMutableDictionary dictionary];
        [_substitute setValue:year forKey:@"a"];
        [_substitute setValue:date forKey:@"b"];
        
        [_substitute setValue:@"<prefix>" forKey:@"c"];
        [_substitute setValue:@"<name>" forKey:@"d"];
    }
    
    return _substitute;
}

- (NSArray *)separators {
    
    if (!_separators) {
        
        _separators = @[@"#",@"/",@"?",@"\n",@"$",@" "];
    }
    
    return _separators;
}

- (NSBundle *)templateBundle {
    
    if (!_templateBundle) {
        
        _templateBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:kBundleFileName ofType:nil]];
    }
    
    return _templateBundle;
}

@end
