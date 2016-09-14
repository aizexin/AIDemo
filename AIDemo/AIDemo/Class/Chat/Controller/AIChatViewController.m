//
//  AIChatViewController.m
//  AIDemo
//
//  Created by 艾泽鑫 on 16/9/9.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIChatViewController.h"
#import "AIChatSingleViewController.h"
@interface AIChatViewController ()

@end

@implementation AIChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    AILog(@"ceshi");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    AIChatSingleViewController *vc = [[AIChatSingleViewController alloc] initWithConversationChatter:@"text002" conversationType:EMConversationTypeChat];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
