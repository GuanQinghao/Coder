//
//  SeedCreator.m
//  SeedCoder
//
//  Created by Hao on 2020/12/17.
//

#import "SeedCreator.h"


/// 单例
static SeedCreator *singleton = nil;

@implementation SeedCreator

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

@end
