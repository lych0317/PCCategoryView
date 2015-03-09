//
//  PCCategoryCell.m
//  PCCategoryView
//
//  Created by 远超李 on 15/2/13.
//  Copyright (c) 2015年 远超李. All rights reserved.
//

#import "PCCategoryCell.h"

@interface PCCategoryCell ()

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@end

@implementation PCCategoryCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureResponsed:)];
        [self addGestureRecognizer:self.tapGesture];

        [self addSubview:self.titleLabel];

        [self reset];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(self.titleEdgeInsets.left, self.titleEdgeInsets.top, CGRectGetWidth(self.frame) - self.titleEdgeInsets.left - self.titleEdgeInsets.right, CGRectGetHeight(self.frame) - self.titleEdgeInsets.top - self.titleEdgeInsets.bottom);
}

- (void)reset {
    self.titleLabel.text = @"";
    self.titleEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
}

- (void)tapGestureResponsed:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        if (self.didSelect) {
            self.didSelect(self);
        }
    }
}

#pragma mark - Getters

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.highlightedTextColor = [UIColor grayColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end
