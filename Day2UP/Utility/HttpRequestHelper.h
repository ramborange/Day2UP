//
//  HttpRequestHelper.h
//  Day2UP
//
//  Created by ramborange on 2016/11/8.
//  Copyright © 2016年 Rambos. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^requestSuccessed)(NSDictionary *responseDic);
typedef void(^requestFailed)(NSError *error);
@interface HttpRequestHelper : NSObject
- (void)requestWithMethod:(NSString *)method header:(NSDictionary *)headerDic body:(NSDictionary *)bodyDic url:(NSString *)requestUrl successHandle:(requestSuccessed)success failHandle:(requestFailed)fail;

- (void)uploadImageWithUrl:(NSString *)url img:(UIImage *)image header:(NSDictionary *)headerDic body:(NSDictionary *)bodyDic imgName:(NSString *)imgParamName succesHandle:(requestSuccessed)suc failHandle:(requestFailed)fail;

@end
