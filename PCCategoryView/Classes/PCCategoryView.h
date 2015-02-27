//
//  PCCategoryView.h
//  PCCategoryView
//
//  Created by 远超李 on 15/2/13.
//  Copyright (c) 2015年 远超李. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PCCategoryView, PCCategoryCell;

typedef enum {
    PCCategoryViewScrollPositionNone,
    PCCategoryViewScrollPositionLeft,
    PCCategoryViewScrollPositionMiddle,
    PCCategoryViewScrollPositionRight
} PCCategoryViewScrollPosition;

@protocol PCCategoryViewDataSource <NSObject>

- (NSUInteger)numberOfCategoriesInCategoryView:(PCCategoryView *)categoryView;
- (NSString *)categoryView:(PCCategoryView *)categoryView titleForCategoryAtIndex:(NSUInteger)index;

@optional

- (PCCategoryCell *)categoryView:(PCCategoryView *)categoryView cellForCategoryAtIndex:(NSUInteger)index;

@end

@protocol PCCategoryViewDelegate <NSObject, UIScrollViewDelegate>

@optional

- (void)categoryView:(PCCategoryView *)categoryView didSelectAtIndex:(NSUInteger)index;
- (CGFloat)categoryView:(PCCategoryView *)categoryView widthForCategoryAtIndex:(NSUInteger)index;

@end

@interface PCCategoryView : UIScrollView

@property (nonatomic, assign) id<PCCategoryViewDataSource> dataSource;
@property (nonatomic, assign) id<PCCategoryViewDelegate> delegate;

- (void)selectCategoryAtIndex:(NSUInteger)index animated:(BOOL)animated scrollPosition:(PCCategoryViewScrollPosition)scrollPosition;
- (void)reloadCategories;

@end
