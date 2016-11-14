//
//  TabBarViewController.m
//  Day2UP
//
//  Created by ramborange on 2016/11/3.
//  Copyright © 2016年 Rambos. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "FriendViewController.h"
#import "MeViewController.h"
#import "PublishViewController.h"
#import "NewViewController.h"
#import "BaseNavigationController.h"
#import "SubLBXScanViewController.h"
#import "PublishDetailController.h"
@interface TabBarViewController () <UITabBarControllerDelegate>

@property (nonatomic, strong) UIVisualEffectView *bgView;

@end

@implementation TabBarViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBar setBarTintColor:[UIColor whiteColor]];
        [self.tabBar setTintColor:[UIColor blackColor]];
        [self.tabBar setTranslucent:NO];
    }
    self.delegate = self;
    [self.tabBar setBackgroundImage:[UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"tabbar-light" ofType:@"png"]]];
    return self;
}

#pragma mark - UITabBarViewController Delegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    UINavigationController *nav = (UINavigationController *)viewController;
    
    UIButton *pubBtn = [self.view viewWithTag:10010];
    if ([nav.jk_rootViewController isKindOfClass:[PublishViewController class]]) {
        [pubBtn setSelected:YES];
    }else {
        [pubBtn setSelected:NO];
    }
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    UINavigationController *nav = (UINavigationController *)viewController;
    if ([nav.jk_rootViewController isKindOfClass:[PublishViewController class]]) {
        return NO;
    }
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController *home = [[HomeViewController alloc] init];
    BaseNavigationController *homeNav = [[BaseNavigationController alloc] initWithRootViewController:home];
    
    FriendViewController *fri = [[FriendViewController alloc] init];
    BaseNavigationController *friNav = [[BaseNavigationController alloc] initWithRootViewController:fri];
    
    PublishViewController *pub = [[PublishViewController alloc] init];
    BaseNavigationController *pubNav = [[BaseNavigationController alloc] initWithRootViewController:pub];
    
    NewViewController *new = [[NewViewController alloc] init];
    BaseNavigationController *newNav = [[BaseNavigationController alloc] initWithRootViewController:new];
    
    MeViewController *me = [[MeViewController alloc] init];
    BaseNavigationController *meNav = [[BaseNavigationController alloc] initWithRootViewController:me];
    
    
    [self setViewControllers:@[homeNav,friNav,pubNav,newNav,meNav] animated:YES];
    [self setSelectedIndex:0];
    
    NSArray *items = self.tabBar.items;
    NSArray *imgs = @[@"tabBar_essence_icon",@"tabBar_friendTrends_icon",@"tabBar_publish_icon",@"tabBar_new_icon",@"tabBar_me_icon"];
    NSArray *selectedImgs = @[@"tabBar_essence_click_icon",@"tabBar_friendTrends_click_icon",@"tabBar_publish_click_icon",@"tabBar_new_click_icon",@"tabBar_me_click_icon"];
    NSInteger cnt = 0;
    for (UITabBarItem *item in items) {
        [item setTitle:@[@"首页",@"好友",@"发布",@"消息",@"我的"][cnt]];
        if (cnt==2) {
//            _bgView = [[UIView alloc] init];
            UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
            //  毛玻璃view 视图
            _bgView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
            _bgView.alpha = 0.9;
            _bgView.hidden = YES;
            [self.view addSubview:_bgView];
            __weak __typeof(self)weakself = self;
            _bgView.sd_layout
            .leftEqualToView(weakself.view)
            .rightEqualToView(weakself.view)
            .topEqualToView(weakself.view)
            .bottomEqualToView(weakself.view);
            
            YYLabel *titleLabel = [UIHelper getLabelWithText:@"主标题提示语在这儿" textColor:[UIColor whiteColor] font:Header_font bgColor:[UIColor clearColor] textAlign:NSTextAlignmentLeft corRadius:0];
            YYLabel *infoLabel1 = [UIHelper getLabelWithText:@" [图标1]\t信息提示框1" textColor:[UIColor blackColor] font:Normal_font bgColor:[UIColor whiteColor] textAlign:NSTextAlignmentLeft corRadius:3];
            YYLabel *infoLabel2 = [UIHelper getLabelWithText:@" [图标2]\t信息提示框2" textColor:[UIColor blackColor] font:Normal_font bgColor:[UIColor whiteColor] textAlign:NSTextAlignmentLeft corRadius:3];
            [self.bgView addSubview:titleLabel];
            [self.bgView addSubview:infoLabel1];
            [self.bgView addSubview:infoLabel2];
            
            titleLabel.sd_layout
            .topSpaceToView(weakself.bgView,80)
            .leftSpaceToView(weakself.bgView,20)
            .rightSpaceToView(weakself.bgView,20)
            .heightIs(20);
            
            infoLabel1.sd_layout
            .topSpaceToView(titleLabel,20)
            .leftSpaceToView(weakself.bgView,20)
            .rightSpaceToView(weakself.bgView,20)
            .heightIs(50);
            
            infoLabel2.sd_layout
            .topSpaceToView(infoLabel1,10)
            .leftSpaceToView(weakself.bgView,20)
            .rightSpaceToView(weakself.bgView,20)
            .heightIs(50);
            
            UIButton *menuBtn1 = [UIHelper getButtonWithText:NULL textColor:[UIColor blackColor] font:Normal_font bgColor:[UIColor whiteColor] bgImg:[UIImage imageNamed:@"publish-picture"] corRadius:30];
            menuBtn1.tag = 10012;
            [_bgView addSubview:menuBtn1];
            
            UIButton *menuBtn2 = [UIHelper getButtonWithText:NULL textColor:[UIColor blackColor] font:Normal_font bgColor:[UIColor whiteColor] bgImg:[UIImage imageNamed:@"publish-text"] corRadius:30];
            menuBtn2.tag = 10013;
            [_bgView addSubview:menuBtn2];
            
            UIButton *menuBtn3 = [UIHelper getButtonWithText:NULL textColor:[UIColor blackColor] font:Normal_font bgColor:[UIColor whiteColor] bgImg:[UIImage imageNamed:@"publish-video"] corRadius:30];
            menuBtn3.tag = 10014;
            [_bgView addSubview:menuBtn3];
            [menuBtn1 addTarget:self action:@selector(menuBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [menuBtn2 addTarget:self action:@selector(menuBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [menuBtn3 addTarget:self action:@selector(menuBtnClicked:) forControlEvents:UIControlEventTouchUpInside];

            
            menuBtn2.sd_layout
            .widthIs(60)
            .heightIs(60)
            .bottomSpaceToView(weakself.bgView,80)
            .centerXEqualToView(weakself.bgView);
            
            menuBtn1.sd_layout
            .widthIs(60)
            .heightIs(60)
            .bottomSpaceToView(weakself.bgView,80)
            .rightSpaceToView(menuBtn2,40);
            
            menuBtn3.sd_layout
            .widthIs(60)
            .heightIs(60)
            .bottomSpaceToView(weakself.bgView,80)
            .leftSpaceToView(menuBtn2,40);
            
            UIButton *pubBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [pubBtn setBackgroundImage:[UIImage imageNamed:imgs[2]] forState:UIControlStateNormal];
//            [pubBtn setBackgroundImage:[UIImage imageNamed:selectedImgs[2]] forState:UIControlStateSelected];
            pubBtn.tag = 10010;
            [self.tabBar addSubview:pubBtn];
            
            UIButton *pubBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
            [pubBtn2 setBackgroundImage:[UIImage imageNamed:imgs[2]] forState:UIControlStateNormal];
            pubBtn2.tag = 11010;
            [_bgView addSubview:pubBtn2];
            [pubBtn2 addTarget:self action:@selector(pubBtnClicked) forControlEvents:UIControlEventTouchUpInside];
            UIView *view2 = self.bgView;
            pubBtn2.sd_layout
            .widthIs(55)
            .heightIs(55)
            .centerXEqualToView(view2)
            .bottomSpaceToView(view2,12);

            UIView *view = self.tabBar;
            pubBtn.sd_layout
            .widthIs(55)
            .heightIs(55)
            .centerXEqualToView(view)
            .bottomSpaceToView(view,12);
            [pubBtn setAdjustsImageWhenHighlighted:NO];
            [pubBtn addTarget:self action:@selector(pubBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        }else {
            [item setImage:[UIImage imageNamed:imgs[cnt]]];
            [item setSelectedImage:[UIImage imageNamed:selectedImgs[cnt]]];
        }
        cnt++;
    }
}

//menu btn clicked
- (void)menuBtnClicked:(UIButton *)btn {
    NSInteger idx = btn.tag-10012;
    PublishDetailController *vc = [[PublishDetailController alloc] init];
    NSString *title;
    if (idx==0) {
        title = @"发布图片";
    }else if (idx==1) {
        title = @"发布文字";
    }else {
        title = @"发布视频";
    }
    vc.navTitle = title;
    [self presentViewController:vc animated:YES completion:nil];

    [self pubBtnClicked];
}

- (void)pubBtnClicked {
    [self.view bringSubviewToFront:_bgView];
    UIButton *btn1 = [self.view viewWithTag:11010];
    UIButton *btn2 = [self.view viewWithTag:10010];

    [btn1.layer removeAnimationForKey:@"Animation"];
    [btn2.layer removeAnimationForKey:@"Animation"];

    [self.bgView.layer removeAnimationForKey:@"pAnimation"];
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    transformAnima.removedOnCompletion = NO;
    transformAnima.fillMode = kCAFillModeForwards;
    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *opacityAnima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnima.removedOnCompletion = NO;
    opacityAnima.fillMode = kCAFillModeForwards;
    opacityAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    if (!btn2.isSelected) {
        [btn2 setSelected:YES];
        [self.bgView setHidden:NO];
       
        transformAnima.fromValue = @(0);
        transformAnima.toValue = @(M_PI_4);
        
        opacityAnima.fromValue = @(0.0);
        opacityAnima.toValue  = @(0.9);
        
        [self showMenuView];        
    }else {
        [btn2 setSelected:NO];
        [self.bgView setHidden:YES];
        
        transformAnima.fromValue = @(M_PI_4);
        transformAnima.toValue = @(0);
        
        opacityAnima.fromValue = @(0.9);
        opacityAnima.toValue  = @(0.0);
        
        [self hideMenuView];
    }
    
    [btn1.layer addAnimation:transformAnima forKey:@"Animation"];
    [btn2.layer addAnimation:transformAnima forKey:@"Animation"];

    [self.bgView.layer addAnimation:opacityAnima forKey:@"pAnimation"];
}

- (void)showMenuView {
    UIButton *btn1 = [self.view viewWithTag:10012];
    UIButton *btn2 = [self.view viewWithTag:10013];
    UIButton *btn3 = [self.view viewWithTag:10014];
    CGPoint centerA1 = CGPointMake(btn1.center.x, self.view.bounds.size.height-80-30);
    CGPoint centerA2 = CGPointMake(btn2.center.x, self.view.bounds.size.height-80-30);
    CGPoint centerA3 = CGPointMake(btn3.center.x, self.view.bounds.size.height-80-30);
    CGPoint centerB1 = CGPointMake(btn1.center.x, self.view.bounds.size.height+30);
    CGPoint centerB2 = CGPointMake(btn2.center.x, self.view.bounds.size.height+30);
    CGPoint centerB3 = CGPointMake(btn3.center.x, self.view.bounds.size.height+30);

    btn1.center =  centerB1;
    btn2.center =  centerB2;
    btn3.center =  centerB3;

    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        btn1.center = centerA1;
        btn2.center = centerA2;
        btn3.center = centerA3;
    } completion:NULL];
}

- (void)hideMenuView {
    UIButton *btn1 = [self.view viewWithTag:10012];
    UIButton *btn2 = [self.view viewWithTag:10013];
    UIButton *btn3 = [self.view viewWithTag:10014];
    CGPoint center1 = CGPointMake(btn1.center.x, self.view.bounds.size.height+30);
    CGPoint center2 = CGPointMake(btn2.center.x, self.view.bounds.size.height+30);
    CGPoint center3 = CGPointMake(btn3.center.x, self.view.bounds.size.height+30);

    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        btn1.center = center1;
        btn2.center = center2;
        btn3.center = center3;
    } completion:NULL];
    
}

- (BOOL)shouldAutorotate  {
//    NSLog(@"111---shouldAutorotate");
    BaseNavigationController *nav = self.selectedViewController;
    UIViewController *vc = nav.topViewController;
//    NSLog(@"%@",[vc class]);
    if ([vc isKindOfClass:[SubLBXScanViewController class]]) {
        return NO;
    }
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    NSLog(@"111--supportedInterfaceOrientations");
    BaseNavigationController *nav = self.selectedViewController;
    UIViewController *vc = nav.topViewController;
    if ([vc isKindOfClass:[SubLBXScanViewController class]]) {
        return UIInterfaceOrientationMaskPortrait;
    }
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

// Returns interface orientation masks.
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    NSLog(@"111--preferredInterfaceOrientationForPresentation");
    return UIInterfaceOrientationPortrait;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
