//
//  AILeftViewController.m
//  AIDemo
//
//  Created by 艾泽鑫 on 16/9/9.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AILeftViewController.h"
#import "MCLeftSliderManager.h"
#import "Macro.h"
//#import <DKNightVersion/DKNightVersion.h>
@interface AILeftViewController ()<UITableViewDelegate,UITableViewDataSource>
/**
 *  主要的tableView
 */
@property(nonatomic ,strong)UITableView *tableView;
@end

@implementation AILeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.5 green:0.0 blue:0.5 alpha:1.0]];
    [self buildUI];
    //设置夜间模式
    [self setNight];
}

/**
 *  创建UI
 */
-(void)buildUI{
    AILog(@"%@",NSStringFromCGRect(self.view.frame));
    //设置tableview
    self.tableView              = [[UITableView alloc]initWithFrame:self.view.frame style:(UITableViewStylePlain)];
    self.tableView.delegate     = self;
    self.tableView.dataSource   = self;
    [self.view addSubview:self.tableView];
    //夜间模式按钮
    UISwitch *lightButton = [UISwitch new];
    lightButton.frame = CGRectMake((kScreenWidth - kMainPageDistance)/2 +100, kScreenHeight - 50, 200, 44);
    [lightButton addTarget:self action:@selector(changeLight) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lightButton];
    
//    self.tableView.dk_backgroundColorPicker = DKColorPickerWithKey(SEP);

}

#pragma mark ---dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType          = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font         = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor        = [UIColor clearColor];
    cell.textLabel.textColor    = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    
    if (indexPath.row == 0) {
    cell.textLabel.text         = @"开通会员";
    } else if (indexPath.row == 1) {
    cell.textLabel.text         = @"QQ钱包";
    } else if (indexPath.row == 2) {
    cell.textLabel.text         = @"网上营业厅";
    } else if (indexPath.row == 3) {
    cell.textLabel.text         = @"个性装扮";
    } else if (indexPath.row == 4) {
    cell.textLabel.text         = @"我的收藏";
    } else if (indexPath.row == 5) {
    cell.textLabel.text         = @"我的相册";
    } else if (indexPath.row == 6) {
    cell.textLabel.text         = @"我的文件";
    }
    return cell;
}

#pragma mark ----delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [[MCLeftSliderManager sharedInstance].LeftSlideVC closeLeftView];//关闭左侧抽屉
//    MCOtherViewController *vc = [[MCOtherViewController alloc] init];
//    //    vc.titleName =
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    vc.titleName = cell.textLabel.text;
//    [[MCLeftSliderManager sharedInstance].mainNavigationController pushViewController:vc animated:NO];

}

#pragma mark ---设置夜间模式
-(void)changeLight{
    DKNightVersionManager *nightManager = [DKNightVersionManager sharedManager];
    if ( nightManager.themeVersion == DKThemeVersionNight) {
        nightManager.themeVersion = DKThemeVersionNormal;
    } else {
        nightManager.themeVersion = DKThemeVersionNight;
    }
}
/**
 *  配置夜间模式
 */
- (void)setNight{
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);

}



@end
