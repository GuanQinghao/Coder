//
//  SeedFileCreator.m
//  SeedCoder
//
//  Created by Mac on 2019/2/1.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import "SeedFileCreator.h"


/// 资源包文件名
static NSString * const kBundleFileName = @"Templates.bundle";

/// 缺省 Controller.h 文件名
static NSString * const kDefaultControllerTemplateH = @"Objective-C/DefaultControllerTemplate.h";
/// 缺省 Controller.m 文件名
static NSString * const kDefaultControllerTemplateM = @"Objective-C/DefaultControllerTemplate.m";

/// 缺省 View.h 文件
static NSString * const kDefaultViewTemplateH = @"Objective-C/DefaultViewTemplate.h";
/// 缺省 View.m 文件
static NSString * const kDefaultViewTemplateM = @"Objective-C/DefaultViewTemplate.m";

/// 简化 Controller.h 文件名
static NSString * const kLiteControllerTemplateH = @"Objective-C/LiteControllerTemplate.h";
/// 简化 Controller.m 文件名
static NSString * const kLiteControllerTemplateM = @"Objective-C/LiteControllerTemplate.m";

/// 简化 View.h 文件
static NSString * const kLiteViewTemplateH = @"Objective-C/LiteViewTemplate.h";
/// 简化 View.m 文件
static NSString * const kLiteViewTemplateM = @"Objective-C/LiteViewTemplate.m";

/// 缺省 Model 文件
static NSString * const kDefaultModel = @"Objective-C/DefaultModel";
/// 自定义 View 文件
static NSString * const kCustomizedViewTemplate = @"Objective-C/CustomizedViewTemplate";

/// 自定义 TableViewCell 文件
static NSString * const kTableViewCellTemplate = @"Objective-C/TableViewCellTemplate";
/// 自定义 TableViewHeaderView 文件
static NSString * const kTableViewHeaderViewTemplate = @"Objective-C/TableViewHeaderViewTemplate";
/// 自定义 TableViewFooterView 文件
static NSString * const kTableViewFooterViewTemplate = @"Objective-C/TableViewFooterViewTemplate";

/// 自定义 CollectionViewCell 文件
static NSString * const kCollectionViewCellTemplate = @"Objective-C/CollectionViewCellTemplate";
/// 自定义 CollectionReusableHeaderView 文件
static NSString * const kCollectionReusableHeaderViewTemplate = @"Objective-C/CollectionReusableHeaderViewTemplate";
/// 自定义 CollectionReusableFooterView 文件
static NSString * const kCollectionReusableFooterViewTemplate = @"Objective-C/CollectionReusableFooterViewTemplate";


#pragma mark -

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

/// 单例
static SeedFileCreator *singleton = nil;

/// 单例
+ (instancetype)creator {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        singleton = [[super allocWithZone:NULL] init];
    });
    
    return singleton;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    return  [self creator];
}

/// 根据模版生成Controller和View文件
/// @param classesName 类名
/// @param prefix 文件前缀
/// @param path 文件保存路径
- (BOOL)createControllerFilesWith:(NSString *)classesName prefix:(NSString *)prefix saveToPath:(NSString *)path {
    
    if (!self.templateBundle) {
        
        return NO;
    }
    
    // 获取类名数组
    NSArray *classNames = [self fetchClassNamesWithString:classesName bySeparator:self.separators];
    if (!classNames) {
        
        return NO;
    }
    
    // Controller文件夹路径
    NSString *controllerPath = [NSString stringWithFormat:@"%@/Controller",path];
    // View文件夹路径
    NSString *viewPath = [NSString stringWithFormat:@"%@/View",path];
    
    for (NSString *name in classNames) {
        
        // 准备替换字符串字典
        [self.substitute setValue:prefix forKey:@"c"];
        [self.substitute setValue:name forKey:@"d"];
        
        // 模板文件路径
        NSString *templatePath = [self.templateBundle pathForResource:kLiteControllerTemplateH ofType:nil];
        // 模版文件内容
        NSMutableString *templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        NSData *data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        NSString *fileName = [NSString stringWithFormat:@"%@%@Controller.h",prefix,name];
        
        if (![self createFileAtPath:controllerPath withName:fileName contents:data]) {
            
            return NO;
        }
        
        // 模板文件路径
        templatePath = [self.templateBundle pathForResource:kLiteControllerTemplateM ofType:nil];
        // 模版文件内容
        templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        fileName = [NSString stringWithFormat:@"%@%@Controller.m",prefix,name];
        
        if (![self createFileAtPath:controllerPath withName:fileName contents:data]) {
            
            return NO;
        }
        
        // 模板文件路径
        templatePath = [self.templateBundle pathForResource:kLiteViewTemplateH ofType:nil];
        // 模版文件内容
        templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        fileName = [NSString stringWithFormat:@"%@%@View.h",prefix,name];
        
        if (![self createFileAtPath:viewPath withName:fileName contents:data]) {
            
            return NO;
        }
        
        // 模板文件路径
        templatePath = [self.templateBundle pathForResource:kLiteViewTemplateM ofType:nil];
        // 模版文件内容
        templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        fileName = [NSString stringWithFormat:@"%@%@View.m",prefix,name];
        
        if (![self createFileAtPath:viewPath withName:fileName contents:data]) {
            
            return NO;
        }
    }
    
    return YES;
}

