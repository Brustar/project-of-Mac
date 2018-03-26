//
//  NSAttributedString+TYCategory.h
//  SunCity-VIP
//
//  Created by Jerry on 23/12/16.
//  Copyright © 2016年 MT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (TYCategory)

/**  设置行间距  */
- (instancetype)ty_setLineSpace:(CGFloat)lineSpace;
- (instancetype)ty_setLineSpace2:(CGFloat)lineSpace;
- (NSDictionary *)ty_lineSpaceAttrWithSpace:(CGFloat)lineSpace;

/**  设置下划线  */
- (instancetype)ty_setUnderLine;

#pragma mark - 金额

/**  获取金额Attribute字符串  */
+ (NSAttributedString *)ty_moneyStrWithUnit:(NSString *)unit money:(NSString *)money;
+ (NSAttributedString *)ty_moneyStrWithUnit:(NSString *)unit money:(NSString *)money
                                      color:(UIColor *)color;
+ (NSAttributedString *)ty_moneyStrWithUnit:(NSString *)unit unitSize:(CGFloat)unitSize
                                   money:(NSString *)money moneySize:(CGFloat)moneySize
                                   color:(UIColor *)color;
+ (NSAttributedString *)ty_moneyStrWithUnit:(NSString *)unit unitSize:(CGFloat)unitSize
                                      money:(NSString *)money moneySize:(CGFloat)moneySize
                                  unitColor:(UIColor *)unitColor moneyColor:(UIColor *)moneyColor;

/**  添加金额转换(相当于HKD xxx)  */
+ (NSString *)ty_priceNumStrWithPriceStr:(id)priceStr;

+ (void)ty_moneyStrExNomalBlackWithTargetLabel:(UILabel *)label
                           alignmentRight:(BOOL)setAlignmentRight;
+ (void)ty_moneyStrExNomalWhiteWithTargetLabel:(UILabel *)label
                                alignmentRight:(BOOL)setAlignmentRight;
+ (void)ty_moneyStrExNomalWithTargetLabel:(UILabel *)label
                           alignmentRight:(BOOL)setAlignmentRight textColor:(UIColor *)textColor;
+ (void)ty_moneyStrExWithTargetLabel:(UILabel *)label font:(UIFont *)font fontColor:(UIColor *)fontColor money:(NSString *)money;

/**  便捷添加HKD 文字(同行)  */
+ (void)ty_moneyStrExSameLineWithTargetLabel:(UILabel *)label
                              alignmentRight:(BOOL)setAlignmentRight
                                   textColor:(UIColor *)textColor;
+ (void)ty_moneyStrExSameLineWithTargetLabel:(UILabel *)label font:(UIFont *)font
                                   fontColor:(UIColor *)fontColor money:(NSString *)money;


/**  添加加号  */
+ (void)ty_moneyStrAddIconWithTargetLabel:(UILabel *)label fontSize:(CGFloat)fontSize fontColor:(UIColor *)fontColor;

/**  获取封装好的转换HKD文字  */
+ (NSString *)ty_amountToHKDStrWithPriceStr:(NSString *)priceStr;
@end
