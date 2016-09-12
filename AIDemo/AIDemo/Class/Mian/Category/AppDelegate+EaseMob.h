//
//  AppDelegate+EaseMob.h
//  CKD2.0
//
//  Created by JmoVxia on 16/9/11.
//  Copyright © 2016年 JmoVxia. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (EaseMob)

- (void)easemobApplication:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
                    appkey:(NSString *)appkey
              apnsCertName:(NSString *)apnsCertName
               otherConfig:(NSDictionary *)otherConfig;

@end
