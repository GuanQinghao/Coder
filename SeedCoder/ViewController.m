//
//  ViewController.m
//  Coder
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "ViewController.h"
#import "SeedFileCreator.h"
#import "SeedLazyloadCodeCreator.h"
#import "SeedPropertyCodeCreator.h"


#pragma mark -

@interface ViewController () <NSTextViewDelegate>

/// 内容输入框
@property (unsafe_unretained) IBOutlet NSTextView *inputTextView;
/// 结果输出框
@property (unsafe_unretained) IBOutlet NSTextView *outputTextView;
/// 前缀输入框
@property (weak) IBOutlet NSTextField *prefixTextField;
/// 文件保存路径选择框
@property (weak) IBOutlet NSTextField *pathTextField;

/// 输入的内容
@property (nonatomic, copy) NSString *inputContent;

@end

@implementation ViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.inputTextView.font = [NSFont systemFontOfSize:15.0f];
    self.inputTextView.textColor = [NSColor textColor];
    
    self.outputTextView.font = [NSFont systemFontOfSize:15.0f];
    self.outputTextView.textColor = [NSColor textColor];
}

#pragma mark - target method

/// 生成Controller文件
/// @param sender 生成按钮
- (IBAction)createControllerFiles:(id)sender {
    
    [self createFile:SeedFileTypeTableViewController];
}

/// 生成Model文件
/// @param sender 生成按钮
- (IBAction)createModelFiles:(id)sender {
    
    [self createFile:SeedFileTypeModel];
}

/// 生成自定义View文件
/// @param sender 生成按钮
- (IBAction)createCustomizedViewFiles:(id)sender {
    
    [self createFile:SeedFileTypeView];
}

/// 生成列表视图的行视图文件
/// @param sender 生成按钮
- (IBAction)createTableViewCell:(id)sender {
    
    [self createFile:SeedFileTypeTableViewCell];
}

/// 生成列表视图的头视图文件
/// @param sender 生成按钮
- (IBAction)createTableViewHeaderView:(id)sender {
    
    [self createFile:SeedFileTypeTableViewHeaderView];
}

/// 生成列表视图的尾视图文件
/// @param sender 生成按钮
- (IBAction)createTableViewFooterView:(id)sender {
    
    [self createFile:SeedFileTypeTableViewFooterView];
}

/// 生成集合视图的单元格视图文件
/// @param sender 生成按钮
- (IBAction)createCollectionViewCellFiles:(id)sender {
    
    [self createFile:SeedFileTypeCollectionViewCell];
}

/// 生成集合视图的头视图文件
/// @param sender 生成按钮
- (IBAction)createCollectionViewHeaderView:(id)sender {
    
    [self createFile:SeedFileTypeCollectionReusableHeaderView];
}

/// 生成集合视图的尾视图文件
/// @param sender 生成按钮
- (IBAction)createCollectionViewFooterView:(id)sender {
    
    [self createFile:SeedFileTypeCollectionReusableFooterView];
}

#pragma mark ---根据JSON字符串生成属性

/// 根据JSON字符串生成属性列表
/// @param sender 生成按钮
- (IBAction)JSONToProperty:(id)sender {
    
    // 内容检查
    if (![self isReadyToPropertyCode:self.inputContent]) {
        return;
    }
    
    // 生成属性列表
    self.outputTextView.string = [[SeedPropertyCodeCreator creator] createCodeSnippetWith:self.inputContent];
    if (!self.outputTextView.string.length) {
        
        // 生成代码失败
        [self failedToCode];
    }
}

#pragma mark ---根据属性生成懒加载代码

/// 根据属性生成懒加载代码
/// @param sender 生成按钮
- (IBAction)outputLazyLoad:(id)sender {
    
    // 内容检查
    if (![self isReadyToLazyloadCode:self.inputContent]) {
        return;
    }
    
    // 生成懒加载代码
    self.outputTextView.string = [[SeedLazyloadCodeCreator creator] createCodeSnippetWith:self.inputContent];
    if (!self.outputTextView.string.length) {
        
        // 生成代码失败
        [self failedToCode];
    }
}

