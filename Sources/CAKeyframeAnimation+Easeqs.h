//
//  CAKeyframeAnimation+Easeqs.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

@import QuartzCore;
@import UIKit;

#import "ESQEasingFunction.h"

@interface CAKeyframeAnimation (Easeqs)

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromFloat:(CGFloat)from
                                 toFloat:(CGFloat)to
                                duration:(NSTimeInterval)duration
                          easingFunction:(ESQEasingFunction *)easingFunction;

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromFloat:(CGFloat)from
                                 toFloat:(CGFloat)to
                                duration:(NSTimeInterval)duration
                         easingCFunction:(ESQEasingCFunction)easingCFunction
               easingCFunctionParameters:(NSArray<NSNumber *> *)easingCFunctionParameters;

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromPoint:(CGPoint)from
                                 toPoint:(CGPoint)to
                                duration:(NSTimeInterval)duration
                          easingFunction:(ESQEasingFunction *)easingFunction;

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromPoint:(CGPoint)from
                                 toPoint:(CGPoint)to
                                duration:(NSTimeInterval)duration
                         xEasingFunction:(ESQEasingFunction *)xEasingFunction
                         yEasingFunction:(ESQEasingFunction *)yEasingFunction;

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromPoint:(CGPoint)from
                                 toPoint:(CGPoint)to
                                duration:(NSTimeInterval)duration
                         easingCFunction:(ESQEasingCFunction)easingCFunction
               easingCFunctionParameters:(NSArray<NSNumber *> *)easingCFunctionParameters;

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromPoint:(CGPoint)from
                                 toPoint:(CGPoint)to
                                duration:(NSTimeInterval)duration
                        xEasingCFunction:(ESQEasingCFunction)xEasingCFunction
              xEasingCFunctionParameters:(NSArray<NSNumber *> *)xEasingCFunctionParameters
                        yEasingCFunction:(ESQEasingCFunction)yEasingCFunction
              yEasingCFunctionParameters:(NSArray<NSNumber *> *)yEasingCFunctionParameters;

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                                fromSize:(CGSize)from
                                  toSize:(CGSize)to
                                duration:(NSTimeInterval)duration
                          easingFunction:(ESQEasingFunction *)easingFunction;

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                                fromSize:(CGSize)from
                                  toSize:(CGSize)to
                                duration:(NSTimeInterval)duration
                     widthEasingFunction:(ESQEasingFunction *)widthEasingFunction
                    heightEasingFunction:(ESQEasingFunction *)heightEasingFunction;

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                                fromSize:(CGSize)from
                                  toSize:(CGSize)to
                                duration:(NSTimeInterval)duration
                         easingCFunction:(ESQEasingCFunction)easingCFunction
               easingCFunctionParameters:(NSArray<NSNumber *> *)easingCFunctionParameters;

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                                fromSize:(CGSize)from
                                  toSize:(CGSize)to
                                duration:(NSTimeInterval)duration
                    widthEasingCFunction:(ESQEasingCFunction)widthEasingFunction
          widthEasingCFunctionParameters:(NSArray<NSNumber *> *)widthEasingCFunctionParameters
                   heightEasingCFunction:(ESQEasingCFunction)heightEasingFunction
         heightEasingCFunctionParameters:(NSArray<NSNumber *> *)heightEasingCFunctionParameters;

@end
