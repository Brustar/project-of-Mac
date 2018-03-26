//
//  DTDataAnalysis.m
//  uikitDemo
//
//  Created by DT on 15/8/24.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import "DTDataAnalysis.h"

NSData* dictionaryToData(NSDictionary* dictionary)
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:dictionary forKey:@"Some Key Value"];
    [archiver finishEncoding];
    return data;
}

NSString* dictionaryToString(NSDictionary* dictionary)
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:0
                                                         error:&error];
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from dictionary: %@, error: %@", dictionary, error);
#endif
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonString;
}

NSDictionary* dataToDictionary(NSData* data)
{
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

NSString* dataToString(NSData* data)
{
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

NSData* stringToData(NSString* string)
{
    return [string dataUsingEncoding:NSUTF8StringEncoding];
}

NSDictionary* stringToDictionary(NSString* string)
{
    NSError *errorJson;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&errorJson];
    if (errorJson != nil) {
#ifdef DEBUG
        NSLog(@"fail to get dictioanry from JSON: %@, error: %@", string, errorJson);
#endif
    }
    return jsonDict;
}

NSString* arrayToString(id array)
{
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:array options:0 error:nil];
    
    NSString *stringDate = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return stringDate;
}

NSDictionary* arrayToDictionary(id array)
{
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:array options:0 error:nil];
    
    return dataToDictionary(jsonData);
}

