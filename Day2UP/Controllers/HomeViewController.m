//
//  HomeViewController.m
//  Day2UP
//
//  Created by ramborange on 2016/11/9.
//  Copyright © 2016年 Rambos. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "SubLBXScanViewController.h"
@interface HomeViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) UITableView *tableview;
@end
static NSString *cellID = @"cellIdentifier";
@implementation HomeViewController
- (void)dealloc {
    _searchBar = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationController.navigationBarHidden = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    __weak __typeof(self)weakself = self;
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"friendsRecommentIcon" ofType:@"png"]] forState:UIControlStateNormal];
    [leftBtn jk_addActionHandler:^(NSInteger tag) {
        [weakself scanQR];
    }];
     [leftBtn setBackgroundImage:[UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"friendsRecommentIcon-click" ofType:@"png"]] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [rightBtn setBackgroundImage:[UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"MainTagSubIcon" ofType:@"png"]] forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"MainTagSubIconClick" ofType:@"png"]] forState:UIControlStateHighlighted];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    //搜索
    _searchBar = [[UISearchBar alloc] init];
//    [_searchBar setSearchBarStyle:UISearchBarStyleMinimal];
    [_searchBar setBarTintColor:[UIColor whiteColor]];
    [_searchBar setBackgroundImage:[UIImage new]];
    [_searchBar setTintColor:Theme_color];
    _searchBar.placeholder = @"搜索你感兴趣的";
    _searchBar.delegate = self;
    [self.navigationController.view addSubview: _searchBar];
    _searchBar.sd_layout
    .leftSpaceToView(weakself.navigationController.view,60)
    .rightSpaceToView(weakself.navigationController.view,60)
    .centerYEqualToView(weakself.navigationController.navigationBar)
    .heightIs(30);

    
    _tableview = [UIHelper getTableViewWithSender:self];
    [_tableview registerClass:[HomeTableViewCell class] forCellReuseIdentifier:cellID];
    [self.view addSubview:_tableview];
    
    _tableview.sd_layout
    .topEqualToView(weakself.view)
    .leftEqualToView(weakself.view)
    .rightEqualToView(weakself.view)
    .bottomEqualToView(weakself.view);
}

#pragma mark - scan QR
- (void)scanQR {
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Outer;
    //扫码框周围4个角绘制的线条宽度
    style.photoframeLineW = 6;
    //扫码框周围4个角的宽度
    style.photoframeAngleW = 24;
    style.photoframeAngleH = 24;
    //扫码框内 动画类型 --线条上下移动
    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    //线条上下移动图片
    style.animationImage = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
    //SubLBXScanViewController继承自LBXScanViewController
    //添加一些扫码或相册结果处理
    SubLBXScanViewController *vc = [SubLBXScanViewController new];
    vc.style = style;
    vc.isQQSimulator = YES;
    vc.isVideoZoom = YES;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UISearchBar Delegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    searchBar.text = nil;
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];

}


#pragma mark - UITableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.itemLabel.text = [NSString stringWithFormat:@"Item %ld",indexPath.row+1];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//#pragma mark - UISearchResultsUpdating
//- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
//    NSLog(@"updateSearchResultsForSearchController");
//    
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_searchBar setHidden:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_searchBar setHidden:YES];
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
