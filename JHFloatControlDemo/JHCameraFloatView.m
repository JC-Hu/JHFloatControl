//
//  JHCameraFloatView.m
//  Demo
//
//  Created by JasonHu on 2017/10/24.
//  Copyright © 2017年 JasonHu. All rights reserved.
//

#import "JHCameraFloatView.h"

@implementation JHCameraFloatView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self config];
        
    }
    return self;
}

- (void)config
{
    self.blurEffect = YES;
    self.effectView.alpha = .9;
}

@end
