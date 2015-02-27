//
//  PCCategoryCell.h
//  PCCategoryView
//
//  Created by 远超李 on 15/2/13.
//  Copyright (c) 2015年 远超李. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PCCategoryCell;

typedef void(^DidSelect)(PCCategoryCell *cell);

@interface PCCategoryCell : UIView

@property (nonatomic, copy) DidSelect didSelect;
@property (nonatomic, assign) NSUInteger index;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, assign) UIEdgeInsets titleEdgeInsets;

@end
