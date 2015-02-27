//
//  ViewController.m
//  PCCategoryView
//
//  Created by 远超李 on 15/2/12.
//  Copyright (c) 2015年 远超李. All rights reserved.
//

#import "ViewController.h"
#import "PCCategoryView.h"
#import "PCCategoryCell.h"

@interface ViewController () <PCCategoryViewDataSource, PCCategoryViewDelegate>

@property (nonatomic, strong) PCCategoryView *categoryView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.categoryView = [[PCCategoryView alloc] initWithFrame:CGRectZero];
    self.categoryView.dataSource = self;
    self.categoryView.delegate = self;
    [self.view addSubview:self.categoryView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.categoryView.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 50);

    [self.categoryView reloadCategories];
}

#pragma mark - PCCategoryViewDataSource

- (NSUInteger)numberOfCategoriesInCategoryView:(PCCategoryView *)categoryView {
    return 10;
}

- (NSString *)categoryView:(PCCategoryView *)categoryView titleForCategoryAtIndex:(NSUInteger)index {
    return [NSString stringWithFormat:@"index + %d", index];
}

#pragma mark - PCCategoryViewDelegate

- (void)categoryView:(PCCategoryView *)categoryView didSelectAtIndex:(NSUInteger)index {
    NSLog(@"did select %d", index);
}

- (CGFloat)categoryView:(PCCategoryView *)categoryView widthForCategoryAtIndex:(NSUInteger)index {
    return 100;
}

@end
