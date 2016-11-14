
//
//  Header.h
//  Day2UP
//
//  Created by ramborange on 2016/11/8.
//  Copyright © 2016年 Rambos. All rights reserved.
//

#ifndef Header_h
#define Header_h

//font
#define Header_font [UIFont fontWithName:@"Gillsans" size:20]
#define Large_font [UIFont fontWithName:@"Gillsans-Light" size:17]
#define Normal_font [UIFont fontWithName:@"Gillsans-Light" size:15]
#define Small_font [UIFont fontWithName:@"Gillsans-Light" size:13]

//color
#define Theme_color     [UIColor colorWithRed:229/255.0 green:27/255.0 blue:65/255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//frame
#define Screen_width [UIScreen mainScreen].bounds.size.width
#define Screen_height [UIScreen mainScreen].bounds.size.height

#import "HttpRequestHelper.h"
#import "UIHelper.h"
#import "DataSaveManager.h"
#import "AppDelegate.h"
#import "BaseViewController.h"

#endif /* Header_h */
