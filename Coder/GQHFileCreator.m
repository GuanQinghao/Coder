//
//  GQHFileCreator.m
//  Coder
//
//  Created by Mac on 2019/2/1.
//  Copyright © 2019 GuanQinghao. All rights reserved.
//

#import "GQHFileCreator.h"


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

/// 缺省 Model.h 文件
static NSString * const kDefaultModelH = @"Objective-C/DefaultModel.h";
/// 缺省 Model.m 文件
static NSString * const kDefaultModelM = @"Objective-C/DefaultModel.m";

/// 自定义 View.h 文件
static NSString * const kCustomizedViewTemplateH = @"Objective-C/CustomizedViewTemplate.h";
/// 自定义 View.m 文件
static NSString * const kCustomizedViewTemplateM = @"Objective-C/CustomizedViewTemplate.m";

/// 自定义 TableViewCell.h 文件
static NSString * const kTableViewCellTemplateH = @"Objective-C/TableViewCellTemplate.h";
/// 自定义 TableViewCell.m 文件
static NSString * const kTableViewCellTemplateM = @"Objective-C/TableViewCellTemplate.m";

/// 自定义 CollectionViewCell.h 文件
static NSString * const kCollectionViewCellTemplateH = @"Objective-C/CollectionViewCellTemplate.h";
/// 自定义 CollectionViewCell.m 文件
static NSString * const kCollectionViewCellTemplateM = @"Objective-C/CollectionViewCellTemplate.m";


#pragma mark -

@interface GQHFileCreator ()

/**
 模版-分隔符
 */
@property (nonatomic, strong) NSArray *separators;

/**
 模板-标记符(旧值)
 */
@property (nonatomic, strong) NSMutableDictionary *marker;

/**
 模版-替换字符(新值)
 */
@property (nonatomic, strong) NSMutableDictionary *substitute;

/**
 模板资源包文件
 */
@property (nonatomic, strong) NSBundle *templateBundle;

@end

@implementation GQHFileCreator

/// 单例
static GQHFileCreator *singleton = nil;

/**
 单例

 @return 单例
 */
+ (instancetype)creator {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        singleton = [[super allocWithZone:NULL] init];
    });
    
    return singleton;
}

- (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    return  [[self class] creator];
}

/**
 根据模版生成Controller和View文件

 @param classesName 类名
 @param prefix 文件前缀
 @param path 文件保存路径
 @return 生成代码是否成功
 */
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
        NSString *templatePath = [self.templateBundle pathForResource:kDefaultControllerTemplateH ofType:nil];
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
        templatePath = [self.templateBundle pathForResource:kDefaultControllerTemplateM ofType:nil];
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
        templatePath = [self.templateBundle pathForResource:kDefaultViewTemplateH ofType:nil];
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
        templatePath = [self.templateBundle pathForResource:kDefaultViewTemplateM ofType:nil];
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

/**
 根据模版生成自定义View文件

 @param classesName 类名字符串(多个类名,分隔符隔开)
 @param prefix 文件前缀
 @param path 文件保存路径
 @return 是否成功生成
 */
- (BOOL)createCustomizedViewFilesWith:(NSString *)classesName prefix:(NSString *)prefix saveToPath:(NSString *)path {
    
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
        NSString *templatePath = [self.templateBundle pathForResource:kCustomizedViewTemplateH ofType:nil];
        // 模版文件内容
        NSMutableString *templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        NSData *data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        NSString *fileName = [NSString stringWithFormat:@"%@%@View.h",prefix,name];
        
        if (![self createFileAtPath:path withName:fileName contents:data]) {
            
            return NO;
        }
        
        // 模板文件路径
        templatePath = [self.templateBundle pathForResource:kCustomizedViewTemplateM ofType:nil];
        // 模版文件内容
        templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        fileName = [NSString stringWithFormat:@"%@%@View.m",prefix,name];
        
        if (![self createFileAtPath:path withName:fileName contents:data]) {
            
            return NO;
        }
    }
    
    return YES;
}

/**
 根据模版生成Model文件
 
 @param classesName 类名
 @param prefix 文件前缀
 @param path 文件保存路径
 @return 生成代码是否成功
 */
