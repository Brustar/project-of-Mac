//
//  NSString+Attributed.m
//  uikitDemo
//
//  Created by DT on 15/8/15.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import "NSString+Attributed.h"
#import "NSMutableAttributedString+Extension.h"

@implementation NSString (Attributed)

- (NSMutableAttributedString*) setFontOfSize:(CGFloat)size
{
    return [self setFontOfSize:size string:self];
}

- (NSMutableAttributedString*) setFontOfSize:(CGFloat)size string:(NSString*)string
{
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:self];
    [att setFontOfSize:size string:string];
    return att;
}

- (NSMutableAttributedString*) setForegroundColor:(UIColor*)foregroundColor
{
    return [self setForegroundColor:foregroundColor string:self];
}

- (NSMutableAttributedString*) setForegroundColor:(UIColor*)foregroundColor string:(NSString*)string
{
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:self];
    [att setForegroundColor:foregroundColor string:string];
    return att;
}
- (NSMutableAttributedString*) setHTMLTextDocument
{
    return [self setHTMLTextDocument:self];
}

- (NSMutableAttributedString*) setHTMLTextDocument:(NSString*)string
{
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    return attrStr;
}

- (NSMutableAttributedString*) setStrikethrough
{
    return [self setStrikethrough:self color:[UIColor blackColor] style:NSUnderlineStyleSingle];
}

- (NSMutableAttributedString*) setStrikethrough:(NSString*)string
{
    return [self setStrikethrough:string color:[UIColor blackColor] style:NSUnderlineStyleSingle];
}

- (NSMutableAttributedString*) setStrikethrough:(NSString*)string color:(UIColor*)color
{
    return [self setStrikethrough:string color:color style:NSUnderlineStyleSingle];
}

- (NSMutableAttributedString*) setStrikethrough:(NSString*)string color:(UIColor*)color style:(NSUnderlineStyle)style
{
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:self];
    [att setStrikethrough:string color:color style:style];
    return att;
}

@end
