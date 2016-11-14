//
//  UIHelper.h
//  Day2UP
//
//  Created by ramborange on 2016/11/8.
//  Copyright © 2016年 Rambos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIHelper : NSObject

+ (UIHelper *)shareUIHelper;

+ (YYLabel *)getLabelWithText:(NSString *)text textColor:(UIColor *)tcolor font:(UIFont *)font bgColor:(UIColor *)bgColor textAlign:(NSTextAlignment)align corRadius:(CGFloat)ra;

+ (UIButton *)getButtonWithText:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font bgColor:(UIColor *)bgColor bgImg:(UIImage *)img corRadius:(CGFloat)ra;

+ (UITableView *)getTableViewWithSender:(id)vc;

@end
