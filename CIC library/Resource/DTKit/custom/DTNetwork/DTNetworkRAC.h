//
//  DTNetworkRAC.h
//  ProjectManager
//
//  Created by Brustar.xiao on 2018/2/24.
//  Copyright © 2018年 soonest. All rights reserved.
//

#import <Foundation/Foundation.h>
@import ReactiveCocoa;

#define USERID [[NSUserDefaults standardUserDefaults] objectForKey:@"staff"][@"userId"]
#define BASE_URL @"http://10.80.10.155/uat/api/index.php?r="
#define DEVICE @"IPHONE"
#define VERSION @"1.0"
#define LANGUAGE @"ZH_CN"

#define CREATE_URL(PARAM) [NSString stringWithFormat:@"%@%@",BASE_URL,PARAM]

#define CREATE_LOGIN_URL(PARAM) [NSString stringWithFormat:@"%@/1/%@/%@/%@",BASE_URL,VERSION,LANGUAGE,PARAM]

@interface DTNetworkRAC : NSObject

/**
 *  网络请求post返回信号量
 */
+(RACSignal *)RACHTTPPost:(NSString *) url param:(id)params;

/**
 *  网络请求get返回信号量
 */
+(RACSignal *)RACHTTPGet:(NSString *) url param:(id)params;

@end