- (BOOL)createDefaultModelFilesWith:(NSString *)classesName prefix:(NSString *)prefix saveToPath:(NSString *)path {
    
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
        NSString *templatePath = [self.templateBundle pathForResource:kDefaultModelH ofType:nil];
        // 模版文件内容
        NSMutableString *templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        NSData *data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        NSString *fileName = [NSString stringWithFormat:@"%@%@Model.h",prefix,name];
        
        if (![self createFileAtPath:path withName:fileName contents:data]) {
            
            return NO;
        }
        
        // 模板文件路径
        templatePath = [self.templateBundle pathForResource:kDefaultModelM ofType:nil];
        // 模版文件内容
        templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        fileName = [NSString stringWithFormat:@"%@%@Model.m",prefix,name];
        
        if (![self createFileAtPath:path withName:fileName contents:data]) {
            
            return NO;
        }
    }
    
    return YES;
}

/**
 根据模版生成列表视图的行视图文件

 @param classesName 类名字符串(多个类名,分隔符隔开)
 @param prefix 文件前缀
 @param path 文件保存路径
 @return 是否成功生成
 */
- (BOOL)createTableViewCellFilesWith:(NSString *)classesName prefix:(NSString *)prefix saveToPath:(NSString *)path {
    
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
        NSString *templatePath = [self.templateBundle pathForResource:kTableViewCellTemplateH ofType:nil];
        // 模版文件内容
        NSMutableString *templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        NSData *data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        NSString *fileName = [NSString stringWithFormat:@"%@%@TableViewCell.h",prefix,name];
        
        if (![self createFileAtPath:path withName:fileName contents:data]) {
            
            return NO;
        }
        
        // 模板文件路径
        templatePath = [self.templateBundle pathForResource:kTableViewCellTemplateM ofType:nil];
        // 模版文件内容
        templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        fileName = [NSString stringWithFormat:@"%@%@TableViewCell.m",prefix,name];
        
        if (![self createFileAtPath:path withName:fileName contents:data]) {
            
            return NO;
        }
    }
    
    return YES;
}

/**
 根据模版生成集合视图的单元格视图文件

 @param classesName 类名字符串(多个类名,分隔符隔开)
 @param prefix 文件前缀
 @param path 文件保存路径
 @return 是否成功生成
 */
- (BOOL)createCollectionViewCellFilesWith:(NSString *)classesName prefix:(NSString *)prefix saveToPath:(NSString *)path {
    
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
        NSString *templatePath = [self.templateBundle pathForResource:kCollectionViewCellTemplateH ofType:nil];
        // 模版文件内容
        NSMutableString *templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        NSData *data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        NSString *fileName = [NSString stringWithFormat:@"%@%@CollectionViewCell.h",prefix,name];
        
        if (![self createFileAtPath:path withName:fileName contents:data]) {
            
            return NO;
        }
        
        // 模板文件路径
        templatePath = [self.templateBundle pathForResource:kCollectionViewCellTemplateM ofType:nil];
        // 模版文件内容
        templateContent = [self readTemplateContentsWithPath:templatePath];
        // 替换指定字符串
        templateContent = [self replaceString:templateContent marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        data = [templateContent dataUsingEncoding:NSUTF8StringEncoding];
        // 文件名
        fileName = [NSString stringWithFormat:@"%@%@CollectionViewCell.m",prefix,name];
        
        if (![self createFileAtPath:path withName:fileName contents:data]) {
            
            return NO;
        }
    }
    
    return YES;
}

#pragma mark - PrivateMethod

/**
 根据分隔符解析输入的类名

 @param input 输入的类名字符串
 @param separator 分割符
 @return 解析成功的类名数组
 */
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

/**
 根据路径、文件名、文件内容创建文件夹和文件

 @param path 文件路径
 @param name 文件名
 @param data 文件内容
 @return 创建文件是否成功
 */
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

/**
 替换文本内容中的指定字符串

 @param string 文本内容
 @param marker 需要替换的字符串
 @param substitute 新字符串
 @return 替换后的文本内容
 */
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

/**
 根据路径返回模版内容

 @param path 模版文件路径
 @return 模版内容
 */
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
