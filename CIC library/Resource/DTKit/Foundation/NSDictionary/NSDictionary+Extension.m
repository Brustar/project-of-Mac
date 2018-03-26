//
//  NSDictionary+Extension.m
//  uikitDemo
//
//  Created by DT on 15/8/20.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

+ (NSDictionary*) dictionaryByMerging:(NSDictionary*)dict1 with:(NSDictionary*)dict2
{
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:dict1];
    NSMutableDictionary *resultTemp = [NSMutableDictionary dictionaryWithDictionary:dict1];
    [resultTemp addEntriesFromDictionary:dict2];
    [resultTemp enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
        if ([dict1 objectForKey:key]) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary *newVal = [[dict1 objectForKey: key] dictionaryByMergingWith: (NSDictionary*) obj];
                [result setObject: newVal forKey: key];
            } else {
                [result setObject: obj forKey: key];
            }
        }
        else if([dict2 objectForKey:key])
        {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary *newVal = [[dict2 objectForKey: key] dictionaryByMergingWith: (NSDictionary*) obj];
                [result setObject: newVal forKey: key];
            } else {
                [result setObject: obj forKey: key];
            }
        }
    }];
    return (NSDictionary*) [result mutableCopy];
}

- (NSDictionary*) dictionaryByMergingWith:(NSDictionary*)dict
{
    return [[self class] dictionaryByMerging:self with: dict];
}

+ (NSDictionary*) dictionaryWithURLQuery:(NSString*)query
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSArray *parameters = [query componentsSeparatedByString:@"&"];
    for(NSString *parameter in parameters) {
        NSArray *contents = [parameter componentsSeparatedByString:@"="];
        if([contents count] == 2) {
            NSString *key = [contents objectAtIndex:0];
            NSString *value = [contents objectAtIndex:1];
            value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            if (key && value) {
                [dict setObject:value forKey:key];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}

- (NSString*) urlQueryString
{
    NSMutableString *string = [NSMutableString string];
    for (NSString *key in [self allKeys]) {
        if ([string length]) {
            [string appendString:@"&"];
        }
        CFStringRef escaped = CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)[[self objectForKey:key] description],
                                                                      NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                      kCFStringEncodingUTF8);
        [string appendFormat:@"%@=%@", key, escaped];
        CFRelease(escaped);
    }
    return string;
}

- (NSString*) langCodeString
{
    if (self == nil || [self isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    
    NSString *langCode = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode];
    
    if ([langCode isEqualToString:@"English"]) {
        langCode = @"en";
    }else if ([langCode isEqualToString:@"Traditional"]) {
        langCode = @"zh_HK";
    }else{
        langCode = @"zh_CN";
    }
    NSString *result = [self objectForKey:langCode];
    if (result == nil) {
        result = @"";
    }
    
    return result;
}

- (NSString *)englishString
{
    if (self == nil || [self isKindOfClass:[NSNull class]]) {
        return nil;
    }
    NSString *result = [self objectForKey:@"en"];
    return result;
}

- (NSDictionary*) langCodeDictionary
{
    NSString *langCode = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode];
    
    if ([langCode isEqualToString:@"English"]) {
        langCode = @"en";
    }else if ([langCode isEqualToString:@"Traditional"]) {
        langCode = @"zh_HK";
    }else{
        langCode = @"zh_CN";
    }
    
    return [self objectForKey:langCode];
}

- (NSString*) xmlString
{
    
    NSString *xmlStr = @"<xml>";
    
    for (NSString *key in self.allKeys) {
        
        NSString *value = [self objectForKey:key];
        
        xmlStr = [xmlStr stringByAppendingString:[NSString stringWithFormat:@"<%@>%@</%@>", key, value, key]];
    }
    
    xmlStr = [xmlStr stringByAppendingString:@"</xml>"];
    
    return xmlStr;
}

-(NSString*) jsonString
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:&error];
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);
#endif
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonString;
}

-(NSData*) data
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self forKey:@"Some Key Value"];
    [archiver finishEncoding];
    return data;
}

@end
