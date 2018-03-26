//
//  NSAttributedString+TYCategory.m
//  SunCity-VIP
//
//  Created by Jerry on 23/12/16.
//  Copyright © 2016年 MT. All rights reserved.
//

#import "NSAttributedString+TYCategory.h"

@implementation NSAttributedString (TYCategory)

/**  设置行间距  */
- (NSAttributedString *)ty_setLineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedString = [self mutableCopy];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attributedString length])];
    return attributedString;
}
- (instancetype)ty_setLineSpace2:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedString = [self mutableCopy];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attributedString length])];
    return attributedString;
}

- (NSDictionary *)ty_lineSpaceAttrWithSpace:(CGFloat)lineSpace {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];//调整行间距
    return @{NSParagraphStyleAttributeName:paragraphStyle};
}

/**  设置下划线  */
- (instancetype)ty_setUnderLine
{
    NSMutableAttributedString *title = [self mutableCopy];
    NSRange titleRange = {0, [self length]};
    [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    return title;
}

#pragma mark - 金额

/**  获取金额Attribute字符串  */
+ (NSAttributedString *)ty_moneyStrWithUnit:(NSString *)unit money:(NSString *)money {
    return [self ty_moneyStrWithUnit:unit money:money color:[UIColor blackColor]];
}

+ (NSAttributedString *)ty_moneyStrWithUnit:(NSString *)unit money:(NSString *)money
                                   color:(UIColor *)color {
    CGFloat labelMoneyUnitFontSize = 15;
    CGFloat labelMoneyCountFontSize = 24;
    return [self ty_moneyStrWithUnit:unit unitSize:labelMoneyUnitFontSize
                            money:money moneySize:labelMoneyCountFontSize color:color];
}
+ (NSAttributedString *)ty_moneyStrWithUnit:(NSString *)unit unitSize:(CGFloat)unitSize
                                      money:(NSString *)money moneySize:(CGFloat)moneySize
                                      color:(UIColor *)color {
    
    return [self ty_moneyStrWithUnit:unit unitSize:unitSize money:money moneySize:moneySize unitColor:color moneyColor:color];
}
+ (NSAttributedString *)ty_moneyStrWithUnit:(NSString *)unit unitSize:(CGFloat)unitSize
                                   money:(NSString *)money moneySize:(CGFloat)moneySize
                                   unitColor:(UIColor *)unitColor moneyColor:(UIColor *)moneyColor {
    
    CGFloat labelMoneyUnitFontSize = unitSize;
    CGFloat labelMoneyCountFontSize = moneySize;
    
    NSMutableAttributedString *costUnitStr_M_A = [[NSMutableAttributedString alloc] initWithString:unit attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Oswald-Medium" size:labelMoneyUnitFontSize], NSForegroundColorAttributeName:unitColor}];
    
    money = [money toFormatNumberString];
    NSMutableAttributedString *costStr_M_A = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ ", money] attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Oswald-Medium" size:labelMoneyCountFontSize],NSForegroundColorAttributeName:moneyColor}];
    
    [costStr_M_A appendAttributedString:costUnitStr_M_A];
    return costStr_M_A;
}

