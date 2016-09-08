//
//  AIHeaderPch.h
//  AIDemo
//
//  Created by 艾泽鑫 on 16/9/8.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#ifndef AIHeaderPch_h
#define AIHeaderPch_h

#ifdef DEBUG//调试阶段的log
#define RJLog(...) NSLog(__VA_ARGS__)
#else
#define RJLog(...)
#endif
#endif /* PrefixHeader_pch */
