//
//  DTNetworkRequestUtil.m
//  PharmaceuticalBar
//
//  Created by DT on 14-8-19.
//  Copyright (c) 2014年 DT. All rights reserved.
//
// ┏ ┓　　　┏ ┓
//┏┛ ┻━━━━━┛ ┻┓
//┃　　　　　　 ┃
//┃　　　━　　　┃
//┃　┳┛　  ┗┳　┃
//┃　　　　　　 ┃
//┃　　　┻　　　┃
//┃　　　　　　 ┃
//┗━┓　　　┏━━━┛
//  ┃　　　┃   DT专属
//  ┃　　　┃   神兽镇压
//  ┃　　　┃   代码无BUG！
//  ┃　　　┗━━━━━━━━━┓
//  ┃　　　　　　　    ┣┓
//  ┃　　　　         ┏┛
//  ┗━┓ ┓ ┏━━━┳ ┓ ┏━┛
//    ┃ ┫ ┫   ┃ ┫ ┫
//    ┗━┻━┛   ┗━┻━┛
//

#import "DTNetworkRequestUtil.h"
#import "NSString+Hash.h"
#import "DTDataAnalysis.h"

static DTNetworkRequestUtil * _engine = nil;

@implementation DTNetworkRequestUtil

+(instancetype)shareInstance
{
    static id instance = nil;
    static dispatch_once_t onceToken = 0L;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}
-(id)init
{
    self = [super init];
    if (self) {
        self.timeoutInterval = 3000;
    }
    return self;
}
- (NSMutableDictionary *)operations
{
    if (!_operations) {
        _operations = [NSMutableDictionary new];
    }
    return _operations;
}

/**
 *  获取唯一标识符
 *
 *  @return
 */
+(NSString*)genuuid;
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    
    CFRelease(uuid_string_ref);
    return uuid;
}

/**
 *  @Author DT, 14-11-14 16:11:32
 *
 *  md5加密
 *
 *  @param str 加密前字符串
 *
 *  @return 加密后字符串
 */
- (NSString *)md5:(NSString *)str
{
    /*
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
     //*/
    return [str md5String];
}

-(NSString*)requestTGWithPath:(NSString*)path
                        parameters:(id)parameters
                            method:(method)method
                           success:(requestSuccess)success
                           failure:(requestFailure)failure
{
    if (method == GET) {
        return [self requestGETWithPath:path parameters:parameters type:NO success:success failure:failure];
    } else if(method == PUT) {
        return [self requestPUTWithPath:path parameters:parameters type:NO success:success failure:failure];
    } else if(method == DELETE) {
        return [self requestDELETEWithPath:path parameters:parameters type:NO success:success failure:failure];
    } else if(method == PATCH) {
        return [self requestPATCHWithPath:path parameters:parameters type:NO success:success failure:failure];
    } else {
        return [self requestPOSTWithPath:path parameters:parameters type:NO success:success failure:failure];
    }
}

-(NSString*)requestSoonestWithPath:(NSString*)path
                 parameters:(id)parameters
                     method:(method)method
                    success:(requestSuccess)success
                    failure:(requestFailure)failure
{
    if (method == GET) {
        return [self requestGETWithPath:path parameters:parameters type:YES success:success failure:failure];
    }else if(method == PUT){
        return [self requestPUTWithPath:path parameters:parameters type:YES success:success failure:failure];
    }else{
        return [self requestPOSTWithPath:path parameters:parameters type:YES success:success failure:failure];
    }
}

/**
 *  网络请求PATCH方法
 *
 *  @param path           路径(带域名的路径)
 *  @param parameters     提交参数
 *  @param success        成功Block
 *  @param failure        失败Block
 *
 *  @return 一次网络操作的唯一序列号,用来取消网络请求
 */
