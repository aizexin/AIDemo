//
//  AILoginViewController.m
//  AIDemo
//
//  Created by 艾泽鑫 on 16/9/12.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//  登录页面

#import "AILoginViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "AIChooseRootVCTool.h"

#import "MCLeftSlideViewController.h"
#import "AILeftViewController.h"
#import "AIMainTabbarViewController.h"
@interface AILoginViewController ()<KeepNewFeatrueViewDelegate>
/** 视频播放*/
@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;

@end

@implementation AILoginViewController

#pragma mark -lazy
- (MPMoviePlayerController *)moviePlayerController
{
    if (!_moviePlayerController) {
        
        _moviePlayerController = [[MPMoviePlayerController alloc] init];
        
        [_moviePlayerController setShouldAutoplay:YES];
        
        _moviePlayerController.movieSourceType = MPMovieSourceTypeFile;
        [_moviePlayerController setFullscreen:YES];
        
        [_moviePlayerController setRepeatMode:MPMovieRepeatModeOne];
        _moviePlayerController.controlStyle = MPMovieControlStyleNone;
        _moviePlayerController.view.frame = [UIScreen mainScreen].bounds;
        
        [self.view addSubview:self.moviePlayerController.view];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
        
    }
    return _moviePlayerController;
}

- (KeepNewFeatrueView *)keepView
{
    if (!_keepView) {
        _keepView = [[KeepNewFeatrueView alloc] init];
        _keepView.delegate = self;
        _keepView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        [self.moviePlayerController.view addSubview:_keepView];
    }
    return _keepView;
}

- (void)playbackStateChanged
{
    MPMoviePlaybackState playbackState = [self.moviePlayerController playbackState];
    if (playbackState == MPMoviePlaybackStateStopped || playbackState == MPMoviePlaybackStatePaused) {
        [self.moviePlayerController play];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"BridgeLoop" ofType:@"mp4"];
    
    self.moviePlayerController.contentURL = [[NSURL alloc] initFileURLWithPath:moviePath];
    
    [self.moviePlayerController play];
    
    [self.moviePlayerController.view bringSubviewToFront:self.keepView];
}

#pragma mark - KeepNewFeatrueViewDelegate
// 登录
- (void)keepNewFeatrueView:(nullable KeepNewFeatrueView *)keepNewFeatrueView didLogin:(nullable UIButton *)loginButton
{
    //左边控制器
    AILeftViewController *leftVC = [[AILeftViewController alloc]init];
    //tabbar
    AIMainTabbarViewController *tabVC = [[AIMainTabbarViewController alloc]init];
    MCLeftSlideViewController *rootVC = [[MCLeftSlideViewController alloc] initWithLeftView:leftVC andMainView:tabVC];
    [self.navigationController pushViewController:rootVC animated:YES];
}
// 注册
- (void)keepNewFeatrueView:(nullable KeepNewFeatrueView *)keepNewFeatrueView didRegister:(nullable UIButton *)registerButton{
   
}

@end
