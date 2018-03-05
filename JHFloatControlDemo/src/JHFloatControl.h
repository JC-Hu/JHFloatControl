//
//  JHFloatControl.h
//  Demo
//
//  Created by JasonHu on 2017/10/24.
//  Copyright © 2017年 JasonHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHFCItemsModel.h"

@interface JHFloatControl : NSObject

@property (nonatomic, readonly, strong) UIImageView *iconImageView;


- (void)showWithItems:(NSArray <__kindof JHFCItemsModel *>*)items;
- (void)show;
- (void)dismiss;

- (void)pushToItems:(NSArray <__kindof JHFCItemsModel *>*)items fromItemView:(XFATItemView *)itemView;
- (void)popAnimated:(BOOL)animated;

//- (void)openMenu;
//- (void)closeMenu;

//- (void)reloadData;

@end
