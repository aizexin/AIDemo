//
//  AITabBarButton.m
//  AI彩票
//
//  Created by 艾泽鑫 on 15/9/11.
//  Copyright (c) 2015年 艾泽鑫. All rights reserved.
//

#import "AITabBarButton.h"
#define btnW self.frame.size.width
#define btnH self.frame.size.height
@implementation AITabBarButton

#pragma mark --Over
-(void)setHighlighted:(BOOL)highlighted{
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.currentTitle == nil) {
        return [super imageRectForContentRect:contentRect];
    }
    return CGRectMake(0.5*(btnW - self.currentImage.size.width), 2, self.currentImage.size.width, self.currentImage.size.height);//图片的位置大小
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (self.currentTitle == nil) {
        return [super titleRectForContentRect:contentRect];
    }
    return CGRectMake(0, self.currentImage.size.height, btnW, btnH - self.currentImage.size.height);//文本的位置大小
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font          = [UIFont fontWithName:@"Avenir-Medium"size:12.];
        //设置默认title颜色为black
        [self setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
        [self setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        self.contentVerticalAlignment   = UIControlContentVerticalAlignmentCenter;
    }
    return self;
}

#pragma mark --private
-(void)setUp{
    [self addTarget:self action:@selector(scaleToSmall)
   forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    [self addTarget:self action:@selector(scaleAnimation)
   forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(scaleToDefault)
   forControlEvents:UIControlEventTouchDragExit];
}


- (void)scaleToSmall
{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.95f, 0.95f)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSmallAnimation"];
}

- (void)scaleAnimation
{
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(2.f, 2.f)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleAnimation.springBounciness = 8.0f;
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
}

- (void)scaleToDefault
{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleDefaultAnimation"];
}

@end
