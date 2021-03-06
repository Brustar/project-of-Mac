//
//  NetworkRequestUtil.h
//  PharmaceuticalBar
//
//  Created by DT on 14-8-19.
//  Copyright (c) 2014年 DT. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "DTNetworkResultResponse.h"
#import "DTNetworkCache.h"

typedef void (^requestSuccess) (DTNetworkResultResponse* response);

typedef void (^requestFailure) (DTNetworkResultResponse* response);

typedef enum {
    POST,
    GET,
    PUT,
    DELETE,
    PATCH,
}method;

/**
 *  网络请求类
 */
@interface DTNetworkRequestUtil : NSObject
/** 网络操作集合 */
@property (nonatomic,strong) NSMutableDictionary *operations;

/** 超时时间间隔，以秒为单位创建的请求。默认的超时时间间隔为300秒。 */
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/**
 *  初始化方法
 *
 *  @return 返回NetworkRequestUtil对象
 */
+(DTNetworkRequestUtil*)shareInstance;

/**
 *  请求网络
 *
 *  @param path           路径(带域名的路径)
 *  @param parameters     请求参数
 *  @param method         POST/GET
 *  @param useAccessTicke 带有票据
 *  @param success        成功Block
 *  @param failure        失败Block (如果服务器有错误信息,包括密码错误之类的也在这里返回)
 *
 *  @return 一次网络操作的唯一序列号,用来取消网络请求
 */
-(NSString*)requestFileWithPath:(NSString*)path
                     parameters:(id)parameters
                          files:(NSArray *)files
                           name:(NSString *)name
                        success:(requestSuccess)success
                        failure:(requestFailure)failure;

/**
 *  请求网络 Soonest
 *
 *  @param path           路径(带域名的路径)
 *  @param parameters     请求参数
 *  @param method         POST/GET
 *  @param useAccessTicke 带有票据
 *  @param success        成功Block
 *  @param failure        失败Block (如果服务器有错误信息,包括密码错误之类的也在这里返回)
 *
 *  @return 一次网络操作的唯一序列号,用来取消网络请求
 */
-(NSString*)requestSoonestWithPath:(NSString*)path
                        parameters:(id)parameters
                            method:(method)method
                           success:(requestSuccess)success
                           failure:(requestFailure)failure;
/**
 *  请求网络 TG
 *
 *  @param path           路径(带域名的路径)
 *  @param parameters     请求参数
 *  @param method         POST/GET
 *  @param useAccessTicke 带有票据
 *  @param success        成功Block
 *  @param failure        失败Block (如果服务器有错误信息,包括密码错误之类的也在这里返回)
 *
 *  @return 一次网络操作的唯一序列号,用来取消网络请求
 */
-(NSString*)requestTGWithPath:(NSString*)path
                        parameters:(id)parameters
                            method:(method)method
                           success:(requestSuccess)success
                           failure:(requestFailure)failure;


-(NSString*)requestGETWithPath:(NSString*)path
                    parameters:(id)parameters
                       success:(requestSuccess)success
                       failure:(requestFailure)failure;
/**
 *  批量取消网络请求
 *
 *  @param identifiers 网络操作的唯一序列号集合
 *  @param canceled    取消Block
 */
-(void)cancelRequests:(NSArray*)identifiers canceled:(requestSuccess)canceled;

/**
 *  取消一个网络请求
 *
 *  @param identifier 网络操作的唯一序列号
 *  @param canceled   取消Block
 */
-(void)cancelRequest:(NSString*)identifier canceled:(requestSuccess)canceled;

@end
