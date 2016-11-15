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
@property(weak,nonatomic)AITabBarButton *disEnableBtn;

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

-(void)addTabBarWithNormaName:(NSString*)imageNormalName andImageDisEnableName:(NSString*)imageDisEnableName{
    AITabBarButton *btn  = [[AITabBarButton alloc]init];
    //设置正常图片
    UIImage *normalImage = [[UIImage imageNamed:imageNormalName]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    [btn setImage:normalImage forState:(UIControlStateNormal)];
    //被选中的图片
    UIImage *selImage    = [[UIImage imageNamed:imageDisEnableName]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    [btn setImage:selImage forState:(UIControlStateSelected)];
//    [btn setBackgroundImage:normalImage forState:(UIControlStateNormal)];
//    [btn setBackgroundImage:selImage forState:(UIControlStateDisabled)];
    [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:(UIControlEventTouchDown)];
     [self addSubview:btn];
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

}
- (void)btnOnClick:(AITabBarButton*)btn{
    [_disEnableBtn setEnabled:YES];
    [btn setEnabled:NO];
    _disEnableBtn = btn;
    if ([self.btnDelegate respondsToSelector:@selector(tabBarJumpFrom:to:)]) {
        [_btnDelegate tabBarJumpFrom:_disEnableBtn.tag to:btn.tag];
    }
}




@end
