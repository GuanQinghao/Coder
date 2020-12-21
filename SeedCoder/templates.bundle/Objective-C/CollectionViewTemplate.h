//
//  <prefix><name>View.h
//
//  Created by GuanQinghao on <date>.
//  Copyright © <year> GuanQinghao. All rights reserved.
//

#import "SeedBaseView.h"
#import "SeedBaseCollectionView.h"


#pragma mark --------------------------- <root view> ---------------------------

NS_ASSUME_NONNULL_BEGIN

/// 控制器自定义根视图
@interface <prefix><name>View : SeedBaseView

/// 集合视图
@property (nonatomic, strong) SeedBaseCollectionView *s_collectionView;

@end

NS_ASSUME_NONNULL_END
