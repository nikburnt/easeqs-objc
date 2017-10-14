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

/**
 Extension for CAKeyframeAnimation to be used with ESQEasingFunction-s or their underlying C-functions
 */
@interface CAKeyframeAnimation (Easeqs)

/**
 Creates a CAKeyframeAnimation object with specified key path of the property that should be animated on the layer
 from one float value to another filling values using specified easing function decorator

 @param keyPath
     the key path of the property to be animated
 @param from
     defines the value the receiver uses to start interpolation
 @param to
     defines the value the receiver uses to end interpolation
 @param duration
     the duration (measured in seconds) of the animation
 @param easingFunction
     timing function decorator, extension of ESQEasingFunction, defining the pacing of the animation
 @return
     ready to use CAKeyframeAnimation instance with interpolated values, duration and keypath
 */
+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromFloat:(CGFloat)from
                                 toFloat:(CGFloat)to
                                duration:(NSTimeInterval)duration
                          easingFunction:(ESQEasingFunction *)easingFunction;

/**
 Creates a CAKeyframeAnimation object with specified key path of the property that should be animated on the layer
 from one float value to another filling values using specified easing function

 @param keyPath
     the key path of the property to be animated
 @param from 
     defines the value the receiver uses to start interpolation
 @param to
     defines the value the receiver uses to end interpolation
 @param duration
     the duration (measured in seconds) of the animation
 @param easingCFunction
     specify timing function defining the pacing of the animation
 @param easingCFunctionParameters
     specify array of timing function parameters if required for easingCFunction
 @return
     ready to use CAKeyframeAnimation instance with interpolated values, duration and keypath
 */
+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromFloat:(CGFloat)from
                                 toFloat:(CGFloat)to
                                duration:(NSTimeInterval)duration
                         easingCFunction:(ESQEasingCFunction)easingCFunction
               easingCFunctionParameters:(NSArray<NSNumber *> *)easingCFunctionParameters;

/**
 Creates a CAKeyframeAnimation object with specified key path of the property that should be animated on the layer
 from one point value to another filling values using specified easing function decorator for both coordinates

 @param keyPath
     the key path of the property to be animated
 @param from 
     defines the value the receiver uses to start interpolation
 @param to
     defines the value the receiver uses to end interpolation
 @param duration
     the duration (measured in seconds) of the animation
 @param easingFunction
     timing function decorator, extension of ESQEasingFunction, defining the pacing of the animation for x and y
 @return
     ready to use CAKeyframeAnimation instance with interpolated values, duration and keypath
 */
+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromPoint:(CGPoint)from
                                 toPoint:(CGPoint)to
                                duration:(NSTimeInterval)duration
                          easingFunction:(ESQEasingFunction *)easingFunction;

/**
 Creates a CAKeyframeAnimation object with specified key path of the property that should be animated on the layer
 from one point value to another filling values using separated easing function decorator for each coordinate

 @param keyPath
     the key path of the property to be animated
 @param from
     defines the value the receiver uses to start interpolation
 @param to
     defines the value the receiver uses to end interpolation
 @param duration
     the duration (measured in seconds) of the animation
 @param xEasingFunction 
     timing function decorator, extension of ESQEasingFunction, defining the pacing of the animation for x
 @param yEasingFunction 
     timing function decorator, extension of ESQEasingFunction, defining the pacing of the animation for y
 @return
     ready to use CAKeyframeAnimation instance with interpolated values, duration and keypath
 */
+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromPoint:(CGPoint)from
                                 toPoint:(CGPoint)to
                                duration:(NSTimeInterval)duration
                         xEasingFunction:(ESQEasingFunction *)xEasingFunction
                         yEasingFunction:(ESQEasingFunction *)yEasingFunction;

/**
 Creates a CAKeyframeAnimation object with specified key path of the property that should be animated on the layer
 from one point value to another filling values using specified easing function for both coordinates

 @param keyPath
     the key path of the property to be animated
 @param from 
     defines the value the receiver uses to start interpolation
 @param to
     defines the value the receiver uses to end interpolation
 @param duration
     the duration (measured in seconds) of the animation
 @param easingCFunction
     easingCFunction specify timing function defining the pacing of the animation for x and y
 @param easingCFunctionParameters
     specify array of timing function parameters if required for easingCFunction
 @return
     ready to use CAKeyframeAnimation instance with interpolated values, duration and keypath
 */
+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromPoint:(CGPoint)from
                                 toPoint:(CGPoint)to
                                duration:(NSTimeInterval)duration
                         easingCFunction:(ESQEasingCFunction)easingCFunction
               easingCFunctionParameters:(NSArray<NSNumber *> *)easingCFunctionParameters;

