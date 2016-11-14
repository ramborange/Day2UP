//
//  UIHelper.m
//  Day2UP
//
//  Created by ramborange on 2016/11/8.
//  Copyright © 2016年 Rambos. All rights reserved.
//

#import "UIHelper.h"

@implementation UIHelper
static UIHelper *helper = nil;
+ (UIHelper *)shareUIHelper {
    @synchronized (self) {
        if (helper==nil) {
            helper = [[UIHelper alloc] init];
        }
        return  helper;
    }
}

+ (YYLabel *)getLabelWithText:(NSString *)text textColor:(UIColor *)tcolor font:(UIFont *)font bgColor:(UIColor *)bgColor textAlign:(NSTextAlignment)align corRadius:(CGFloat)ra{
    YYLabel *label = [[YYLabel alloc] init];
    label.textColor = tcolor;
    label.font = font;
    label.backgroundColor = bgColor;
    label.text = text;
    label.numberOfLines = 0;
    label.textAlignment = align;
    if (ra) {
        label.layer.cornerRadius = ra;
        label.layer.masksToBounds = YES;
    }
    return label;
}

+ (UIButton *)getButtonWithText:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font bgColor:(UIColor *)bgColor bgImg:(UIImage *)img corRadius:(CGFloat)ra{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:tColor forState:UIControlStateNormal];
    [btn setTitle:text forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setBackgroundColor:bgColor];
    if (img!=NULL) {
        [btn setBackgroundImage:img forState:UIControlStateNormal];
    }
    if (ra) {
        btn.layer.cornerRadius = ra;
        btn.layer.masksToBounds = YES;
    }
    return btn;
}

+ (UITableView *)getTableViewWithSender:(id)vc {
    UITableView *tableview = [[UITableView alloc] init];
    tableview.delegate = vc;
    tableview.dataSource = vc;
    tableview.showsVerticalScrollIndicator = NO;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.tableFooterView = [UIView new];
    return tableview;
}

@end
