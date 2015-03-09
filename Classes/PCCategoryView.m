//
//  PCCategoryView.m
//  PCCategoryView
//
//  Created by 远超李 on 15/2/13.
//  Copyright (c) 2015年 远超李. All rights reserved.
//

#import "PCCategoryView.h"
#import "PCCategoryCell.h"

@interface PCCategoryView ()

@property (nonatomic, readonly, strong) NSMutableArray *categoryCellArray;

@end

@implementation PCCategoryView

@synthesize categoryCellArray = _categoryCellArray;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)selectCategoryAtIndex:(NSUInteger)index animated:(BOOL)animated scrollPosition:(PCCategoryViewScrollPosition)scrollPosition {
}

- (void)reloadCategories {
    if (self.dataSource == nil) {
        NSLog(@"ERROR: the data source is nil");
        return;
    }
    [self reset];
    NSUInteger categoryNumber = [self numberOfCategories];

    CGSize size = CGSizeMake(0, CGRectGetHeight(self.frame));
    float x = 0;
    for (int i = 0; i < categoryNumber; i++) {
        PCCategoryCell *cell = [self cellForCategoryAtIndex:i];
        cell.didSelect = ^(PCCategoryCell *cell) {
            [self didSelectCategoryCell:cell];
        };
        size.width = [self widthForCategoryAtIndex:i];
        cell.frame = CGRectMake(x, 0, size.width, size.height);
        x += size.width;
        [self addSubview:cell];
    }
    self.contentSize = CGSizeMake(x, size.height);
}

- (void)didSelectCategoryCell:(PCCategoryCell *)categoryCell {
    if ([self.delegate respondsToSelector:@selector(categoryView:didSelectAtIndex:)]) {
        [self.delegate categoryView:self didSelectAtIndex:categoryCell.index];
    }
}

- (void)reset {
    for (PCCategoryCell *cell in self.categoryCellArray) {
        [cell removeFromSuperview];
        [self.categoryCellArray removeObject:cell];
    }
}

- (NSUInteger)numberOfCategories {
    NSUInteger retNumber = 0;;
    if ([self.dataSource respondsToSelector:@selector(numberOfCategoriesInCategoryView:)]) {
        retNumber = [self.dataSource numberOfCategoriesInCategoryView:self];
    }
    return retNumber;
}

- (NSString *)titleForCategoryAtIndex:(NSUInteger)index {
    NSString *retTitle = @"";
    if ([self.dataSource respondsToSelector:@selector(categoryView:titleForCategoryAtIndex:)]) {
        retTitle = [self.dataSource categoryView:self titleForCategoryAtIndex:index];
    }
    return retTitle;
}

- (PCCategoryCell *)cellForCategoryAtIndex:(NSUInteger)index {
    PCCategoryCell *retCell = nil;
    if ([self.dataSource respondsToSelector:@selector(categoryView:cellForCategoryAtIndex:)]) {
        retCell = [self.dataSource categoryView:self cellForCategoryAtIndex:index];
    } else {
        retCell = [[PCCategoryCell alloc] initWithFrame:CGRectZero];
        retCell.titleLabel.text = [self titleForCategoryAtIndex:index];
    }
    return retCell;
}

- (CGFloat)widthForCategoryAtIndex:(NSUInteger)index {
    CGFloat retWidth = 50;
    if ([self.delegate respondsToSelector:@selector(categoryView:widthForCategoryAtIndex:)]) {
        retWidth = [self.delegate categoryView:self widthForCategoryAtIndex:index];
    }
    return retWidth;
}

#pragma mark - Getters

- (NSMutableArray *)categoryCellArray {
    if (_categoryCellArray == nil) {
        _categoryCellArray = [[NSMutableArray alloc] init];
    }
    return _categoryCellArray;
}

@end
