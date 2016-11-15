//
//  AITabBar.m
//  AI彩票
//
//  Created by 艾泽鑫 on 15/9/11.
//  Copyright (c) 2015年 艾泽鑫. All rights reserved.
//

#import "AITabBar.h"
#import "AITabBarButton.h"

@interface AITabBar ()<UITabBarDelegate>

/**
 上一个被选中的按钮
 */
@property(weak,nonatomic)AITabBarButton *lastBtn;

@property (assign, nonatomic) NSInteger fromeIndex; ///< tabbar之前选中的index
@property (assign, nonatomic) NSInteger toIndex; ///< tabbar即将选中的index

/** 装按钮*/
@property(nonatomic,strong)NSMutableArray<AITabBarButton*> *itemArrayM;

@end
@implementation AITabBar

#pragma mark -- lazy
-(NSMutableArray<AITabBarButton *> *)itemArrayM{
    if (!_itemArrayM) {
        _itemArrayM = [NSMutableArray array];
    }
    return _itemArrayM;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

-(void)addTabBarWithNormaName:(NSString*)imageNormalName andImageDisEnableName:(NSString*)imageDisEnableName andTitle:(NSString*)title{
    AITabBarButton *btn  = [[AITabBarButton alloc]init];
    //设置正常图片
    UIImage *normalImage = [[UIImage imageNamed:imageNormalName]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    [btn setImage:normalImage forState:(UIControlStateNormal)];
    //被选中的图片
    UIImage *selImage    = [[UIImage imageNamed:imageDisEnableName]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    [btn setImage:selImage forState:(UIControlStateSelected)];

    [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:(UIControlEventTouchDown)];
    
    //设置title
    [btn setTitle:title forState:(UIControlStateSelected)];

    [self addSubview:btn];
    //添加到自己记录的btnArray里面
    [self.itemArrayM addObject:btn];
}

/**
 *  子视图发生改变的时候调用
 */
-(void)layoutSubviews{
    for (int i = 0; i < self.itemArrayM.count; i++) {
        AITabBarButton *btn = self.itemArrayM[i];
        CGFloat btnW = self.frame.size.width /self.itemArrayM.count;
        CGFloat btnH = self.frame.size.height;
        CGFloat btnX = i * btnW;
        CGFloat btnY = 0;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.tag   = i;
        
    }
    for (id item in self.subviews) {
        if ([item isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [item removeFromSuperview];
        }
    }

}
- (void)btnOnClick:(AITabBarButton*)btn{
    
    if (!btn.isSelected) {
        btn.selected      = YES;
        _lastBtn.selected = NO;
        _lastBtn          = btn;
        if ([self.btnDelegate respondsToSelector:@selector(tabBarJumpFrom:to:)]) {
            [_btnDelegate tabBarJumpFrom:_lastBtn.tag to:btn.tag];
        }
    }
}




@end
