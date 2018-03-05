


//
//  JHFCViewController.m
//  JHFloatControlDemo
//
//  Created by JasonHu on 2017/11/7.
//  Copyright © 2017年 JasonHu. All rights reserved.
//

#import "JHFCViewController.h"

@implementation JHFCViewController

- (instancetype)initWithItems:(NSArray<XFATItemView *> *)items {
    self = [super initWithItems:items];
    if (self) {
        
        for (XFATItemView *item in items) {
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
            [item addGestureRecognizer:tapGestureRecognizer];
        }
        
    }
    return self;
}

#pragma mark - Action

- (void)tapGestureAction:(UITapGestureRecognizer *)tapGestureRecognizer {
    if (_delegate && [_delegate respondsToSelector:@selector(viewController:didSelectedAtPosition:)]) {
        XFATItemView *item = (XFATItemView *)tapGestureRecognizer.view;
        [_delegate viewController:self didSelectedAtPosition:item.position];
    }
}


@end
