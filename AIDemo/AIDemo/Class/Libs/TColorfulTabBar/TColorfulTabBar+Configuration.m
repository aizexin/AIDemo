//
//  TColorfulTabBar+Configuration.m
//  2015-07-01-ColorfulTabBarAnimation
//
//  Created by TangJR on 7/2/15.
//  Copyright (c) 2015 tangjr. All rights reserved.
//

#import "TColorfulTabBar+Configuration.h"
#import "UIColor+STColorInit.h"

@implementation TColorfulTabBar (Configuration)

- (NSArray *)itemColors {
    
    return @[[UIColor colorWithHex:0xE13329], [UIColor colorWithHex:0x22BC55], [UIColor colorWithHex:0x2682D5]];
}

- (NSInteger)itemCount {
    
    return 3;
}

@end