//
//  SeedCodeCreator.h
//  SeedCoder
//
//  Created by Hao on 2020/12/18.
//

#import "SeedCreator.h"


NS_ASSUME_NONNULL_BEGIN

@interface SeedCodeCreator : SeedCreator

/// 生成代码块
/// @param content 输入的内容
- (NSString *)createCodeSnippetWith:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
