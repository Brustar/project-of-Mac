//
//  NSMutableAttributedString+Extension.m
//  uikitDemo
//
//  Created by DT on 15/8/17.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import "NSMutableAttributedString+Extension.h"

@implementation NSMutableAttributedString (Extension)

- (void) setForegroundColor:(UIColor*)foregroundColor
{
    [self setForegroundColor:foregroundColor string:[self string]];
}

- (void) setForegroundColor:(UIColor*)foregroundColor string:(NSString*)string
{
    [self addAttribute:NSForegroundColorAttributeName
                 value:foregroundColor
                 range:[self rangeOfString:string]];
}

- (void) setBackgroundColor:(UIColor*)backgroundColor
{
    [self setBackgroundColor:backgroundColor string:[self string]];
}

- (void) setBackgroundColor:(UIColor*)backgroundColor string:(NSString*)string
{
    [self addAttribute:NSBackgroundColorAttributeName
                 value:backgroundColor
                 range:[self rangeOfString:string]];
}

- (void) setFontOfSize:(CGFloat)size
{
    [self setFontOfSize:size string:[self string]];
}

- (void) setFontOfSize:(CGFloat)size string:(NSString*)string
{
    [self addAttribute:NSFontAttributeName
                 value:[UIFont systemFontOfSize:size]
                 range:[self rangeOfString:string]];
}

- (void) setKernOfSize:(CGFloat)kernOfSize
{
    [self setKernOfSize:kernOfSize string:[self string]];
}

- (void) setKernOfSize:(CGFloat)kernOfSize string:(NSString*)string
{
    [self addAttribute:NSKernAttributeName
                 value:@(kernOfSize)
                 range:[self rangeOfString:string]];
}

- (void) setStrokeWidth:(CGFloat)strokeWidth
{
    [self setStrokeWidth:strokeWidth string:[self string]];
}

- (void) setStrokeWidth:(CGFloat)strokeWidth string:(NSString*)string
{
    [self addAttribute:NSStrokeWidthAttributeName
                 value:@(strokeWidth)
                 range:[self rangeOfString:string]];
}

- (void) setStrokeColor:(UIColor*)strokeColor
{
    [self setStrokeColor:strokeColor string:[self string]];
}

- (void) setStrokeColor:(UIColor*)strokeColor string:(NSString*)string
{
    [self addAttribute:NSStrokeColorAttributeName
                 value:strokeColor
                 range:[self rangeOfString:string]];
}

- (void) setLineSpacing:(CGFloat)lineSpacing
{
    [self setLineSpacing:lineSpacing string:[self string]];
}

- (void) setLineSpacing:(CGFloat)lineSpacing string:(NSString*)string
{
    //设置行之间的margin
    NSMutableParagraphStyle * pStyle = [[NSMutableParagraphStyle alloc] init];
    pStyle.lineSpacing = lineSpacing;
    [self addAttribute:NSParagraphStyleAttributeName
                 value:pStyle
                 range:[self rangeOfString:string]];
}

- (void) setObliqueness:(CGFloat)obliqueness
{
    [self setObliqueness:obliqueness string:[self string]];
}

- (void) setObliqueness:(CGFloat)obliqueness string:(NSString*)string
{
    [self addAttribute:NSObliquenessAttributeName
                 value:@(obliqueness)
                 range:[self rangeOfString:string]];
}

- (void) setJumpUrl:(NSString*)jumpUrl
{
    [self setJumpUrl:jumpUrl string:[self string]];
}

- (void) setJumpUrl:(NSString*)jumpUrl string:(NSString*)string
{
    [self addAttribute:NSLinkAttributeName
                 value:[NSURL URLWithString:jumpUrl]
                 range:[self rangeOfString:string]];
}

- (void) setStrikethrough
{
    [self setStrikethrough:[self string] color:[UIColor blackColor] style:NSUnderlineStyleSingle];
}

- (void) setStrikethrough:(NSString*)string
{
    [self setStrikethrough:string color:[UIColor blackColor] style:NSUnderlineStyleSingle];
}

- (void) setStrikethrough:(NSString*)string color:(UIColor*)color
{
    [self setStrikethrough:string color:color style:NSUnderlineStyleSingle];
}

- (void) setStrikethrough:(NSString*)string color:(UIColor*)color style:(NSUnderlineStyle)style;
{
    [self addAttribute:NSStrikethroughStyleAttributeName
                 value:[NSNumber numberWithInteger:style]
                 range:[self rangeOfString:string]];
    
    [self addAttribute:NSStrikethroughColorAttributeName
                 value:color
                 range:[self rangeOfString:string]];
}

- (void) setUnderline
{
    [self setUnderline:[self string] color:[UIColor blackColor] style:NSUnderlineStyleSingle];
}

- (void) setUnderline:(NSString*)string
{
    [self setUnderline:string color:[UIColor blackColor] style:NSUnderlineStyleSingle];
}

- (void) setUnderline:(NSString*)string color:(UIColor*)color
{
    [self setUnderline:string color:color style:NSUnderlineStyleSingle];
}

- (void) setUnderline:(NSString*)string color:(UIColor*)color style:(NSUnderlineStyle)style
{
    [self addAttribute:NSUnderlineStyleAttributeName
                 value:[NSNumber numberWithInteger:style]
                 range:[self rangeOfString:string]];
    
    [self addAttribute:NSUnderlineColorAttributeName
                 value:color
                 range:[self rangeOfString:string]];
}

- (void) setParagraphStyle:(NSMutableParagraphStyle*)paragraph
{
    [self setParagraphStyle:paragraph string:[self string]];
}

- (void) setParagraphStyle:(NSMutableParagraphStyle*)paragraph string:(NSString*)string
{
    [self addAttribute:NSParagraphStyleAttributeName
                 value:paragraph
                 range:[self rangeOfString:string]];
}

- (void) setShadow:(NSShadow*)shadow
{
    [self setShadow:shadow string:[self string]];
}

- (void) setShadow:(NSShadow*)shadow string:(NSString*)string
{
    [self addAttribute:NSShadowAttributeName
                 value:shadow
                 range:[self rangeOfString:string]];
}

//-(NSRange)rangeOfString:(NSString*)string rangeString:(NSString*)str
//{
//    NSRange range = [string rangeOfString:str];
//    if (range.location != NSNotFound) {
//        return range;
//    }
//    return NSMakeRange(0, 0);
//}

-(NSRange)rangeOfString:(NSString*)str
{
    NSString *string = [self string];
    NSRange range = [string rangeOfString:str];
    if (range.location != NSNotFound) {
        return range;
    }
    return NSMakeRange(0, 0);
}

@end
