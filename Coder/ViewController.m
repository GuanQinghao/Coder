//
//  ViewController.m
//  Coder
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <NSTextViewDelegate>

/// 类名输入框
@property (unsafe_unretained) IBOutlet NSTextView *textView;
/// 类前缀输入框
@property (weak) IBOutlet NSTextField *prefixTextField;
/// 新文件保存路径
@property (weak) IBOutlet NSTextField *pathTextField;

/// 分隔符
@property (nonatomic, strong) NSArray *separators;
/// 模板标记符(旧值)
@property (nonatomic, strong) NSMutableDictionary *marker;
/// 替换字符(新值)
@property (nonatomic, strong) NSMutableDictionary *substitute;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)createControllerFiles:(id)sender {
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleWarning;
    alert.messageText = @"Warning!";
    alert.icon = [NSImage imageNamed:@"warning"];
    
    // 获取所有类名
    NSString *input = [self.textView.textStorage string];
    if (!input || [input isKindOfClass:[NSNull class]] || input.length <= 0) {
        
        alert.informativeText = @"Input your class name(s).";
        [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
        
        return;
    }
    // 文件保存路径
    NSString *savePath = self.pathTextField.stringValue;
    if (!savePath || [savePath isKindOfClass:[NSNull class]] || savePath.length <= 0) {
        
        alert.informativeText = @"Input the path for files.";
        [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
        
        return;
    }
    
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"Templates.bundle" ofType:nil]];
    NSArray *classNames = [self fetchClassNamesWithString:input bySeparator:self.separators];
    NSString *prefix = self.prefixTextField.stringValue;
    
    for (NSString *name in classNames) {
        
        // 准备替换字符串字典
        [self.substitute setValue:prefix forKey:@"c"];
        [self.substitute setValue:name forKey:@"d"];
        
        // 生成Controller.h文件
        NSString *hControllerPath = [bundle pathForResource:@"Objective-C/Controller.h" ofType:nil];
        // 读取模版文件内容
        NSMutableString *hControllerString = [self readTemplateContentsWithPath:hControllerPath];
        // 替换指定字符串
        hControllerString = [self replaceString:hControllerString Marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        NSData *hControllerData = [hControllerString dataUsingEncoding:NSUTF8StringEncoding];
        NSString *hControllerFileName = [NSString stringWithFormat:@"%@%@Controller.h",prefix,name];
        [self createFileAtPath:savePath withName:hControllerFileName contents:hControllerData];
        
        // 生成Controller.m文件
        NSString *mControllerPath = [bundle pathForResource:@"Objective-C/Controller.m" ofType:nil];
        // 读取模版文件内容
        NSMutableString *mControllerString = [self readTemplateContentsWithPath:mControllerPath];
        // 替换指定字符串
        mControllerString = [self replaceString:mControllerString Marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        NSData *mControllerData = [mControllerString dataUsingEncoding:NSUTF8StringEncoding];
        NSString *mControllerFileName = [NSString stringWithFormat:@"%@%@Controller.m",prefix,name];
        [self createFileAtPath:savePath withName:mControllerFileName contents:mControllerData];
        
        // 生成view.h文件
        NSString *hViewPath = [bundle pathForResource:@"Objective-C/View.h" ofType:nil];
        // 读取模版文件内容
        NSMutableString *hViewString = [self readTemplateContentsWithPath:hViewPath];
        // 替换指定字符串
        hViewString = [self replaceString:hViewString Marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        NSData *hViewData = [hViewString dataUsingEncoding:NSUTF8StringEncoding];
        NSString *hViewDataFileName = [NSString stringWithFormat:@"%@%@View.h",prefix,name];
        [self createFileAtPath:savePath withName:hViewDataFileName contents:hViewData];
        
        // 生成view.h文件
        NSString *mViewPath = [bundle pathForResource:@"Objective-C/View.m" ofType:nil];
        // 读取模版文件内容
        NSMutableString *mViewString = [self readTemplateContentsWithPath:mViewPath];
        // 替换指定字符串
        mViewString = [self replaceString:mViewString Marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        NSData *mViewData = [mViewString dataUsingEncoding:NSUTF8StringEncoding];
        NSString *mViewDataFileName = [NSString stringWithFormat:@"%@%@View.m",prefix,name];
        [self createFileAtPath:savePath withName:mViewDataFileName contents:mViewData];
    }
}

- (IBAction)createModelFiles:(id)sender {
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleWarning;
    alert.messageText = @"Warning!";
    alert.icon = [NSImage imageNamed:@"warning"];
    
    // 获取所有类名
    NSString *input = [self.textView.textStorage string];
    if (!input || [input isKindOfClass:[NSNull class]] || input.length <= 0) {
        
        alert.informativeText = @"Input your class name(s).";
        [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
        
        return;
    }
    // 文件保存路径
    NSString *savePath = self.pathTextField.stringValue;
    if (!savePath || [savePath isKindOfClass:[NSNull class]] || savePath.length <= 0) {
        
        alert.informativeText = @"Input the path for files.";
        [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
        
        return;
    }
    
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"Templates.bundle" ofType:nil]];
    NSArray *classNames = [self fetchClassNamesWithString:input bySeparator:self.separators];
    NSString *prefix = self.prefixTextField.stringValue;
    
    for (NSString *name in classNames) {
        
        // 准备替换字符串字典
        [self.substitute setValue:prefix forKey:@"c"];
        [self.substitute setValue:name forKey:@"d"];
        
        // 生成Model.h文件
        NSString *hModelPath = [bundle pathForResource:@"Objective-C/Model.h" ofType:nil];
        // 读取模版文件内容
        NSMutableString *hModelString = [self readTemplateContentsWithPath:hModelPath];
        // 替换指定字符串
        hModelString = [self replaceString:hModelString Marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        NSData *hModelData = [hModelString dataUsingEncoding:NSUTF8StringEncoding];
        NSString *hModelFileName = [NSString stringWithFormat:@"%@%@Model.h",prefix,name];
        [self createFileAtPath:savePath withName:hModelFileName contents:hModelData];
        
        // 生成Model.m文件
        NSString *mModelPath = [bundle pathForResource:@"Objective-C/Model.m" ofType:nil];
        // 读取模版文件内容
        NSMutableString *mModelString = [self readTemplateContentsWithPath:mModelPath];
        // 替换指定字符串
        mModelString = [self replaceString:mModelString Marker:self.marker withSubstitute:self.substitute];
        // 创建文件
        NSData *mModelData = [mModelString dataUsingEncoding:NSUTF8StringEncoding];
        NSString *mModelFileName = [NSString stringWithFormat:@"%@%@Model.m",prefix,name];
        [self createFileAtPath:savePath withName:mModelFileName contents:mModelData];
    }
}

#pragma mark --Delegate

#pragma mark --TargetMethod

#pragma mark --PrivateMethod
/// 根据分隔符解析输入的类名
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
/// 选择或输入保存文件的路径
- (IBAction)chooseDirectory:(id)sender {
    
    NSOpenPanel *panel = [[NSOpenPanel alloc] init];
    panel.canCreateDirectories = YES;
    panel.canChooseDirectories = YES;
    panel.canChooseFiles = NO;
    panel.allowsMultipleSelection = NO;
    [panel beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse result) {
        
        if (result == NSModalResponseOK) {
            
            self.pathTextField.stringValue = panel.URLs.firstObject.path;
            NSLog(@"%@",panel.URLs.firstObject.path);
        }
    }];
}
/// 根据路径、文件名、文件内容创建文件
- (BOOL)createFileAtPath:(NSString *)path withName:(NSString *)name contents:(NSData *)data {
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",path, name];
    
    return [[NSFileManager defaultManager] createFileAtPath:filePath contents:data attributes:nil];
}
/// 替换指定字符串
- (NSMutableString *)replaceString:(NSMutableString *)string Marker:(NSDictionary *)marker withSubstitute:(NSDictionary *)substitute {
    
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
- (NSMutableString *)readTemplateContentsWithPath:(NSString *)path {
    
    NSError *error;
    NSMutableString *stringM = [NSMutableString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        
        NSLog(@"%@",error);
    }
    return stringM;
}

#pragma mark --Setter

#pragma mark --Getter
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

@end
