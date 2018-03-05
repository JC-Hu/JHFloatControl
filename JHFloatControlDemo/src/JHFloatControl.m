//
//  JHFloatControl.m
//  Demo
//
//  Created by JasonHu on 2017/10/24.
//  Copyright © 2017年 JasonHu. All rights reserved.
//

#import "JHFloatControl.h"
#import "UIView+JHFCShortcut.h"
#import "Masonry.h"
#import "XFAssistiveTouch.h"
#import "JHFCViewController.h"


@interface JHFloatControl()<XFXFAssistiveTouchDelegate, JHFCViewControllerDelegate>

@property (nonatomic, assign) BOOL isMenuOpen;

@property (nonatomic, strong) UIImageView *iconImageView;



@end

@implementation JHFloatControl

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    XFAssistiveTouch *assistiveTouch = [XFAssistiveTouch sharedInstance];
    assistiveTouch.delegate = self;
}

- (void)showWithItems:(NSArray<__kindof JHFCItemsModel *> *)items
{
// root
    [self show];
}

- (void)show
{
    XFAssistiveTouch *assistiveTouch = [XFAssistiveTouch sharedInstance];

    [assistiveTouch showAssistiveTouch];
}

- (void)dismiss
{
    XFAssistiveTouch *assistiveTouch = [XFAssistiveTouch sharedInstance];

    [assistiveTouch.assistiveWindow resignKeyWindow];
    assistiveTouch.assistiveWindow = nil;
}

//- (void)tapGRAction:(id)sender
//{
//    [self openMenu];
//}
//
//- (void)windowTapGRAction:(id)sender
//{
//    [self closeMenu];
//}


- (void)pushToItems:(NSArray <__kindof JHFCItemsModel *>*)items fromItemView:(XFATItemView *)itemView
{
    NSArray *itemViewArray = [JHFCItemsModel convertToXFATItemViewArrayFromArray: items];
    
    
    JHFCViewController *vc = [[JHFCViewController alloc] initWithItems:itemViewArray];
    vc.delegate = self;
    [[XFAssistiveTouch sharedInstance].navigationController pushViewController:vc atPisition:itemView.position];
}

- (void)popAnimated:(BOOL)animated
{
    
}



#pragma mark - XFXFAssistiveTouchDelegate

- (NSInteger)numberOfItemsInViewController:(XFATViewController *)viewController {
    return 8;
}

- (XFATItemView *)viewController:(XFATViewController *)viewController itemViewAtPosition:(XFATPosition *)position {
    
    return [[JHFCItemsModel convertToXFATItemViewArrayFromArray: [self testItemArray]] objectAtIndex:position.index];
    
}

- (NSArray *)testItemArray
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < 8; i++) {
        
        JHFCItemsModel *item = [[JHFCItemsModel alloc] init];
        item.image = [UIImage imageNamed:@"floatControlIcon"];
        item.name = [NSString stringWithFormat:@"test%@",@(i)];
        [item setBlock:^(JHFCItemsModel *item) {
            [self pushToItems:[self testItemArray] fromItemView:item.itemView];
        }];
        
        [array addObject:item];
    }
    
    
    return array;
}

- (void)viewController:(XFATViewController *)viewController didSelectedAtPosition:(XFATPosition *)position {
    
    XFATItemView *itemView = [viewController.items objectAtIndex:position.index];
    
    if (itemView.itemModel.block) {
        itemView.itemModel.itemView = itemView;
        itemView.itemModel.block(itemView.itemModel);
    }


}


#pragma mark - Setter


#pragma mark - Getter

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"floatControlIcon"]];
    }
    return _iconImageView;
}

@end