/// 选择或输入保存文件的路径
/// @param sender 选择按钮
- (IBAction)chooseDirectory:(id)sender {
    
    // 弹出面板
    NSOpenPanel *panel = [[NSOpenPanel alloc] init];
    panel.canCreateDirectories = YES;
    panel.canChooseDirectories = YES;
    panel.canChooseFiles = NO;
    panel.allowsMultipleSelection = NO;
    [panel beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse result) {
        
        if (result == NSModalResponseOK) {
            
            // 文件夹名称
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"HHmmss";
            NSString *folderName = [NSString stringWithFormat:@"Code-%@", [formatter stringFromDate:[NSDate date]]];
            
            // 文件夹路径
            NSString *path = [NSString stringWithFormat:@"%@/%@", panel.URLs.firstObject.path, folderName];
            self.pathTextField.stringValue = path;
        }
    }];
}

#pragma mark - private method

/// 抽取生成代码文件方法
/// @param type 类型
- (void)createFile:(SeedFileType)type {
    
    // 内容检查
    NSString *inputContent = [self.inputTextView.textStorage string];
    if (![self isReadyToCodeFile:inputContent]) {
        return;
    }
    
    // 路径检查
    NSString *savePath = self.pathTextField.stringValue;
    if (![self checkFileSavePath:savePath]) {
        return;
    }
    
    // 生成代码
    if ([[SeedFileCreator creator] createFile:type with:inputContent prefix:self.prefixTextField.stringValue saveToPath:savePath]) {
        
        // 完成
        [self createCodeDone];
    } else {
        
        // 生成代码失败
        [self failedToCode];
    }
}

/// 生成文件的前置错误处理
/// @param content 输入的内容
- (BOOL)isReadyToCodeFile:(NSString *)content {
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleWarning;
    alert.messageText = @"Warning!";
    alert.icon = [NSImage imageNamed:@"warning"];
    
    // 输入的内容
    if (!content || [content isKindOfClass:[NSNull class]] || content.length <= 0) {
        
        alert.informativeText = @"Input your class name(s).";
        [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
        
        return NO;
    }
    
    return YES;
}

/// 检查文件保存路径
/// @param savePath 文件保存路径
- (BOOL)checkFileSavePath:(NSString *)savePath {
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleWarning;
    alert.messageText = @"Warning!";
    alert.icon = [NSImage imageNamed:@"warning"];
    
    // 文件保存路径
    if (!savePath || [savePath isKindOfClass:[NSNull class]] || savePath.length <= 0) {
        
        alert.informativeText = @"Select the path for files.";
        [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
        
        return NO;
    }
    
    return NO;
}

/// 根据属性生成懒加载代码的前置错误处理
/// @param content 属性字符串
- (BOOL)isReadyToLazyloadCode:(NSString *)content {
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleWarning;
    alert.messageText = @"Warning!";
    alert.icon = [NSImage imageNamed:@"warning"];
    
    if (!content || [content isKindOfClass:[NSNull class]] || content.length <= 0) {
        
        alert.informativeText = @"Input your property(properties) description.";
        [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
        
        return NO;
    }
    
    return YES;
}

/// 根据JSON字符串生成属性的前置错误处理
/// @param content JSON字符串
- (BOOL)isReadyToPropertyCode:(NSString *)content {
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleWarning;
    alert.messageText = @"Warning!";
    alert.icon = [NSImage imageNamed:@"warning"];
    
    // JSON字符串是否有效
    NSData *JSONData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        
        alert.informativeText = @"Input correct JSON string.";
        [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
        
        return NO;
    }
    
    return YES;
}

/// 代码生成失败
- (void)failedToCode {
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleWarning;
    alert.messageText = @"Warning!";
    alert.icon = [NSImage imageNamed:@"warning"];
    alert.informativeText = @"Creator failed to create code(s)!";
    [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
}

/// 完成处理
- (void)createCodeDone {
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleWarning;
    alert.messageText = @"Done!";
    alert.icon = [NSImage imageNamed:@"done"];
    alert.informativeText = @"Creator had create code(s)!";
    [alert beginSheetModalForWindow:self.view.window completionHandler:nil];
}

#pragma mark - setter

#pragma mark - getter

- (NSString *)inputContent {
    
    return [self.inputTextView.textStorage string];
}

@end
