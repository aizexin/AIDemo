//
//  UIBarButtonItem+Extension.h
//  AISian
//
//  Created by 艾泽鑫 on 15/9/28.
//  Copyright © 2015年 aizexin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem(Extension)

+(UIBarButtonItem*)itemWithTagert:(id)tagert action:(SEL)sel NorImageName:(NSString*)norImageName andHeiImageName:(NSString*)higImageName;
@end
