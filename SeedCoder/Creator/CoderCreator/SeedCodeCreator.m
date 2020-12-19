//
//  SeedCodeCreator.m
//  SeedCoder
//
//  Created by Hao on 2020/12/18.
//

#import "SeedCodeCreator.h"


@implementation SeedCodeCreator

- (NSString *)createCodeSnippetWith:(NSString *)content {
    
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)] userInfo:nil];
    
    return nil;
}

@end
