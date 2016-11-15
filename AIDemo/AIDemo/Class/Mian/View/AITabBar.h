//
//  AITabBar.h
//  AI彩票
//
//  Created by 艾泽鑫 on 15/9/11.
//  Copyright (c) 2015年 艾泽鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AITabBarDelegate <NSObject>

-(void)tabBarJumpFrom:(NSInteger)from to:(NSInteger)to;

@end
@interface AITabBar : UITabBar
@property(nonatomic,weak)id<AITabBarDelegate> btnDelegate;


/**
 添加一个item

 @param imageNormalName    正常状态图标
 @param imageSelectedName  被选中图标
 @param title              title
 */
-(void)addTabBarWithNormaName:(NSString*)imageNormalName andImageSelectedName:(NSString*)imageSelectedName andTitle:(NSString*)title;

/**
 选中第几个0开始

 @param index 第几个
 */
- (void)selectIndex:(NSInteger)index;
@end