/// 根据模版和类型生成代码文件
/// @param type 模版类型
/// @param classesName 类名
/// @param prefix 文件前缀
/// @param path 文件保存路径
- (BOOL)createFiles:(GQHTemplateFileType)type with:(NSString *)classesName prefix:(NSString *)prefix saveToPath:(NSString *)path {
    
    NSString *suffix;
    NSString *template;
    
    // 文件类型
    switch (type) {
            
        case GQHTemplateFileTypeView: {
            
            suffix = @"View";
            template = kCustomizedViewTemplate;
        }
            break;
        case GQHTemplateFileTypeModel: {
            
            suffix = @"Model";
            template = kDefaultModel;
        }
            break;
        case GQHTemplateFileTypeTableViewCell: {
            
            suffix = @"TableViewCell";
            template = kTableViewCellTemplate;
        }
            break;
        case GQHTemplateFileTypeTableViewHeaderView: {
            
            suffix = @"TableViewHeaderView";
            template = kTableViewHeaderViewTemplate;
        }
            break;
        case GQHTemplateFileTypeTableViewFooterView: {
            
            suffix = @"TableViewFooterView";
            template = kTableViewFooterViewTemplate;
        }
            break;
        case GQHTemplateFileTypeCollectionViewCell: {
            
            suffix = @"CollectionViewCell";
            template = kCollectionViewCellTemplate;
        }
            break;
        case GQHTemplateFileTypeCollectionViewHeaderView: {
            
            suffix = @"CollectionReusableHeaderView";
            template = kCollectionReusableHeaderViewTemplate;
        }
            break;
        case GQHTemplateFileTypeCollectionViewFooterView: {
            
            suffix = @"CollectionReusableFooterView";
            template = kCollectionReusableFooterViewTemplate;
        }
            break;
    }
    
    if (!self.templateBundle) {
        
        return NO;
    }
    
    // 获取类名数组
    NSArray *classNames = [self fetchClassNamesWithString:classesName bySeparator:self.separators];
    if (!classNames) {
        
        return NO;
    }
    
    for (NSString *name in classNames) {
        
        // 准备替换字符串字典
        [self.substitute setValue:prefix forKey:@"c"];
        [self.substitute setValue:name forKey:@"d"];
        
        // 模板文件路径
        NSString *templatePath = [self.templateBundle pathForResource:[NSString stringWithFormat:@"%@.h",template] ofType:nil];
        // 模版文件内容
        NSMutableString *templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        NSData *data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        NSString *fileName = [NSString stringWithFormat:@"%@%@%@.h",prefix,name,suffix];
        
        if (![self createFileAtPath:path withName:fileName contents:data]) {
            
            return NO;
        }
        
        // 模板文件路径
        templatePath = [self.templateBundle pathForResource:[NSString stringWithFormat:@"%@.m",template] ofType:nil];
        // 模版文件内容
        templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        fileName = [NSString stringWithFormat:@"%@%@%@.m",prefix,name,suffix];
        
        if (![self createFileAtPath:path withName:fileName contents:data]) {
            
            return NO;
        }
    }
    
    return YES;
}

#pragma mark - PrivateMethod

/// 根据分隔符解析输入的类名
/// @param input 输入的类名字符串
/// @param separator 分割符
- (NSMutableArray *)fetchClassNamesWithString:(NSString *)input bySeparator:(NSArray *)separator {
    
    NSMutableArray *classNames = [NSMutableArray array];
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:[separator componentsJoinedByString:@""]];
    NSArray *names = [input componentsSeparatedByCharactersInSet:set];
    
    [names enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *name = (NSString *)obj;
        
        if (name && name.length > 0) {
            
            [classNames addObject:name];
        }
    }];
    
    return classNames;
}

/// 根据路径、文件名、文件内容创建文件夹和文件
/// @param path 文件路径
/// @param name 文件名
/// @param data 文件内容
- (BOOL)createFileAtPath:(NSString *)path withName:(NSString *)name contents:(NSData *)data {
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:path]) {
        
        // 创建文件夹
        if (![manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil]) {
            
            return NO;
        }
    }
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",path, name];
    
    return [[NSFileManager defaultManager] createFileAtPath:filePath contents:data attributes:nil];
}

/// 替换文本内容中的指定字符串
/// @param string 文本内容
/// @param marker 需要替换的字符串
/// @param substitute 新字符串
- (NSMutableString *)replaceString:(NSMutableString *)string marker:(NSDictionary *)marker withSubstitute:(NSDictionary *)substitute {
    
    NSMutableString *result = string;
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

/// 根据路径返回模版内容
/// @param path 模版文件路径
- (NSMutableString *)readTemplateContentsWithPath:(NSString *)path {
    
    NSError *error;
    NSMutableString *stringM = [NSMutableString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        
        NSLog(@"%@",error);
    }
    
    return stringM;
}

#pragma mark - Setter

#pragma mark - Getter
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