/**
 Creates a CAKeyframeAnimation object with specified key path of the property that should be animated on the layer
 from one point value to another filling values using separated easing function for each coordinate

 @param keyPath
     the key path of the property to be animated
 @param from
     defines the value the receiver uses to start interpolation
 @param to
     defines the value the receiver uses to end interpolation
 @param duration
     the duration (measured in seconds) of the animation
 @param xEasingCFunction
     easingCFunction specify timing function defining the pacing of the animation for x
 @param xEasingCFunctionParameters
     specify array of timing function parameters if required for xEasingCFunction
 @param yEasingCFunction
     easingCFunction specify timing function defining the pacing of the animation for y
 @param yEasingCFunctionParameters
     specify array of timing function parameters if required for yEasingCFunction
 @return
     ready to use CAKeyframeAnimation instance with interpolated values, duration and keypath
 */
+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromPoint:(CGPoint)from
                                 toPoint:(CGPoint)to
                                duration:(NSTimeInterval)duration
                        xEasingCFunction:(ESQEasingCFunction)xEasingCFunction
              xEasingCFunctionParameters:(NSArray<NSNumber *> *)xEasingCFunctionParameters
                        yEasingCFunction:(ESQEasingCFunction)yEasingCFunction
              yEasingCFunctionParameters:(NSArray<NSNumber *> *)yEasingCFunctionParameters;

/**
 Creates a CAKeyframeAnimation object with specified key path of the property that should be animated on the layer
 from one size value to another filling values using specified easing function decorator for both dimension

 @param keyPath
     the key path of the property to be animated
 @param from 
     defines the value the receiver uses to start interpolation
 @param to
     defines the value the receiver uses to end interpolation
 @param duration
     the duration (measured in seconds) of the animation
 @param easingFunction 
     timing function decorator, extension of ESQEasingFunction, defining the pacing of the animation for width and height
 @return
     ready to use CAKeyframeAnimation instance with interpolated values, duration and keypath
 */
+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                                fromSize:(CGSize)from
                                  toSize:(CGSize)to
                                duration:(NSTimeInterval)duration
                          easingFunction:(ESQEasingFunction *)easingFunction;

/**
 Creates a CAKeyframeAnimation object with specified key path of the property that should be animated on the layer
 from one size value to another filling values using separated easing function decorator for each dimension

 @param keyPath
     the key path of the property to be animated
 @param from 
     defines the value the receiver uses to start interpolation
 @param to
     defines the value the receiver uses to end interpolation
 @param duration
     the duration (measured in seconds) of the animation
 @param widthEasingFunction 
     timing function decorator, extension of ESQEasingFunction, defining the pacing of the animation for width
 @param heightEasingFunction 
     timing function decorator, extension of ESQEasingFunction, defining the pacing of the animation for height
 @return
     ready to use CAKeyframeAnimation instance with interpolated values, duration and keypath
 */
+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                                fromSize:(CGSize)from
                                  toSize:(CGSize)to
                                duration:(NSTimeInterval)duration
                     widthEasingFunction:(ESQEasingFunction *)widthEasingFunction
                    heightEasingFunction:(ESQEasingFunction *)heightEasingFunction;

/**
 Creates a CAKeyframeAnimation object with specified key path of the property that should be animated on the layer
 from one size value to another filling values using specified easing function for both dimension

 @param keyPath
     the key path of the property to be animated
 @param from 
     defines the value the receiver uses to start interpolation
 @param to
     defines the value the receiver uses to end interpolation
 @param duration
     the duration (measured in seconds) of the animation
 @param easingCFunction
     easingCFunction specify timing function defining the pacing of the animation for width and height
 @param easingCFunctionParameters
     specify array of timing function parameters if required for easingCFunction
 @return
     ready to use CAKeyframeAnimation instance with interpolated values, duration and keypath
 */
+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                                fromSize:(CGSize)from
                                  toSize:(CGSize)to
                                duration:(NSTimeInterval)duration
                         easingCFunction:(ESQEasingCFunction)easingCFunction
               easingCFunctionParameters:(NSArray<NSNumber *> *)easingCFunctionParameters;

/**
 Creates a CAKeyframeAnimation object with specified key path of the property that should be animated on the layer
 from one size value to another filling values using separated easing function for each dimension

 @param keyPath
     the key path of the property to be animated
 @param from 
     defines the value the receiver uses to start interpolation
 @param to
     defines the value the receiver uses to end interpolation
 @param duration
     the duration (measured in seconds) of the animation
 @param widthEasingFunction
     easingCFunction specify timing function defining the pacing of the animation for width
 @param widthEasingCFunctionParameters
     specify array of timing function parameters if required for widthEasingFunction
 @param heightEasingFunction
     easingCFunction specify timing function defining the pacing of the animation for height
 @param heightEasingCFunctionParameters
     specify array of timing function parameters if required for heightEasingFunction
 @return
     ready to use CAKeyframeAnimation instance with interpolated values, duration and keypath
 */
+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                                fromSize:(CGSize)from
                                  toSize:(CGSize)to
                                duration:(NSTimeInterval)duration
                    widthEasingCFunction:(ESQEasingCFunction)widthEasingFunction
          widthEasingCFunctionParameters:(NSArray<NSNumber *> *)widthEasingCFunctionParameters
                   heightEasingCFunction:(ESQEasingCFunction)heightEasingFunction
         heightEasingCFunctionParameters:(NSArray<NSNumber *> *)heightEasingCFunctionParameters;

@end
