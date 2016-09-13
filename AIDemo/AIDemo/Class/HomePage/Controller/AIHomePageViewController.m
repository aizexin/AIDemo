//
//  AIHomePageViewController.m
//  AIDemo
//
//  Created by 艾泽鑫 on 16/9/9.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIHomePageViewController.h"
#import <BLKFlexibleHeightBar/BLKFlexibleHeightBar.h>
#import "BLKDelegateSplitter.h"
#import "SquareCashStyleBehaviorDefiner.h"
#import <DKNightVersion/DKNightVersion.h>
@interface AIHomePageViewController ()<UITableViewDelegate,UITableViewDataSource>

/** tabbeleview测试*/
@property(nonatomic,strong)UITableView *tabeleView;
@property (nonatomic) BLKDelegateSplitter *delegateSplitter;

@end

@implementation AIHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.5467 green:1.0 blue:0.8338 alpha:1.0];
//    [self.navigationController setAutomaticallyAdjustsScrollViewInsets:NO];
    self.navigationController.navigationBarHidden = YES;
    [self buildUI];

}

#pragma mark --------UI
/**
 *  创建UI
 */
- (void)buildUI{
    //tableview
    self.tabeleView = [[UITableView alloc]initWithFrame:self.view.frame style:(UITableViewStylePlain)];
    self.tabeleView.delegate = self;
    self.tabeleView.dataSource = self;
    self.tabeleView.rowHeight = 60.f;
    [self.view addSubview:self.tabeleView];
    //添加拉伸的bar
    [self setBLKbar];
    //设置夜间模式
}
//TODO: 还没有调用
- (void)setNight{
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    DKNightVersionManager *manager = [DKNightVersionManager sharedManager];
     manager.themeVersion = DKThemeVersionNormal;
}

-(void)setBLKbar{
    //添加拉伸的bar
    BLKFlexibleHeightBar *myBar = [[BLKFlexibleHeightBar alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 100.0)];
    myBar.minimumBarHeight = 50.0;
    myBar.backgroundColor = [UIColor colorWithRed:0.86 green:0.25 blue:0.23 alpha:1];
    [self.view addSubview:myBar];
    myBar.behaviorDefiner = [SquareCashStyleBehaviorDefiner new];
    
    [myBar.behaviorDefiner addSnappingPositionProgress:0.0 forProgressRangeStart:0.0 end:0.5];
    [myBar.behaviorDefiner addSnappingPositionProgress:1.0 forProgressRangeStart:0.5 end:1.0];
    myBar.behaviorDefiner.snappingEnabled = YES;
    myBar.behaviorDefiner.elasticMaximumHeightAtTop = YES;
    UILabel *label = [[UILabel alloc] init];
    label.text = @"TrendyStartup.io";
    label.font = [UIFont systemFontOfSize:25.0];
    label.textColor = [UIColor blueColor];
    [label sizeToFit];
    
    //文字动画开始状态
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *initialLayoutAttributes = [BLKFlexibleHeightBarSubviewLayoutAttributes new];
    initialLayoutAttributes.size = label.frame.size;
    initialLayoutAttributes.center = CGPointMake(CGRectGetMidX(myBar.bounds), CGRectGetMidY(myBar.bounds)+10.0);
    [label addLayoutAttributes:initialLayoutAttributes forProgress:0.0];
    
    // Create a final set of layout attributes based on the same values as the initial layout attributes
    //结束状态（推上去状态）
    BLKFlexibleHeightBarSubviewLayoutAttributes *finalLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] initWithExistingLayoutAttributes:initialLayoutAttributes];
    finalLayoutAttributes.alpha = 0.0;
    CGAffineTransform translation = CGAffineTransformMakeTranslation(0.0, -30.0);
    CGAffineTransform scale = CGAffineTransformMakeScale(0.2, 0.2);
    finalLayoutAttributes.transform = CGAffineTransformConcat(scale, translation);
    
    // This is what we want the bar to look like at its maximum height (progress == 0.0)
    [label addLayoutAttributes:finalLayoutAttributes forProgress:1.0];
    
    
    self.delegateSplitter = [[BLKDelegateSplitter alloc] initWithFirstDelegate:myBar.behaviorDefiner secondDelegate:self];
    self.tabeleView.delegate = (id<UITableViewDelegate>)self.delegateSplitter;
    [myBar addSubview:label];
}

#pragma mark -----tabeleViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

@end
