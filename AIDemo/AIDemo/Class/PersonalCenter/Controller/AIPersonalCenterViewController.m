//
//  AIPersonalCenterViewController.m
//  AIDemo
//
//  Created by 艾泽鑫 on 16/9/9.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIPersonalCenterViewController.h"
#import <WebKit/WebKit.h>

@interface AIPersonalCenterViewController ()

@end

@implementation AIPersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(SEP);
    UIButton *switchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [switchButton addTarget:self action:@selector(switchColor) forControlEvents:UIControlEventTouchUpInside];
    [switchButton setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2.0)];
    switchButton.center = CGPointMake(self.view.center.x, self.view.center.y * 0.5);
    [switchButton setTitle:@"SwitchColor" forState:UIControlStateNormal];
    [switchButton dk_setTitleColorPicker:DKColorPickerWithKey(TINT) forState:UIControlStateNormal];
    [self.view addSubview:switchButton];
    
    [self buildUI];
}

#pragma mark ----UI
-(void) buildUI{
    
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height / 2.0, 50, 50  )];
    imageV.dk_imagePicker = DKImagePickerWithNames(@"normal", @"night", @"normal1");
    [self.view addSubview:imageV];
}

- (void)switchColor {
    if ([self.dk_manager.themeVersion isEqualToString:DKThemeVersionNight]) {
        [self.dk_manager dawnComing];
    } else {
        [self.dk_manager nightFalling];
    }
}

@end
