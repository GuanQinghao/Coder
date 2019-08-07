//
//  ViewController.m
//  Coder
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "ViewController.h"
#import "GQHFileCreator.h"
#import "GQHLazyLoadCreator.h"
#import "GQHPropertyCreator.h"


#pragma mark -

@interface ViewController () <NSTextViewDelegate>

/**
 类名、属性名、JSON字符串输入框
 */
@property (unsafe_unretained) IBOutlet NSTextView *inputTextView;
/**
 属性懒加载、JSON转属性列表输出框
 */
@property (unsafe_unretained) IBOutlet NSTextView *outputTextView;

/**
 类前缀输入框
 */
@property (weak) IBOutlet NSTextField *prefixTextField;

/**
 新文件保存路径选择框
 */
@property (weak) IBOutlet NSTextField *pathTextField;

/**
 所有类名
 */
@property (nonatomic, copy) NSString *classesName;
/**
 所有属性名
 */
@property (nonatomic, copy) NSString *propertiesName;
/**
 JSON字符串
 */
@property (nonatomic, copy) NSString *JSONString;

/**
 代码文件保存路径
 */
@property (nonatomic, copy) NSString *savePath;

@end

@implementation ViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.inputTextView.font = [NSFont systemFontOfSize:15.0f];
    self.inputTextView.textColor = [NSColor textColor];
    
    self.outputTextView.font = [NSFont systemFontOfSize:15.0f];
    self.inputTextView.textColor = [NSColor textColor];
}

#pragma mark - TargetMethod
#pragma mark ---根据模版生成代码文件
/**
 生成Controller和View文件

 @param sender 生成按钮
 */
- (IBAction)createControllerFiles:(id)sender {
    
    // 前置错误处理
    if (![self isReadyToCodeFile]) {
        
        return;
    }
    
    // 生成代码
    if ([[GQHFileCreator creator] createControllerFilesWith:self.classesName prefix:self.prefixTextField.stringValue saveToPath:self.savePath]) {
        
        // 完成
        [self createCodeDone];
    } else {
        
        // 生成代码失败
        [self failedToCode];
    }
}

/**
 生成Model文件

 @param sender 生成按钮
 */
- (IBAction)createModelFiles:(id)sender {
    
    // 前置错误处理
    if (![self isReadyToCodeFile]) {
        
        return;
    }
    
    // 生成代码
    if ([[GQHFileCreator creator] createModelFilesWith:self.classesName prefix:self.prefixTextField.stringValue saveToPath:self.savePath]) {
        
        // 完成
        [self createCodeDone];
    } else {
        
        // 生成代码失败
        [self failedToCode];
    }
}

#pragma mark ---根据JSON字符串生成属性
/**
 根据JSON字符串生成属性列表

 @param sender 生成按钮
 */
- (IBAction)JSONToProperty:(id)sender {
    
    // 前置错误处理
    if (![self isReadyToPropertyCode]) {
        
        return;
    }
    
    self.outputTextView.string = [[GQHLazyLoadCreator creator] createCodeWith:self.JSONString];
    
    if (!self.outputTextView.string.length) {
        
        // 生成代码失败
        [self failedToCode];
    }
}

#pragma mark ---根据属性生成懒加载代码
/**
 根据属性生成懒加载代码

 @param sender 生成按钮
 */
- (IBAction)outputLazyLoad:(id)sender {
    
    // 前置错误处理
    if (![self isReadyToCodeString]) {
        
        return;
    }
    
    self.outputTextView.string = [[GQHLazyLoadCreator creator] createCodeWith:self.propertiesName];
    
    if (!self.outputTextView.string.length) {
        
        // 生成代码失败
        [self failedToCode];
    }
}

/**
 选择或输入保存文件的路径

 @param sender 选择按钮
 */
- (IBAction)chooseDirectory:(id)sender {
    
    NSOpenPanel *panel = [[NSOpenPanel alloc] init];
    panel.canCreateDirectories = YES;
    panel.canChooseDirectories = YES;
    panel.canChooseFiles = NO;
    panel.allowsMultipleSelection = NO;
    [panel beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse result) {
        
        if (result == NSModalResponseOK) {
            
            // 文件夹名称
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"HH-mm-ss";
            NSString *folderName = [NSString stringWithFormat:@"code-%@", [formatter stringFromDate:[NSDate date]]];
            
            // 文件夹路径
            NSString *path = [NSString stringWithFormat:@"%@/%@", panel.URLs.firstObject.path, folderName];
            self.pathTextField.stringValue = path;
        }
    }];
}

#pragma mark - PrivateMethod

/**
 根据类名和模版生成代码文件的前置错误处理

 @return 是否可以生成代码文件
 */
- (BOOL)isReadyToCodeFile {
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleWarning;
    alert.messageText = @"Warning!";
    alert.icon = [NSImage imageNamed:@"warning"];
    
    // 获取所有类名
    self.classesName = [self.inputTextView.textStorage string];
    if (!self.classesName || [self.classesName isKindOfClass:[NSNull class]] || self.classesName.length <= 0) {
        
        alert.informativeText = @"Input your class name(s).";
        [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
        
        return NO;
    }
    
    // 文件保存路径
    self.savePath = self.pathTextField.stringValue;
    if (!self.savePath || [self.savePath isKindOfClass:[NSNull class]] || self.savePath.length <= 0) {
        
        alert.informativeText = @"Input the path for files.";
        [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
        
        return NO;
    }
    
    return YES;
}

/**
 根据属性生成懒加载代码的前置错误处理

 @return 是否可以生成代码字符串
 */
- (BOOL)isReadyToCodeString {
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleWarning;
    alert.messageText = @"Warning!";
    alert.icon = [NSImage imageNamed:@"warning"];
    
    // 获取所有属性名
    self.propertiesName = [self.inputTextView.textStorage string];
    if (!self.propertiesName || [self.propertiesName isKindOfClass:[NSNull class]] || self.propertiesName.length <= 0) {
        
        alert.informativeText = @"Input your property(properties) description.";
        [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
        
        return NO;
    }
    
    return YES;
}

/**
 根据JSON字符串生成属性的前置错误处理

 @return 是否可以生成属性列表
 */
- (BOOL)isReadyToPropertyCode {
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleWarning;
    alert.messageText = @"Warning!";
    alert.icon = [NSImage imageNamed:@"warning"];
    
    // 获取JSON字符串
    self.JSONString = [self.inputTextView.textStorage string];
    
    if (![NSJSONSerialization isValidJSONObject:self.JSONString]) {

        alert.informativeText = @"Input correct JSON string.";
        [alert beginSheetModalForWindow:self.view.window completionHandler:nil];

        return NO;
    }
    
    return YES;
}

/**
 代码生成失败
 */
- (void)failedToCode {
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleWarning;
    alert.messageText = @"Warning!";
    alert.icon = [NSImage imageNamed:@"warning"];
    alert.informativeText = @"Creator failed to create code(s)!";
    [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
}

/**
 完成处理
 */
- (void)createCodeDone {
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleWarning;
    alert.messageText = @"Done!";
    alert.icon = [NSImage imageNamed:@"done"];
    alert.informativeText = @"Creator had create code(s)!";
    [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
}

#pragma mark - Setter

#pragma mark - Getter

@end
