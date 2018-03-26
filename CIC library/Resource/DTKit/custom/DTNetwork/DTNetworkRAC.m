//
//  DTNetworkRAC.m
//  ProjectManager
//
//  Created by Brustar.xiao on 2018/2/24.
//  Copyright © 2018年 soonest. All rights reserved.
//

#import "DTNetworkRAC.h"
@import AFNetworking;

@implementation DTNetworkRAC

+(AFHTTPRequestOperationManager *)initWithProgress
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];  
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [MBProgressHUD showMessage:@"wait..."];
    
    return manager;
}

+(RACSignal *)RACHTTPPost:(NSString *) url param:(id)params
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        AFHTTPRequestOperationManager *manager = [[self class] initWithProgress];
        
        AFHTTPRequestOperation *operation = [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"%@", responseObject);
            [MBProgressHUD hideHUD];
            
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [subscriber sendError:error];
            NSLog(@"net error:%@",[error description]);
            [MBProgressHUD showError:@"net error."];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [operation cancel];
        }];
        
    }];
}

+(RACSignal *)RACHTTPGet:(NSString *)url param:(id)params
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        AFHTTPRequestOperationManager *manager = [[self class] initWithProgress];
        
        AFHTTPRequestOperation *operation = [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"%@", responseObject);
            [MBProgressHUD hideHUD];
            
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [subscriber sendError:error];
            [MBProgressHUD showError:@"net error."];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [operation cancel];
        }];
        
    }];
}

@end
