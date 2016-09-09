//
//  UIImage+Extension.m
//  AISian
//
//  Created by 艾泽鑫 on 15/9/28.
//  Copyright © 2015年 aizexin. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage(Extension)
+(UIImage*)resizedImage:(NSString *)imageName{
    UIImage *bgImage = [UIImage imageNamed:imageName];
    return [bgImage stretchableImageWithLeftCapWidth:bgImage.size.width*0.5 topCapHeight:bgImage.size.height*0.5];
}
@end
