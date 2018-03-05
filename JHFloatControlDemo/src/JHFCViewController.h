//
//  JHFCViewController.h
//  JHFloatControlDemo
//
//  Created by JasonHu on 2017/11/7.
//  Copyright © 2017年 JasonHu. All rights reserved.
//

#import "XFATViewController.h"

@class JHFCViewController;

@protocol JHFCViewControllerDelegate <NSObject>

- (void)viewController:(JHFCViewController *)viewController didSelectedAtPosition:(XFATPosition *)position;

@end

@interface JHFCViewController : XFATViewController

@property (nonatomic, weak) id<JHFCViewControllerDelegate> delegate;

@end
