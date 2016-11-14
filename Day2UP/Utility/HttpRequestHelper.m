//
//  HttpRequestHelper.m
//  Day2UP
//
//  Created by ramborange on 2016/11/8.
//  Copyright © 2016年 Rambos. All rights reserved.
//

#import "HttpRequestHelper.h"

@implementation HttpRequestHelper
static NSDateFormatter *dateFormatter = nil;
+ (NSDateFormatter *)shareDateFormatter {
    @synchronized (self) {
        if (dateFormatter==nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
        }
        return dateFormatter;
    }
}

- (void)requestWithMethod:(NSString *)method header:(NSDictionary *)headerDic body:(NSDictionary *)bodyDic url:(NSString *)requestUrl successHandle:(requestSuccessed)success failHandle:(requestFailed)fail {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain",@"text/html", nil]];
    if (headerDic!=nil) {
        NSArray *keys = [headerDic allKeys];
        for (NSString *key in keys) {
            [manager.requestSerializer setValue:headerDic[key] forHTTPHeaderField:key];
        }
    }
    if ([method isEqualToString:@"GET"]) {
        [manager GET:requestUrl parameters:bodyDic progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:NULL];
            success(responseDic);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            fail(error);
        }];
        
    }else {
        [manager POST:requestUrl parameters:bodyDic progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:NULL];
            success(responseDic);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            fail(error);
        }];
    }
}

- (void)uploadImageWithUrl:(NSString *)url img:(UIImage *)image header:(NSDictionary *)headerDic body:(NSDictionary *)bodyDic imgName:(NSString *)imgParamName succesHandle:(requestSuccessed)suc failHandle:(requestFailed)fail {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"multipart/form-data", nil]];
    if (headerDic!=nil) {
        NSArray *keys = [headerDic allKeys];
        for (NSString *key in keys) {
            [manager.requestSerializer setValue:headerDic[key] forHTTPHeaderField:key];
        }
    }
    [manager POST:url parameters:bodyDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imgData = UIImageJPEGRepresentation(image, 1.0);
        [formData appendPartWithFileData:imgData name:imgParamName fileName:[self getDateString] mimeType:@"image/jpeg"];
        
    } progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:NULL];
        suc(responseDic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}

- (NSString *)getDateString {
    NSDateFormatter *formatter = [HttpRequestHelper shareDateFormatter];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    return [formatter stringFromDate:[NSDate date]];
}
@end