-(NSString*)requestPATCHWithPath:(NSString*)path
                     parameters:(id)parameters
                           type:(BOOL)isSoonest
                        success:(requestSuccess)success
                        failure:(requestFailure)failure
{
    __block NSString *requestIdentifier = [[self class] genuuid];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"Soonest.Apps" forHTTPHeaderField:@"Travelglobal-User-Id"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeoutInterval;
    
    
    AFHTTPRequestOperation *requestOperation = [manager PATCH:path parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if ([responseObject isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = dataToDictionary(responseObject);
            DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
            response.dictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
            if (isSoonest) {
                response.result = [[dictionary objectForKey:@"Status"] isEqualToNumber:@1]?1:0;
                if (response.result == 0) {
                    response.message = [[dictionary objectForKey:@"Error"] objectForKey:@"Message"]?[[dictionary objectForKey:@"Error"] objectForKey:@"Message"]:@"";
                    //response.message = NSLocalizedStringFromTable(@"ERROR_1000", [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode], nil);
                }
            }else{
                response.result = 1;
            }
            if (success) {
                success(response);
            }
            [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
        response.error = error;
        response.result = 0;
        
        if ([[error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"] isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = dataToDictionary([error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"]);
            response.dictionary = dictionary;
            if (isSoonest) {
                response.message = [[dictionary objectForKey:@"Error"] objectForKey:@"Message"]?[[dictionary objectForKey:@"Error"] objectForKey:@"Message"]:@"";
            }else{
                response.message = [[dictionary objectForKey:@"message"] isKindOfClass:[NSString class]]?[dictionary objectForKey:@"message"]:@"";
            }
        }else{
            response.message = error.localizedDescription;
        }
        
        //response.message = NSLocalizedStringFromTable(@"ERROR_1000", [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode], nil);
        if (failure) {
            failure(response);
        }
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }];
    if (requestOperation) {
        [[[DTNetworkRequestUtil shareInstance] operations] setObject:requestOperation forKey:requestIdentifier];
    }else{
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }
    return requestIdentifier;
}

/**
 *  网络请求POST方法
 *
 *  @param path           路径(带域名的路径)
 *  @param parameters     提交参数
 *  @param success        成功Block
 *  @param failure        失败Block
 *
 *  @return 一次网络操作的唯一序列号,用来取消网络请求
 */
-(NSString*)requestPOSTWithPath:(NSString*)path
                     parameters:(id)parameters
                     type:(BOOL)isSoonest
                    success:(requestSuccess)success
                    failure:(requestFailure)failure
{
    __block NSString *requestIdentifier = [[self class] genuuid];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"Soonest.Apps" forHTTPHeaderField:@"Travelglobal-User-Id"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeoutInterval;
    AFHTTPRequestOperation *requestOperation = [manager POST:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = dataToDictionary(responseObject);
            DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
            if ([dictionary isKindOfClass:[NSDictionary class]]) {
                response.dictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
            }else{
                response.dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:dictionary,@"results", nil];
            }
            if (isSoonest) {
                response.result = [[dictionary objectForKey:@"Status"] isEqualToNumber:@1]?1:0;
                if (response.result == 0) {
                    response.message = [[dictionary objectForKey:@"Error"] objectForKey:@"Message"]?[[dictionary objectForKey:@"Error"] objectForKey:@"Message"]:@"";
                    //response.message = NSLocalizedStringFromTable(@"ERROR_1000", [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode], nil);
                }
            }else{
                response.result = 1;
            }
            if (success) {
                success(response);
            }
            [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
        response.error = error;
        response.result = 0;
        
        if ([[error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"] isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = dataToDictionary([error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"]);
            response.dictionary = dictionary;
            if (isSoonest) {
                response.message = [[dictionary objectForKey:@"Error"] objectForKey:@"Message"]?[[dictionary objectForKey:@"Error"] objectForKey:@"Message"]:@"";
            }else{
                response.message = [[dictionary objectForKey:@"message"] isKindOfClass:[NSString class]]?[dictionary objectForKey:@"message"]:@"";
            }
        }else{
            response.message = error.localizedDescription;
        }
         
        //response.message = NSLocalizedStringFromTable(@"ERROR_1000", [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode], nil);
        if (failure) {
            failure(response);
        }
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }];
    if (requestOperation) {
        [[[DTNetworkRequestUtil shareInstance] operations] setObject:requestOperation forKey:requestIdentifier];
    }else{
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }
    return requestIdentifier;
}

/**
 *  网络请求PUT方法
 *
 *  @param path           路径(带域名的路径)
 *  @param parameters     提交参数
 *  @param success        成功Block
 *  @param failure        失败Block
 *
 *  @return 一次网络操作的唯一序列号,用来取消网络请求
 */
-(NSString*)requestPUTWithPath:(NSString*)path
                     parameters:(id)parameters
                           type:(BOOL)isSoonest
                        success:(requestSuccess)success
                        failure:(requestFailure)failure
{
    __block NSString *requestIdentifier = [[self class] genuuid];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"Soonest.Apps" forHTTPHeaderField:@"Travelglobal-User-Id"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeoutInterval;
    AFHTTPRequestOperation *requestOperation = [manager PUT:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = dataToDictionary(responseObject);
            DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
            response.dictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
            if (isSoonest) {
                response.result = [[dictionary objectForKey:@"Status"] isEqualToNumber:@1]?1:0;
                if (response.result == 0) {
                    response.message = [[dictionary objectForKey:@"Error"] objectForKey:@"Message"]?[[dictionary objectForKey:@"Error"] objectForKey:@"Message"]:@"";
                    //response.message = NSLocalizedStringFromTable(@"ERROR_1000", [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode], nil);
                }
            }else{
                response.result = 1;
            }
            if (success) {
                success(response);
            }
            [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
        response.error = error;
        response.result = 0;
        
        if ([[error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"] isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = dataToDictionary([error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"]);
            response.dictionary = dictionary;
            if (isSoonest) {
                response.message = [[dictionary objectForKey:@"Error"] objectForKey:@"Message"]?[[dictionary objectForKey:@"Error"] objectForKey:@"Message"]:@"";
            }else{
                response.message = [[dictionary objectForKey:@"message"] isKindOfClass:[NSString class]]?[dictionary objectForKey:@"message"]:@"";
            }
        }else{
            response.message = error.localizedDescription;
        }
        
        //response.message = NSLocalizedStringFromTable(@"ERROR_1000", [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode], nil);
        if (failure) {
            failure(response);
        }
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }];
    if (requestOperation) {
        [[[DTNetworkRequestUtil shareInstance] operations] setObject:requestOperation forKey:requestIdentifier];
    }else{
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }
    return requestIdentifier;
}


/**
 *  网络请求DELETE方法
 *
 *  @param path           路径(带域名的路径)
 *  @param parameters     提交参数
 *  @param success        成功Block
 *  @param failure        失败Block
 *
 *  @return 一次网络操作的唯一序列号,用来取消网络请求
 */
-(NSString*)requestDELETEWithPath:(NSString*)path
                    parameters:(id)parameters
                          type:(BOOL)isSoonest
                       success:(requestSuccess)success
                       failure:(requestFailure)failure
{
    __block NSString *requestIdentifier = [[self class] genuuid];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"Soonest.Apps" forHTTPHeaderField:@"Travelglobal-User-Id"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeoutInterval;
    AFHTTPRequestOperation *requestOperation = [manager DELETE:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = dataToDictionary(responseObject);
            DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
            response.dictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
            if (isSoonest) {
                response.result = [[dictionary objectForKey:@"Status"] isEqualToNumber:@1]?1:0;
                if (response.result == 0) {
                    response.message = [[dictionary objectForKey:@"Error"] objectForKey:@"Message"]?[[dictionary objectForKey:@"Error"] objectForKey:@"Message"]:@"";
//                  response.message = NSLocalizedStringFromTable(@"ERROR_1000", [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode], nil);
                }
            }else{
                response.result = 1;
            }
            if (success) {
                success(response);
            }
            [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
        response.error = error;
        response.result = 0;
        
        if ([[error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"] isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = dataToDictionary([error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"]);
            response.dictionary = dictionary;
            if (isSoonest) {
                response.message = [[dictionary objectForKey:@"Error"] objectForKey:@"Message"]?[[dictionary objectForKey:@"Error"] objectForKey:@"Message"]:@"";
            }else{
                response.message = [[dictionary objectForKey:@"message"] isKindOfClass:[NSString class]]?[dictionary objectForKey:@"message"]:@"";
            }
        }else{
            response.message = error.localizedDescription;
        }
        
//      response.message = NSLocalizedStringFromTable(@"ERROR_1000", [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode], nil);
        if (failure) {
            failure(response);
        }
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }];
    if (requestOperation) {
        [[[DTNetworkRequestUtil shareInstance] operations] setObject:requestOperation forKey:requestIdentifier];
    }else{
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }
    return requestIdentifier;
}


/**
 *  网络请求GET方法
 *
 *  @param path           路径(带域名的路径)
 *  @param parameters     提交参数
 *  @param success        成功Block
 *  @param failure        失败Block
 *
 *  @return 一次网络操作的唯一序列号,用来取消网络请求
 */
-(NSString*)requestGETWithPath:(NSString*)path
                    parameters:(id)parameters
                          type:(BOOL)isSoonest
                        success:(requestSuccess)success
                        failure:(requestFailure)failure
{
    __block NSString *requestIdentifier = [[self class] genuuid];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"Soonest.Apps" forHTTPHeaderField:@"Travelglobal-User-Id"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeoutInterval;
    AFHTTPRequestOperation *requestOperation = [manager GET:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = dataToDictionary(responseObject);
            DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
            response.dictionary = dictionary;
            if (isSoonest) {
                response.result = [[dictionary objectForKey:@"Status"] isEqualToNumber:@1]?1:0;
                if (response.result == 0) {
                    response.message = [[dictionary objectForKey:@"Error"] objectForKey:@"Message"]?[[dictionary objectForKey:@"Error"] objectForKey:@"Message"]:@"";
                    //response.message = NSLocalizedStringFromTable(@"ERROR_1000", [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode], nil);
                }
            }else{
                response.result = 1;
            }
            if (success) {
                success(response);
            }
            [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
        response.error = error;
        response.result = 0;
        
        if ([[error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"] isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = dataToDictionary([error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"]);
            response.dictionary = dictionary;
            if (isSoonest) {
                response.message = [[dictionary objectForKey:@"Error"] objectForKey:@"Message"]?[[dictionary objectForKey:@"Error"] objectForKey:@"Message"]:@"";
            }else{
                response.message = [[dictionary objectForKey:@"message"] isKindOfClass:[NSString class]]?[dictionary objectForKey:@"message"]:@"";
            }
        }else{
            response.message = error.localizedDescription;
        }
         
        //response.message = NSLocalizedStringFromTable(@"ERROR_1000", [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode], nil);
        if (failure) {
            failure(response);
        }
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }];
    if (requestOperation) {
        [[[DTNetworkRequestUtil shareInstance] operations] setObject:requestOperation forKey:requestIdentifier];
    }else{
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }
    return requestIdentifier;
}



/**
 *  网络请求GET方法
 *
 *  @param path           路径(带域名的路径)
 *  @param parameters     提交参数
 *  @param success        成功Block
 *  @param failure        失败Block
 *
 *  @return 一次网络操作的唯一序列号,用来取消网络请求
 */
-(NSString*)requestGETWithPath:(NSString*)path
                    parameters:(id)parameters
                       success:(requestSuccess)success
                       failure:(requestFailure)failure
{
    __block NSString *requestIdentifier = [[self class] genuuid];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"Soonest.Apps" forHTTPHeaderField:@"Travelglobal-User-Id"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeoutInterval;
    AFHTTPRequestOperation *requestOperation = [manager GET:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = dataToDictionary(responseObject);
            DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
            response.dictionary = dictionary;
                response.result = [[dictionary objectForKey:@"status"] isEqualToString:@"OK"]?1:0;
                if (response.result == 0) {
                    response.message = @"";
                }
            if (success) {
                success(response);
            }
            [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
        response.error = error;
        response.result = 0;
        if ([[error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"] isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = dataToDictionary([error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"]);
            response.dictionary = dictionary;
            response.message = @"";
        }else{
            response.message = error.localizedDescription;
        }
        if (failure) {
            failure(response);
        }
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }];
    if (requestOperation) {
        [[[DTNetworkRequestUtil shareInstance] operations] setObject:requestOperation forKey:requestIdentifier];
    }else{
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }
    return requestIdentifier;
}

-(NSString*)requestFileWithPath:(NSString*)path
                     parameters:(id)parameters
                          files:(NSArray *)files
                           name:(NSString *)name
                        success:(requestSuccess)success
                        failure:(requestFailure)failure
{
    __block NSString *requestIdentifier = [[self class] genuuid];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"Soonest.Apps" forHTTPHeaderField:@"Travelglobal-User-Id"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = self.timeoutInterval;
    AFHTTPRequestOperation *requestOperation = [manager POST:path parameters:parameters constructingBodyWithBlock:^(id <AFMultipartFormData> formData) {
        
        //        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        //        formatter.dateFormat = @"yyyyMMddHHmmssSSS";
        
        for (UIImage *image in files) {
            //            NSString *fileName = [NSString stringWithFormat:@"%@.jpg",[formatter stringFromDate:[NSDate date]]];
            
            [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 1.0) name:name fileName:@"topimg.jpg" mimeType:@"image/jpeg"];
        }
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = dataToDictionary(responseObject);
            DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
            response.dictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
            response.result = [[dictionary objectForKey:@"result"] isEqualToString:@"success"]?1:0;
            if (response.result == 1) {
                response.message = [dictionary objectForKey:@"msg"]?[dictionary objectForKey:@"msg"]:@"";
            }else if (response.result ==0) {
                response.message = [dictionary objectForKey:@"msg"];
            }
            if (success) {
                success(response);
            }
            [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
        response.error = error;
        response.result = 0;
        response.message = error.localizedDescription;
        if (failure) {
            failure(response);
        }
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }];
    if (requestOperation) {
        [[[DTNetworkRequestUtil shareInstance] operations] setObject:requestOperation forKey:requestIdentifier];
    }else{
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:requestIdentifier];
    }
    return requestIdentifier;
    
}

