//
//  ScanResultViewController.m
//  Day2UP
//
//  Created by ramborange on 2016/11/11.
//  Copyright © 2016年 Rambos. All rights reserved.
//

#import "ScanResultViewController.h"

@interface ScanResultViewController ()

@end

@implementation ScanResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"识别结果";
    
    YYLabel *label = [UIHelper getLabelWithText:self.strScan textColor:[UIColor blueColor] font:Header_font bgColor:[UIColor clearColor] textAlign:NSTextAlignmentCenter corRadius:0];
    [self.view addSubview:label];    
    

    UIView *view = self.view;
    label.sd_layout
    .topSpaceToView(view,100)
    .leftSpaceToView(view,10)
    .rightSpaceToView(view,10)
    .heightIs(100);
    
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
