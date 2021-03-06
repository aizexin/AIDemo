//
//  AIChooseVCTool.h
//  AIDemo
//
//  Created by 艾泽鑫 on 16/9/9.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  用于选择根控制器

#import <Foundation/Foundation.h>

@interface AIChooseRootVCTool : NSObject

/**
 *  选择登录页面
 */
+(void) chooseLoginVC;

/**
 *  进入主页
 */
+(void) choose2Main;

/**
 *  通过3dtouch点进来的图标选择控制器
 *
 *  @param shortcutItem <#shortcutItem description#>
 */
+(void)chooseVCWithShortcutItem:(UIApplicationShortcutItem *)shortcutItem;
@end
