//
//  BaseViewController.m
//  Day2UP
//
//  Created by ramborange on 2016/11/11.
//  Copyright © 2016年 Rambos. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) YYLabel *titleLabel;

@end

@implementation BaseViewController
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpNavView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)setNavTitle:(NSString *)navTitle {
    _titleLabel.text = navTitle;
}

- (void)setUpNavView {
    UIView *navView = [[UIView alloc] init];
    navView.backgroundColor = [UIColor whiteColor];
    [navView setLayerShadow:RGBA(216, 216, 216, 1) offset:CGSizeMake(0, 0.5) radius:1.0];
    [self.view addSubview:navView];

    _titleLabel = [UIHelper getLabelWithText:@"" textColor:[UIColor blackColor] font:Header_font bgColor:[UIColor clearColor] textAlign:NSTextAlignmentCenter corRadius:0];
    [navView addSubview:_titleLabel];
    
    UIButton *backBtn = [UIHelper getButtonWithText:@"返回" textColor:Theme_color font:Large_font bgColor:[UIColor clearColor] bgImg:NULL corRadius:0];
//    backBtn.backgroundColor = [UIColor lightGrayColor];
    [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"]  forState:UIControlStateNormal];
    [backBtn setContentMode:UIViewContentModeLeft];
//    [backBtn setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 60)];
    [navView addSubview:backBtn];
    __weak __typeof(self)weakself = self;
    [backBtn jk_addActionHandler:^(NSInteger tag) {
        [weakself dismissViewControllerAnimated:YES completion:nil];
    }];
    
    navView.sd_layout
    .widthRatioToView(weakself.view,1)
    .heightIs(64.0)
    .topSpaceToView(weakself.view,0)
    .leftSpaceToView(weakself.view,0);
    
    _titleLabel.sd_layout
    .topSpaceToView(navView,20)
    .leftSpaceToView(navView,80)
    .rightSpaceToView(navView,80)
    .heightIs(44.0);
    
    backBtn.sd_layout
    .leftSpaceToView(navView,10)
    .topSpaceToView(navView,28)
    .widthIs(60)
    .heightIs(28);
    
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
