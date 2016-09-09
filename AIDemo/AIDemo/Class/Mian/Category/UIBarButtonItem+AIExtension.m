//
//  UIBarButtonItem+Extension.m
//  AISian
//
//  Created by 艾泽鑫 on 15/9/28.
//  Copyright © 2015年 aizexin. All rights reserved.
//

#import "UIBarButtonItem+AIExtension.h"
//#import "UIView+AIExtension.h"
@implementation UIBarButtonItem(AIExtension)
+(UIBarButtonItem*)itemWithTagert:(id)tagert action:(SEL)sel NorImageName:(NSString*)norImageName andHeiImageName:(NSString*)higImageName{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
  
    UIImage *norImage = [[UIImage imageNamed:norImageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    UIImage *higImage = [[UIImage imageNamed:higImageName]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    [btn setBackgroundImage:norImage forState:(UIControlStateNormal)];
    [btn setBackgroundImage:higImage forState:(UIControlStateHighlighted)];
    [btn addTarget:tagert action:sel forControlEvents:(UIControlEventTouchUpInside)];
    // 设置按钮的尺寸为背景图片的尺寸
//    btn.size = btn.currentBackgroundImage.size;
    btn.frame = (CGRect){0,0,btn.currentBackgroundImage.size};
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    return item;
}
@end