-(void)cancelRequests:(NSArray*)identifiers canceled:(requestSuccess)canceled
{
    for (NSString *identifier in identifiers) {
        AFHTTPRequestOperation *requestOperation = [[[DTNetworkRequestUtil shareInstance] operations] objectForKey:identifier];
        requestOperation.completionBlock = nil;
        [requestOperation cancel];
        [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:identifier];
    }
    if (canceled) {
        DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
        canceled(response);
    }
}

-(void)cancelRequest:(NSString*)identifier canceled:(requestSuccess)canceled
{
    AFHTTPRequestOperation *requestOperation = [[[DTNetworkRequestUtil shareInstance] operations] objectForKey:identifier];
    requestOperation.completionBlock = nil;
    [requestOperation cancel];
    [[[DTNetworkRequestUtil shareInstance] operations] removeObjectForKey:identifier];
    
    if (canceled) {
        DTNetworkResultResponse *response = [[DTNetworkResultResponse alloc] init];
        canceled(response);
    }
}

/*!
 *  @Author DT
 *
 *  @brief  NSString类型的json转化成NSDictionary
 *
 *  @param json json类型字符串
 *
 *  @return NSDictionary
 */
-(id)JSONValue:(NSString*)json;
{
    NSData* data = [json dataUsingEncoding:NSUTF8StringEncoding];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

@end
