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
#define RJLog(...) NSLog(__VA_ARGS__)
#else
#define RJLog(...)
#endif
#import <UIKit/UIKit.h>

#endif /* PrefixHeader_pch */
#endif
//tabBarItem字体大小
#define AITabBarItemFont [UIFont systemFontOfSize:13]
// 导航栏标题的字体
#define AINavigationTitleFont [UIFont boldSystemFontOfSize:20]
