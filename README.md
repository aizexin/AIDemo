#AIDemo
<h3>这是一个使用三方库的demo，其中有夜间模式，放大圆圈转场，接入环信3.15实现单聊，自动隐藏navgationbar(可实现支付宝首页效果)
</h3>
[github] (https://github.com/aizexin/AIDemo) 
[简书] (http://www.jianshu.com/p/349a257eaba9)

----

+ [夜间模式](#夜间模式)
+ [放大转场动画](#放大转场动画)
+ [环信3.15单聊](#环信3.15单聊)
+ [图标3Dtouch](#图标3Dtouch)
+ [自动隐藏navgationbar](#自动隐藏navgationbar)

### 夜间模式
![夜间模式.gif](http://upload-images.jianshu.io/upload_images/1389261-6b8904cc4fe31fad.gif?imageMogr2/auto-orient/strip)
夜间模式我使用的是[DKNightVersion](https://github.com/Draveness/DKNightVersion)最新版本
设置颜色代码
```
self.view.dk_backgroundColorPicker = DKColorPickerWithKey(SEP);
```
设置图片
```
UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height / 2.0, 50, 50  )];
 imageV.dk_imagePicker = DKImagePickerWithNames(@"normal", @"night", @"normal1");
 [self.view addSubview:imageV];
```
其中SEP是`DKColorTable.txt`文件中的key。如果使用[CocoaPods](https://cocoapods.org/) 导入，需要把`DKColorTable.txt`文件拖到你工程里。想了解跟多了解可以看[成熟的夜间模式解决方案](http://draveness.me/night/)

### 放大转场动画
![放大专场动画.gif](https://github.com/aizexin/AIDemo/blob/master/AIDemo/AIDemo/GIF/放大专场动画.gif)
简单说就是重写`UINavigationControllerDelegate`协议里的方法返回一个自己定义的专场动画
  ```
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    
    return (id)[AITransitionAnimator new];
}
```
下面是动画的实现
```
//得到登录按钮
    UIButton *btn = keepView.loginButton;
    
    [containerView addSubview:toVC.view];
    
    UIBezierPath *originPath = [UIBezierPath bezierPathWithOvalInRect:btn.frame];
    CGPoint extremePoint = CGPointMake(btn.center.x - 0, btn.center.y );//- CGRectGetHeight(toVC.view.bounds));
    
    float radius = sqrtf(extremePoint.x * extremePoint.x + extremePoint.y * extremePoint.y);
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(btn.frame, -radius, -radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = finalPath.CGPath;
    toVC.view.layer.mask = maskLayer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id _Nullable)(originPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(finalPath.CGPath);
    animation.duration = [self transitionDuration:transitionContext];
    animation.delegate = self;
    [maskLayer addAnimation:animation forKey:@"path"];
```
详细的可以看[HenryCheng](http://www.jianshu.com/p/8c29fce5a994)的简书

# 环信3.15单聊
![聊天.gif](http://upload-images.jianshu.io/upload_images/1389261-d9113c46c119a80b.gif?imageMogr2/auto-orient/strip)
导入[环信](http://docs.easemob.com/im/start)这些基本步骤我就不在这阐述了,目前的官方文档还没有跟新很多方法都没有了。我们直接导入`AppDelegate+EaseMob.h`。然后在`AppDelegate`里加入
```
//环信
    [self easemobApplication:application
didFinishLaunchingWithOptions:launchOptions
                      appkey:@"guozhongkeji#ckddemo"
                apnsCertName:@"zhengshu"
                 otherConfig:nil];
    //  登录
    EMError *error                                  = [[EMClient sharedClient] loginWithUsername:@"text001" password:@"111"];
    if (!error) {
        NSLog(@"登录成功");
    }
```
`appkey`和`apnsCertName`当然填写自己的。
下一步把环信官方[demo](http://www.easemob.com/download/im)中的`EaseUI`整个文件夹复制到你的工程下。你的单聊页面只需要继承`EaseUI`里的`EaseMessageViewController`，然后初始化的时候设置接收信息人的ID，`push`过去就成功了！

```
//text002换成自己要发信息人的ID,注册在环信开发者中心-->我的应用 IM用户注册就可以
AIChatSingleViewController *vc = [[AIChatSingleViewController alloc] initWithConversationChatter:@"text002" conversationType:EMConversationTypeChat];
```
这时候你已经可以聊天了，但是点击表情的时候回发生崩溃。解决方在`EaseMessageViewController`这个文件中的`viewdidload`方法最后加入
```
/**
  *  修复环信表情崩溃   
  */    
EaseEmotionManager * manager = [[EaseEmotionManager alloc] initWithType:EMEmotionDefault emotionRow:3 emotionCol:7 emotions:[EaseEmoji allEmoji]];
    [self.faceView setEmotionManagers:@[manager]];
```
# 图标3Dtouch
设置图标
```
- (void)setup3DTouch
{
    UIApplicationShortcutIcon *icon1                = [UIApplicationShortcutIcon iconWithTemplateImageName:@"fx_3DTouch_AdorableStar"];
    UIApplicationShortcutIcon *icon2                = [UIApplicationShortcutIcon iconWithTemplateImageName:@"fx_3DTouch_Search_brand"];
    UIApplicationShortcutIcon *icon3                = [UIApplicationShortcutIcon iconWithTemplateImageName:@"fx_3DTouch_Receipt_of_goods"];
    UIApplicationShortcutIcon *icon4                = [UIApplicationShortcutIcon iconWithTemplateImageName:@"fx_3DTouch_Star_Ticket"];

    UIMutableApplicationShortcutItem *item1         = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.51fanxing.adorableStar" localizedTitle:@"萌星说" localizedSubtitle:nil icon:icon1 userInfo:nil];
    UIMutableApplicationShortcutItem *item2         = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.51fanxing.searchBrand" localizedTitle:@"搜品牌" localizedSubtitle:nil icon:icon2 userInfo:nil];
    UIMutableApplicationShortcutItem *item3         = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.51fanxing.receiptOfGoods" localizedTitle:@"查物流" localizedSubtitle:nil icon:icon3 userInfo:nil];
    UIMutableApplicationShortcutItem *item4         = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.51fanxing.starTicket" localizedTitle:@"摇星券" localizedSubtitle:nil icon:icon4 userInfo:nil];

    NSArray *items                                  = @[item1, item2, item3,item4];
    NSArray *existingItems                          = [UIApplication sharedApplication].shortcutItems;
    NSArray *updatedItems                           = [existingItems arrayByAddingObjectsFromArray:items];
    [UIApplication sharedApplication].shortcutItems = updatedItems;
}
```
通过3Dtouch进来的时候
```
/**
 *  通过3dtouch图标点进来的时候
 *
 *  @param application       <#application description#>
 *  @param shortcutItem      <#shortcutItem description#>
 *  @param completionHandler <#completionHandler description#>
 */
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler
{
    [AIChooseRootVCTool chooseVCWithShortcutItem:shortcutItem];
}
```
#自动隐藏navgationbar
![隐藏navgationbar.gif](http://upload-images.jianshu.io/upload_images/1389261-fb3046ee98244602.gif?imageMogr2/auto-orient/strip)
实际上他不是隐藏`navgationbar`而是自定义的一个`view`
```
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
```
设置最小高度改变这个值就可以`myBar.minimumBarHeight = 50.0;`
详细的可以看[BLKFlexibleHeightBar](https://github.com/bryankeller/BLKFlexibleHeightBar)
