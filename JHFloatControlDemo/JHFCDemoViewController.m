//
//  JHFCDemoViewController.m
//  Demo
//
//  Created by JasonHu on 2017/10/24.
//  Copyright © 2017年 JasonHu. All rights reserved.
//

#import "JHFCDemoViewController.h"

#import "JHFloatControl.h"
#import "UIView+JHFCShortcut.h"
#import "JHCameraFloatView.h"

@interface JHFCDemoViewController ()

@property (nonatomic, strong) JHFloatControl *control;

@end

@implementation JHFCDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.view.backgroundColor = [UIColor redColor];
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];;
    testView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:testView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test"]];
    [self.view addSubview:imageView];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    button.center = self.view.center;
    
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        JHFloatControl *control = [[JHFloatControl alloc] init];
        
        [control show];
        
        self.control = control;
        
//        JHCameraFloatView *camera = [[JHCameraFloatView alloc] initWithFrame:CGRectZero];
//        camera.size = CGSizeMake(100, 180);
//        camera.center = self.view.center;
//        
//        camera.blurContentView.layer.contents = (id)[UIImage imageNamed:@"test"].CGImage;
////        camera.blurEffect = NO;
//        
//        [camera show];
    });
    
}

- (void)buttonAction:(id)sender
{
    [self.control dismiss];
}

@end
