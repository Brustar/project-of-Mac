//
//  NSObject+KVOBlocks.h
//
//  Copyright (C) 2014 by Christopher Meyer
//  http://schwiiz.org/
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

// This class is based on NSObject+KVOBlocks (MIT licensed) by Stephan Leroux.
// See here: https://github.com/sleroux/KVO-Blocks
#import <Foundation/Foundation.h>

typedef void (^KVOBlock)(NSDictionary *change, void *context);

@interface NSObject (KVOBlocks)

#pragma mark - 增加属性KVO监听
/*!
 *  @author DT
 *
 *  @brief  增加属性KVO监听
 *
 *  @param observer 对象
 *  @param keyPath  属性
 *  @param options  监听类型
 *  @param context  参数
 *  @param block    回答函数
 */
- (void)addObserver:(NSObject *)observer
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
            context:(void *)context
          withBlock:(KVOBlock)block;

/*!
 *  @author DT
 *
 *  @brief  增加属性KVO监听
 *
 *  @param keyPath  属性
 *  @param options  监听类型
 *  @param context  参数
 *  @param block    回答函数
 */
-(void)addObserverForKeyPath:(NSString *)keyPath
                     options:(NSKeyValueObservingOptions)options
                     context:(void *)context
                   withBlock:(KVOBlock)block;

#pragma mark - 移除属性KVO监听
/*!
 *  @author DT
 *
 *  @brief  移除属性KVO监听
 *
 *  @param observer 对象
 *  @param keyPath  属性
 */
-(void)removeBlockObserver:(NSObject *)observer
                forKeyPath:(NSString *)keyPath;

/*!
 *  @author DT
 *
 *  @brief  移除属性KVO监听
 *
 *  @param keyPath  属性
 */
-(void)removeBlockObserverForKeyPath:(NSString *)keyPath;

@end