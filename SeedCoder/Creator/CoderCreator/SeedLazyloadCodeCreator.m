//
//  SeedLazyloadCodeCreator.m
//  SeedCoder
//
//  Created by Hao on 2020/12/18.
//

#import "SeedLazyloadCodeCreator.h"

@interface SeedLazyloadCodeCreator ()

/// 标签懒加载代码块
@property (nonatomic, copy) NSString *labelString;
/// 单行输入框懒加载代码块
@property (nonatomic, copy) NSString *textFieldString;
/// 按钮懒加载代码块
@property (nonatomic, copy) NSString *buttonString;
/// 图片视图懒加载代码块
@property (nonatomic, copy) NSString *imageViewString;
/// 视图懒加载代码块
@property (nonatomic, copy) NSString *viewString;
/// 滚动视图懒加载代码块
@property (nonatomic, copy) NSString *scrollViewString;
/// 多行输入框懒加载代码块
@property (nonatomic, copy) NSString *textViewString;
/// 列表懒加载代码块
@property (nonatomic, copy) NSString *tableViewString;
/// 网页视图懒加载代码块
@property (nonatomic, copy) NSString *webViewString;
/// 集合视图懒加载代码块
@property (nonatomic, copy) NSString *collectionViewString;
/// 日期时间选择控件懒加载代码块
@property (nonatomic, copy) NSString *datePickerString;
/// 选择控件懒加载代码块
@property (nonatomic, copy) NSString *pickerViewString;
/// 开关控件懒加载代码块
@property (nonatomic, copy) NSString *switchString;
/// 进度条控件懒加载代码块
@property (nonatomic, copy) NSString *sliderString;

@end

@implementation SeedLazyloadCodeCreator

#pragma mark - override

+ (instancetype)creator {
    
    return [[SeedLazyloadCodeCreator alloc] init];
}

/// 生成代码块
/// @param content 输入的内容
- (NSString *)createCodeSnippetWith:(NSString *)content {
    
    // 替换字符串
    NSString *swap = @"<name>";
    
    // 分割属性名字符串
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@;"];
    NSArray *names = [content componentsSeparatedByCharactersInSet:set];
    
    NSLog(@"%@", names);
    
    __block NSString *result = @"";
    [names enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *name = (NSString *)obj;
        
        if (name && name.length > 0 && [name containsString:@"property"]) {
            
            NSDictionary *dict = [self propertyTypeWith:name];
            NSString *var = dict[@"var"];
            NSString *type = dict[@"type"];
            
            if ([type isEqualToString:@"UILabel"]) {
                
                result = [result stringByAppendingFormat:@"\n%@",[self.labelString stringByReplacingOccurrencesOfString:swap withString:var]];
            } else if ([type isEqualToString:@"UITextField"]) {
                
                result = [result stringByAppendingFormat:@"\n%@", [self.textFieldString stringByReplacingOccurrencesOfString:swap withString:var]];
            } else if ([type isEqualToString:@"UIButton"]) {
                
                NSString *temp = [self.buttonString stringByReplacingOccurrencesOfString:swap withString:var];
                NSString *capitalizedFirstString = [var stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[var substringToIndex:1].uppercaseString];
                result = [result stringByAppendingFormat:@"\n%@", [temp stringByReplacingOccurrencesOfString:@"<method>" withString:capitalizedFirstString]];
            } else if ([type isEqualToString:@"UIImageView"]) {
                
                result = [result stringByAppendingFormat:@"\n%@", [self.imageViewString stringByReplacingOccurrencesOfString:swap withString:var]];
            } else if ([type isEqualToString:@"UIView"]) {
                
                result = [result stringByAppendingFormat:@"\n%@", [self.viewString stringByReplacingOccurrencesOfString:swap withString:var]];
            } else if ([type isEqualToString:@"UIScrollView"]) {
                
                result = [result stringByAppendingFormat:@"\n%@", [self.scrollViewString stringByReplacingOccurrencesOfString:swap withString:var]];
            } else if ([type isEqualToString:@"UITextView"]) {
                
                result = [result stringByAppendingFormat:@"\n%@", [self.textViewString stringByReplacingOccurrencesOfString:swap withString:var]];
            } else if ([type isEqualToString:@"UITableView"]) {
                
                result = [result stringByAppendingFormat:@"\n%@", [self.tableViewString stringByReplacingOccurrencesOfString:swap withString:var]];
            } else if ([type isEqualToString:@"WKWebView"]) {
                
                result = [result stringByAppendingFormat:@"\n%@", [self.webViewString stringByReplacingOccurrencesOfString:swap withString:var]];
            } else if ([type isEqualToString:@"UICollectionView"]) {
                
                result = [result stringByAppendingFormat:@"\n%@", [self.collectionViewString stringByReplacingOccurrencesOfString:swap withString:var]];
            } else if ([type isEqualToString:@"UIDatePicker"]) {
                
                result = [result stringByAppendingFormat:@"\n%@", [self.datePickerString stringByReplacingOccurrencesOfString:swap withString:var]];
            } else if ([type isEqualToString:@"UIPickerView"]) {
                
                result = [result stringByAppendingFormat:@"\n%@", [self.pickerViewString stringByReplacingOccurrencesOfString:swap withString:var]];
            } else if ([type isEqualToString:@"UISwitch"]) {
                
                result = [result stringByAppendingFormat:@"\n%@", [self.switchString stringByReplacingOccurrencesOfString:swap withString:var]];
            } else if ([type isEqualToString:@"UISlider"]) {
                
                result = [result stringByAppendingFormat:@"\n%@", [self.sliderString stringByReplacingOccurrencesOfString:swap withString:var]];
            }
        }
    }];
    
    return result;
    
}


