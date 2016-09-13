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
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"001.pdf" ofType:nil];
//    WKWebView *webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
//    NSURL *url = [NSURL fileURLWithPath:path];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [webView loadRequest:request];
//    [self.view addSubview:webView];
//    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
//    self.view.backgroundColor = [UIColor clearColor];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    AILog(@"touch-----");
//    DKNightVersionManager *nightManager = [DKNightVersionManager sharedManager];
//    if ( nightManager.themeVersion == DKThemeVersionNight) {
//        nightManager.themeVersion = DKThemeVersionNormal;
//    } else {
//        nightManager.themeVersion = DKThemeVersionNight;
//    }
    if ([self.dk_manager.themeVersion isEqualToString:DKThemeVersionNight]) {
        [self.dk_manager dawnComing];
    } else {
        [self.dk_manager nightFalling];
    }
}

@end
