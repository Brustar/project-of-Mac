//
//  NSObject+AddProperty.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSObject+AddProperty.h"
#import <objc/runtime.h>

//objc_getAssociatedObject和objc_setAssociatedObject都需要指定一个固定的地址，这个固定的地址值用来表示属性的key，起到一个常量的作用。
static const void *StringProperty = &StringProperty;
static const void *NumberProperty = &NumberProperty;
static const void *IntegerProperty = &IntegerProperty;
static const void *BoolProperty = &BoolProperty;
static const void *IndexPathProperty = &IndexPathProperty;
static const void *ArrayProperty = &ArrayProperty;
static const void *DictionaryProperty = &DictionaryProperty;
//static char IntegerProperty;
@implementation NSObject (AddProperty)

@dynamic stringProperty;

//set
-(void)setStringProperty:(NSString *)stringProperty{
    //use that a static const as the key
    objc_setAssociatedObject(self, StringProperty, stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //use that property's selector as the key:
    //objc_setAssociatedObject(self, @selector(stringProperty), stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//get
-(NSString *)stringProperty{
    return objc_getAssociatedObject(self, StringProperty);
}

//set
-(void)setNumberProperty:(NSNumber *)numberProperty{
    objc_setAssociatedObject(self, NumberProperty, numberProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//get
-(NSNumber*)numberProperty{
    return objc_getAssociatedObject(self, NumberProperty);
}

//set
-(void)setIntegerProperty:(NSInteger)integerProperty{
    NSNumber *number = [[NSNumber alloc]initWithInteger:integerProperty];
    objc_setAssociatedObject(self, IntegerProperty, number, OBJC_ASSOCIATION_ASSIGN);
}
//get
-(NSInteger)integerProperty{
    return [objc_getAssociatedObject(self, IntegerProperty) integerValue];
}

//set
-(void)setBoolProperty:(BOOL)boolProperty{
    NSNumber *number = [[NSNumber alloc] initWithBool:boolProperty];
    objc_setAssociatedObject(self, BoolProperty, number, OBJC_ASSOCIATION_ASSIGN);
}

//get
-(BOOL)boolProperty{
    return [objc_getAssociatedObject(self, BoolProperty) boolValue];
}

//set
-(void)setIndexPathProperty:(NSIndexPath *)indexPathProperty{
    objc_setAssociatedObject(self, IndexPathProperty, indexPathProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//get
-(NSIndexPath*)indexPathProperty{
    return objc_getAssociatedObject(self, IndexPathProperty);
}

//set
-(void)setArrayProperty:(NSArray *)arrayProperty{
    objc_setAssociatedObject(self, ArrayProperty, arrayProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//get
-(NSArray*)arrayProperty{
    return objc_getAssociatedObject(self, ArrayProperty);
}

//set
-(void)setDictionaryProperty:(NSDictionary *)dictionaryProperty{
    objc_setAssociatedObject(self, DictionaryProperty, dictionaryProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

//get
-(NSDictionary*)dictionaryProperty{
    return objc_getAssociatedObject(self, DictionaryProperty);
}

@end