#pragma mark - private method

/// 截取字符串获取属性类型和属性名
/// @param string 属性字符串
- (NSDictionary *)propertyTypeWith:(NSString *)string {
    
    // 属性变量名
    NSRange range = [string rangeOfString:@"*"];
    NSString *var = [string substringFromIndex:range.location + 1];
    // 去空格和回车
    var = [var stringByReplacingOccurrencesOfString:@" " withString:@""];
    var = [var stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    // 属性类型
    NSRange sRange = [string rangeOfString:@")"];
    NSRange eRange = [string rangeOfString:@"*"];
    NSRange subRange = NSMakeRange(sRange.location + sRange.length, eRange.location - sRange.location - sRange.length);
    NSString *type = [string substringWithRange:subRange];
    // 去空格和回车
    type = [type stringByReplacingOccurrencesOfString:@" " withString:@""];
    type = [type stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return @{@"type":type, @"var":var};
}

#pragma mark - getter

- (NSString *)labelString {
    
    if (!_labelString) {
        
        _labelString = @"- (UILabel *)<name> {\n    \n    if (!_<name>) {\n        \n        _<name> = [[UILabel alloc] init];\n        _<name>.backgroundColor = [UIColor clearColor];\n        \n        _<name>.font = [UIFont systemFontOfSize:16.0f];\n        _<name>.text = NSLocalizedString(@\"Label\", @\"Label\");\n        _<name>.textColor = [UIColor darkTextColor];\n        _<name>.textAlignment = NSTextAlignmentLeft;\n        _<name>.numberOfLines = 0;\n    }\n    \n    return _<name>;\n}\n";
    }
    
    return _labelString;
}

- (NSString *)textFieldString {
    
    if (!_textFieldString) {
        
        _textFieldString = @"- (UITextField *)<name> {\n    \n    if (!_<name>) {\n        \n        _<name> = [[UITextField alloc] init];\n        _<name>.backgroundColor = [UIColor whiteColor];\n        \n        _<name>.font = [UIFont systemFontOfSize:16.0f];\n        _<name>.placeholder = NSLocalizedString(@\"TextFieldPlaceholder\", @\"TextFieldPlaceholder\");\n        _<name>.text = NSLocalizedString(@\"TextField\", @\"TextField\");\n        _<name>.textColor = [UIColor darkTextColor];\n        _<name>.textAlignment = NSTextAlignmentLeft;\n        _<name>.clearButtonMode = UITextFieldViewModeWhileEditing;\n        _<name>.keyboardType = UIKeyboardTypeDefault;\n    }\n    \n    return _<name>;\n}\n";
    }
    
    return _textFieldString;
}

- (NSString *)buttonString {
    
    if (!_buttonString) {
        
        _buttonString = @"- (UIButton *)<name> {\n    \n    if (!_<name>) {\n        \n        _<name> = [UIButton buttonWithType:UIButtonTypeCustom];\n        _<name>.backgroundColor = [UIColor clearColor];\n        _<name>.titleLabel.font = [UIFont systemFontOfSize:16.0f];\n        \n        [_<name> setImage:nil forState:UIControlStateNormal];\n        [_<name> setBackgroundImage:nil forState:UIControlStateNormal];\n        [_<name> setTitle:NSLocalizedString(@\"Button\", @\"Button\") forState:UIControlStateNormal];\n        [_<name> setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];\n        \n        [_<name> setImage:nil forState:UIControlStateSelected];\n        [_<name> setBackgroundImage:nil forState:UIControlStateSelected];\n        [_<name> setTitle:NSLocalizedString(@\"Button\", @\"Button\") forState:UIControlStateSelected];\n        [_<name> setTitleColor:[UIColor darkTextColor] forState:UIControlStateSelected];\n        \n        [_<name> addTarget:self action:@selector(didClick<method>:) forControlEvents:UIControlEventTouchUpInside];\n        \n        _<name>.layer.cornerRadius = 0.0f;\n        _<name>.layer.masksToBounds = YES;\n    }\n    \n    return _<name>;\n}\n";
    }
    
    return _buttonString;
}

- (NSString *)imageViewString {
    
    if (!_imageViewString) {
        
        _imageViewString = @"- (UIImageView *)<name> {\n    \n    if (!_<name>) {\n        \n        _<name> = [[UIImageView alloc] init];\n        _<name>.backgroundColor = [UIColor clearColor];\n        \n        _<name>.image = [UIImage imageNamed:@\"\"];\n        \n        _<name>.layer.cornerRadius = 0.0f;\n        _<name>.layer.masksToBounds = YES;\n    }\n    \n    return _<name>;\n}\n";
    }
    
    return _imageViewString;
}

- (NSString *)viewString {
    
    if (!_viewString) {
        
        _viewString = @"- (UIView *)<name> {\n    \n    if (!_<name>) {\n        \n        _<name> = [[UIView alloc] init];\n        _<name>.backgroundColor = [UIColor whiteColor];\n        \n        _<name>.layer.cornerRadius = 0.0f;\n        _<name>.layer.masksToBounds = YES;\n    }\n    \n    return _<name>;\n}\n";
    }
    
    return _viewString;
}

- (NSString *)scrollViewString {
    
    if (!_scrollViewString) {
        
        _scrollViewString = @"- (UIScrollView *)<name> {\n    \n    if (!_<name>) {\n        \n        _<name> = [[UIScrollView alloc] init];\n        _<name>.backgroundColor = [UIColor whiteColor];\n        \n        _<name>.bounces = YES;\n        _<name>.showsVerticalScrollIndicator = YES;\n        _<name>.showsHorizontalScrollIndicator = YES;\n    }\n    \n    return _<name>;\n}\n";
    }
    
    return _scrollViewString;
}

- (NSString *)textViewString {
    
    if (!_textViewString) {
        
        _textViewString = @"- (UITextView *)<name> {\n    \n    if (!_<name>) {\n        \n        _<name> = [[UITextView alloc] init];\n        _<name>.backgroundColor = [UIColor whiteColor];\n        \n        _<name>.font = [UIFont systemFontOfSize:16.0f];\n        _<name>.text = NSLocalizedString(@\"TextView\", @\"TextView\");\n        _<name>.textColor = [UIColor darkTextColor];\n        _<name>.textAlignment = NSTextAlignmentLeft;\n        \n        _<name>.layer.cornerRadius= 0.0f;\n        _<name>.layer.masksToBounds = YES;\n    }\n    \n    return _<name>;\n}";
    }
    
    return _textViewString;
}

- (NSString *)tableViewString {
    
    if (!_tableViewString) {
        
        _tableViewString = @"- (UITableView *)<name> {\n    \n    if (!_<name>) {\n        \n        _<name> = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];\n        _<name>.backgroundColor = [UIColor whiteColor];\n        \n        _<name>.separatorStyle = UITableViewCellSeparatorStyleNone;\n        _<name>.showsVerticalScrollIndicator = NO;\n        \n        if (@available(iOS 11.0, *)) {\n            \n            _<name>.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;\n        }\n    }\n    \n    return _<name>;\n}\n";
    }
    
    return _tableViewString;
}

- (NSString *)webViewString {
    
    if (!_webViewString) {
        
        _webViewString = @"- (WKWebView *)<name> {\n    \n    if (!_<name>) {\n        \n        _<name> = [[WKWebView alloc] init];\n        _<name>.backgroundColor = [UIColor whiteColor];\n    }\n    \n    return _<name>;\n}\n";
    }
    
    return _webViewString;
}

- (NSString *)collectionViewString {
    
    if (!_collectionViewString) {
        
        _collectionViewString = @"- (UICollectionView *)<name> {\n    \n    if (!_<name>) {\n        \n        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];\n        flowLayout.minimumLineSpacing = 0.0f;\n        flowLayout.minimumInteritemSpacing = 0.0f;\n        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;\n        \n        _<name> = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout: flowLayout];\n        _<name>.backgroundColor = [UIColor whiteColor];\n        _<name>.pagingEnabled = YES;\n        _<name>.showsHorizontalScrollIndicator = NO;\n        _<name>.showsVerticalScrollIndicator = NO;\n    }\n    \n    return _<name>;\n}\n";
    }
    
    return _collectionViewString;
}

- (NSString *)datePickerString {
    
    if (!_datePickerString) {
        
        _datePickerString = @"- (UIDatePicker *)<name> {\n    \n    if (!_<name>) {\n        \n        _<name> = [[UIDatePicker alloc] init];\n        _<name>.minimumDate = [NSDate date];\n        _<name>.maximumDate = [NSDate date];\n        _<name>.datePickerMode = UIDatePickerModeDateAndTime;\n        \n        [_<name> addTarget:self action:@selector(didSelectDate:) forControlEvents:UIControlEventValueChanged];\n    }\n    \n    return _<name>;\n}\n";
    }
    
    return _datePickerString;
}

- (NSString *)pickerViewString {
    
    if (!_pickerViewString) {
        
        _pickerViewString = @"- (UIPickerView *)<name> {\n    \n    if (!_<name>) {\n        \n        _<name> = [[UIPickerView alloc] init];\n        _<name>.backgroundColor = [UIColor whiteColor];\n        _<name>.delegate = self;\n        _<name>.dataSource = self;\n    }\n    \n    return _<name>;\n}\n";
    }
    
    return _pickerViewString;
}

- (NSString *)switchString {
    
    if (!_switchString) {
        
        _switchString = @"- (UISwitch *)<name> {\n    \n    if (!_<name>) {\n        \n        _<name> = [[UISwitch alloc] init];\n        _<name>.on = YES;\n    }\n    \n    return _<name>;\n}\n";
    }
    
    return _switchString;
}

- (NSString *)sliderString {
    
    if (!_sliderString) {
        
        _sliderString = @"- (UISlider *)<name> {\n    \n    if (!_<name>) {\n        \n        _<name> = [[UISlider alloc] init];\n        \n        _<name>.value = 0.5f;\n        _<name>.minimumValue = 0.0f;\n        _<name>.maximumValue = 1.0f;\n    }\n    \n    return _<name>;\n}\n";
    }
    
    return _sliderString;
}

@end
