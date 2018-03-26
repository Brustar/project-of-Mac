//
//  NSString+XML.h
//  Created by Hyde, Andrew on 3/20/13.
//  A simple converter from a string containing XML to an NSDictionary, backed by NSXMLParser.
//  Will return nil if there has been an error.

/*
 
 #import "NSString+XML.h"
 
 ...
 
 NSString *XMLString = @"<test>data</test>";
 NSDictionary *XMLAsDictionary = [XMLString dictionaryFromXML];
 
 */

//https://github.com/AndrewHydeJr/NSString-XML
#import <Foundation/Foundation.h>

@interface NSString (XML)

#pragma mark - xml格式数据转化成NSDictionary
/*!
 *  @author DT
 *
 *  @brief  解析xml格式数据,转化成NSDictionary
 *
 *  @return NSDictionary
 */
-(NSDictionary *) dictionaryFromXML;

-(NSDictionary *) stringToDictionary;

@end
