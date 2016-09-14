//
//  AIHeaderPch.h
//  AIDemo
//
//  Created by 艾泽鑫 on 16/9/8.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#ifndef AIHeaderPch_h

#define AIHeaderPch_h
/**
 *  如果是OC中的全部写在这里边，如果是C语言或者其他，就写在外边
 */
#ifdef __OBJC__
#ifdef DEBUG//调试阶段的log
#define AILog(...) NSLog(__VA_ARGS__)
#else
#define AILog(...)
#endif
#import <UIKit/UIKit.h>
#import <DKNightVersion/DKNightVersion.h>

#endif /* PrefixHeader_pch */
#endif
//tabBarItem字体大小
#define AITabBarItemFont [UIFont systemFontOfSize:13]
// 导航栏标题的字体
#define AINavigationTitleFont [UIFont boldSystemFontOfSize:20]
// 随机色
#define AIRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
//环信相关
#define AILoginEMCount @"text001"
#define AILoginEMPassWord @"111"
#define AIEM2Count @"qq"