/**  获取价格数字(12.00 分 -> 12.00)  */
+ (NSString *)ty_priceNumStrWithPriceStr:(id)priceStr {
    NSString *langCode =  [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode];
    
    NSString *finalPriceStr = @"";
    if ([priceStr isKindOfClass:[NSString class]]) {
        finalPriceStr = priceStr;
    } else if ([priceStr isKindOfClass:[NSAttributedString class]]) {
        NSAttributedString *tempAttributeStr = (NSAttributedString *)priceStr;
        finalPriceStr = [tempAttributeStr string];
    } else if (priceStr==nil) {
        return @"";
    }
    
    NSString *unitStr = [NSString stringWithFormat:@" %@", NSLocalizedStringFromTable(@"UNIVERSAL_POINT", langCode, nil)];
    NSRange unitRange = [[finalPriceStr lowercaseString] rangeOfString:[unitStr lowercaseString]];
    NSString *priceNumStr = [finalPriceStr substringWithRange:NSMakeRange(0, unitRange.location)];
    return priceNumStr;
}
/**  便捷添加HKD 文字(换行)  */
+ (void)ty_moneyStrExNomalBlackWithTargetLabel:(UILabel *)label
                           alignmentRight:(BOOL)setAlignmentRight
{
    [self ty_moneyStrExNomalWithTargetLabel:label alignmentRight:setAlignmentRight textColor:[UIColor blackColor]];
}
+ (void)ty_moneyStrExNomalWhiteWithTargetLabel:(UILabel *)label
                                alignmentRight:(BOOL)setAlignmentRight
{
    [self ty_moneyStrExNomalWithTargetLabel:label alignmentRight:setAlignmentRight textColor:[UIColor whiteColor]];
}
+ (void)ty_moneyStrExNomalWithTargetLabel:(UILabel *)label
                           alignmentRight:(BOOL)setAlignmentRight textColor:(UIColor *)textColor
{
    if (!label) {
        return;
    }
    NSString *priceStr = [NSAttributedString ty_priceNumStrWithPriceStr:label.attributedText];
    [NSAttributedString ty_moneyStrExWithTargetLabel:label font:[UIFont systemFontOfSize:10] fontColor:textColor money:priceStr];
    
    if (setAlignmentRight) {
        label.textAlignment = NSTextAlignmentRight;
    } else {
        label.textAlignment = NSTextAlignmentCenter;
    }
}
+ (void)ty_moneyStrExWithTargetLabel:(UILabel *)label font:(UIFont *)font fontColor:(UIColor *)fontColor money:(NSString *)money {
    
    NSString *langCode =  [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode];
    NSString *equalStr= NSLocalizedStringFromTable(@"UNIVERSAL_AMOUNTTO_HKD", langCode, nil);
    money = [money toFormatNumberString];
    NSMutableAttributedString *costSt = nil;
    
    if (label.attributedText) {
        NSMutableAttributedString *chineseStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n(%@ %@)", equalStr, money] attributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:fontColor}];
        costSt = [[NSMutableAttributedString alloc] initWithAttributedString:label.attributedText];
        [costSt appendAttributedString:chineseStr];
    }
    else
    {
        NSMutableAttributedString *chineseStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"(%@ %@)", equalStr, money] attributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:fontColor}];
        costSt = chineseStr;
    }
    label.attributedText = costSt;
}

/**  便捷添加HKD 文字(同行)  */
+ (void)ty_moneyStrExSameLineWithTargetLabel:(UILabel *)label
                           alignmentRight:(BOOL)setAlignmentRight textColor:(UIColor *)textColor
{
    NSString *priceStr = [NSAttributedString ty_priceNumStrWithPriceStr:label.attributedText];
    [NSAttributedString ty_moneyStrExSameLineWithTargetLabel:label font:[UIFont systemFontOfSize:10] fontColor:textColor money:priceStr];
    
    if (setAlignmentRight) {
        label.textAlignment = NSTextAlignmentRight;
    } else {
        label.textAlignment = NSTextAlignmentCenter;
    }
}
+ (void)ty_moneyStrExSameLineWithTargetLabel:(UILabel *)label font:(UIFont *)font fontColor:(UIColor *)fontColor money:(NSString *)money
{
    
    NSString *langCode =  [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode];
    NSString *equalStr= NSLocalizedStringFromTable(@"UNIVERSAL_AMOUNTTO_HKD", langCode, nil);
    money = [money toFormatNumberString];
    NSMutableAttributedString *costSt = nil;
    
    NSMutableAttributedString *chineseStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"(%@ %@)", equalStr, money] attributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:fontColor}];
    costSt = [[NSMutableAttributedString alloc] initWithAttributedString:label.attributedText];
    [costSt appendAttributedString:chineseStr];
    label.attributedText = costSt;
}

/**  添加加号  */
+ (void)ty_moneyStrAddIconWithTargetLabel:(UILabel *)label fontSize:(CGFloat)fontSize fontColor:(UIColor *)fontColor
{
    UIFont *font = [UIFont fontWithName:@"Oswald-Medium" size:fontSize];
    NSMutableAttributedString *chineseStr = [[NSMutableAttributedString alloc] initWithString:@"+" attributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:fontColor}];
    NSMutableAttributedString *costSt = [[NSMutableAttributedString alloc] initWithAttributedString:label.attributedText];
    [chineseStr appendAttributedString:costSt];
    label.attributedText = chineseStr;
}


/**  获取封装好的转换HKD文字  */
+ (NSString *)ty_amountToHKDStrWithPriceStr:(NSString *)priceStr {
    NSString *langCode =  [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode];
    NSString *unitStr = [NSString stringWithFormat:@" %@", NSLocalizedStringFromTable(@"UNIVERSAL_POINT", langCode, nil)];
    NSRange unitRange = [priceStr rangeOfString:unitStr];
    
    NSString *priceNumStr = @"";
    if (unitRange.length<=0) {
        priceNumStr = priceStr;
    } else {
        priceNumStr = [priceStr substringWithRange:NSMakeRange(0, unitRange.location)];
    }
    
    
    NSString *finalUnitStr =  NSLocalizedStringFromTable(@"UNIVERSAL_AMOUNTTO_HKD", langCode, nil);
    NSString *finalHKDPriceStr = [NSString stringWithFormat:@"(%@ %@)",finalUnitStr, priceNumStr];
    
    return finalHKDPriceStr;
}

@end
