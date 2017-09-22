//
//  CAKeyframeAnimation+Easeqs.m
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "CAKeyframeAnimation+Easeqs.h"

static const NSUInteger ESQFrameRate = 60;

NS_INLINE CGFloat callEasingFuncitonWithArray(ESQEasingCFunction easingFunction, 
                                              CGFloat progress,
                                              NSArray<NSNumber *> *parameters) {
    CGFloat result = 0;
    if (parameters.count == 1) {
        result = easingFunction(progress, parameters[0].floatValue, nil);
    } else if (parameters.count == 2) {
        result = easingFunction(progress, parameters[0].floatValue, parameters[1].floatValue, nil);
    } else {
        result = easingFunction(progress, nil);
    }
    return result;
}

@implementation CAKeyframeAnimation (Easeqs)

#pragma mark - Public

#pragma mark - CGFloat

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromFloat:(CGFloat)from
                                 toFloat:(CGFloat)to
                                duration:(NSTimeInterval)duration 
                          easingFunction:(ESQEasingFunction *)easingFunction {
    CAKeyframeAnimation *result = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    result.values = [result valuesFromFloat:from toFloat:to duration:duration easingFunction:easingFunction];
    result.duration = duration;
    return result;
}

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromFloat:(CGFloat)from 
                                 toFloat:(CGFloat)to
                                duration:(NSTimeInterval)duration 
                         easingCFunction:(ESQEasingCFunction)easingCFunction 
               easingCFunctionParameters:(NSArray<NSNumber *> *)easingCFunctionParameters {
    CAKeyframeAnimation *result = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    result.values = [result valuesFromFloat:from
                                    toFloat:to
                                   duration:duration
                            easingCFunction:easingCFunction
                  easingCFunctionParameters:easingCFunctionParameters];
    result.duration = duration;
    return result;
}

#pragma mark - CGPoint

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromPoint:(CGPoint)from
                                 toPoint:(CGPoint)to
                                duration:(NSTimeInterval)duration
                          easingFunction:(ESQEasingFunction *)easingFunction {
    return [CAKeyframeAnimation esq_animationWithKeyPath:keyPath
                                               fromPoint:from
                                                 toPoint:to
                                                duration:duration
                                         xEasingFunction:easingFunction
                                         yEasingFunction:easingFunction];
}

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromPoint:(CGPoint)from
                                 toPoint:(CGPoint)to
                                duration:(NSTimeInterval)duration
                         xEasingFunction:(ESQEasingFunction *)xEasingFunction
                         yEasingFunction:(ESQEasingFunction *)yEasingFunction {
    CAKeyframeAnimation *result = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    result.values = [result valuesFromPoint:from
                                    toPoint:to
                                   duration:duration
                            easingFunctionX:xEasingFunction
                            easingFunctionY:yEasingFunction];
    result.duration = duration;
    return result;
}

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromPoint:(CGPoint)from
                                 toPoint:(CGPoint)to
                                duration:(NSTimeInterval)duration
                         easingCFunction:(ESQEasingCFunction)easingCFunction
               easingCFunctionParameters:(NSArray<NSNumber *> *)easingCFunctionParameters {
    return [CAKeyframeAnimation esq_animationWithKeyPath:keyPath
                                               fromPoint:from
                                                 toPoint:to
                                                duration:duration
                                        xEasingCFunction:easingCFunction
                              xEasingCFunctionParameters:easingCFunctionParameters
                                        yEasingCFunction:easingCFunction
                              yEasingCFunctionParameters:easingCFunctionParameters];
}

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                               fromPoint:(CGPoint)from
                                 toPoint:(CGPoint)to
                                duration:(NSTimeInterval)duration
                        xEasingCFunction:(ESQEasingCFunction)xEasingCFunction
              xEasingCFunctionParameters:(NSArray<NSNumber *> *)xEasingCFunctionParameters
                        yEasingCFunction:(ESQEasingCFunction)yEasingCFunction
              yEasingCFunctionParameters:(NSArray<NSNumber *> *)yEasingCFunctionParameters {
    CAKeyframeAnimation *result = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    result.values = [result valuesFromPoint:from
                                    toPoint:to
                                   duration:duration
                           xEasingCFunction:xEasingCFunction
                 xEasingCFunctionParameters:xEasingCFunctionParameters
                           yEasingCFunction:yEasingCFunction
                 yEasingCFunctionParameters:yEasingCFunctionParameters];
    result.duration = duration;
    return result;
}

#pragma mark - CGSize

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                                fromSize:(CGSize)from
                                  toSize:(CGSize)to
                                duration:(NSTimeInterval)duration
                          easingFunction:(ESQEasingFunction *)easingFunction {
    return [CAKeyframeAnimation esq_animationWithKeyPath:keyPath
                                                fromSize:from
                                                  toSize:to
                                                duration:duration
                                     widthEasingFunction:easingFunction
                                    heightEasingFunction:easingFunction];
}

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                                fromSize:(CGSize)from
                                  toSize:(CGSize)to
                                duration:(NSTimeInterval)duration
                     widthEasingFunction:(ESQEasingFunction *)widthEasingFunction
                    heightEasingFunction:(ESQEasingFunction *)heightEasingFunction {
    CAKeyframeAnimation *result = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    result.values = [result valuesFromSize:from
                                    toSize:to
                                  duration:duration
                       widthEasingFunction:widthEasingFunction
                      heightEasingFunction:heightEasingFunction];
    result.duration = duration;
    return result;
}

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                                fromSize:(CGSize)from
                                  toSize:(CGSize)to
                                duration:(NSTimeInterval)duration
                         easingCFunction:(ESQEasingCFunction)easingCFunction
               easingCFunctionParameters:(NSArray<NSNumber *> *)easingCFunctionParameters {
    return [CAKeyframeAnimation esq_animationWithKeyPath:keyPath
                                                fromSize:from
                                                  toSize:to
                                                duration:duration
                                    widthEasingCFunction:easingCFunction
                          widthEasingCFunctionParameters:easingCFunctionParameters
                                   heightEasingCFunction:easingCFunction
                         heightEasingCFunctionParameters:easingCFunctionParameters];
}

+ (instancetype)esq_animationWithKeyPath:(NSString *)keyPath
                                fromSize:(CGSize)from
                                  toSize:(CGSize)to
                                duration:(NSTimeInterval)duration
                     widthEasingCFunction:(ESQEasingCFunction)widthEasingCFunction
          widthEasingCFunctionParameters:(NSArray<NSNumber *> *)widthEasingCFunctionParameters
                    heightEasingCFunction:(ESQEasingCFunction)heightEasingCFunction
         heightEasingCFunctionParameters:(NSArray<NSNumber *> *)heightEasingCFunctionParameters {
    CAKeyframeAnimation *result = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    result.values = [result valuesFromSize:from
                                    toSize:to
                                  duration:duration
                      widthEasingCFunction:widthEasingCFunction
            widthEasingCFunctionParameters:widthEasingCFunctionParameters
                      heightEasingCFunction:heightEasingCFunction
           heightEasingCFunctionParameters:heightEasingCFunctionParameters];
    result.duration = duration;
    return result;
}

#pragma mark - Internal

- (NSArray *)valuesFromFloat:(CGFloat)from
                     toFloat:(CGFloat)to
                    duration:(NSTimeInterval)duration
              easingFunction:(ESQEasingFunction *)easingFunction {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    CGFloat delta = to - from;
    NSUInteger numberOfFrames = (NSUInteger)(duration * ESQFrameRate);
    CGFloat progressStep = 1.f / numberOfFrames;
    for (CGFloat progress = 0; progress < 1; progress += progressStep) {
        if (progress + progressStep > 1) {
            progress = 1;
        }
        
        CGFloat easedProgress = [easingFunction easedProgress:progress];
        CGFloat newValue = from + delta * easedProgress;
        [result addObject:@(newValue)];
    }
    
    return [result copy];
}

- (NSArray *)valuesFromFloat:(CGFloat)from
                     toFloat:(CGFloat)to
                    duration:(NSTimeInterval)duration
             easingCFunction:(ESQEasingCFunction)easingCFunction
   easingCFunctionParameters:(NSArray<NSNumber *> *)easingCFunctionParameters {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    CGFloat delta = to - from;
    NSUInteger numberOfFrames = (NSUInteger)(duration * ESQFrameRate);
    CGFloat progressStep = 1.f / numberOfFrames;
    for (CGFloat progress = 0; progress < 1; progress += progressStep) {
        if (progress + progressStep > 1) {
            progress = 1;
        }
        
        CGFloat easedProgress = callEasingFuncitonWithArray(easingCFunction, progress, easingCFunctionParameters);
        CGFloat newValue = from + delta * easedProgress;
        [result addObject:@(newValue)];
    }
    
    return [result copy];
}

- (NSArray *)valuesFromPoint:(CGPoint)from
                     toPoint:(CGPoint)to
                    duration:(NSTimeInterval)duration
             easingFunctionX:(ESQEasingFunction *)xEasingFunction
             easingFunctionY:(ESQEasingFunction *)yEasingFunction {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    CGFloat xDelta = to.x - from.x;
    CGFloat yDelta = to.y - from.y;
    NSUInteger numberOfFrames = (NSUInteger)(duration * ESQFrameRate);
    CGFloat progressStep = 1.f / numberOfFrames;
    for (CGFloat progress = 0; progress < 1; progress += progressStep) {
        if (progress + progressStep > 1) {
            progress = 1;
        }
        
        CGFloat xEasedProgress = [xEasingFunction easedProgress:progress];
        CGFloat newXValue = from.x + xDelta * xEasedProgress;
        
        CGFloat yEasedProgress = [yEasingFunction easedProgress:progress];
        CGFloat newYValue = from.y + yDelta * yEasedProgress;
        
        NSValue *newValue = [NSValue valueWithCGPoint:CGPointMake(newXValue, newYValue)];
        [result addObject:newValue];
    }
    
    return [result copy];
}

- (NSArray *)valuesFromPoint:(CGPoint)from
                     toPoint:(CGPoint)to
                    duration:(NSTimeInterval)duration
            xEasingCFunction:(ESQEasingCFunction)xEasingCFunction
  xEasingCFunctionParameters:(NSArray<NSNumber *> *)xEasingCFunctionParameters
            yEasingCFunction:(ESQEasingCFunction)yEasingCFunction
  yEasingCFunctionParameters:(NSArray<NSNumber *> *)yEasingCFunctionParameters {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    CGFloat xDelta = to.x - from.x;
    CGFloat yDelta = to.y - from.y;
    NSUInteger numberOfFrames = (NSUInteger)(duration * ESQFrameRate);
    CGFloat progressStep = 1.f / numberOfFrames;
    for (CGFloat progress = 0; progress < 1; progress += progressStep) {
        if (progress + progressStep > 1) {
            progress = 1;
        }
        
        CGFloat xEasedProgress = callEasingFuncitonWithArray(xEasingCFunction, progress, xEasingCFunctionParameters);
        CGFloat newXValue = from.x + xDelta * xEasedProgress;
        
        CGFloat yEasedProgress = callEasingFuncitonWithArray(yEasingCFunction, progress, yEasingCFunctionParameters);
        CGFloat newYValue = from.y + yDelta * yEasedProgress;
        
        NSValue *newValue = [NSValue valueWithCGPoint:CGPointMake(newXValue, newYValue)];
        [result addObject:newValue];
    }
    
    return [result copy];
}

- (NSArray *)valuesFromSize:(CGSize)from
                     toSize:(CGSize)to
                   duration:(NSTimeInterval)duration
        widthEasingFunction:(ESQEasingFunction *)widthEasingFunction
       heightEasingFunction:(ESQEasingFunction *)heightEasingFunction {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    CGFloat widthDelta = to.width - from.width;
    CGFloat heightDelta = to.height - from.height;
    NSUInteger numberOfFrames = (NSUInteger)(duration * ESQFrameRate);
    CGFloat progressStep = 1.f / numberOfFrames;
    for (CGFloat progress = 0; progress < 1; progress += progressStep) {
        if (progress + progressStep > 1) {
            progress = 1;
        }
        
        CGFloat widthEasedProgress = [widthEasingFunction easedProgress:progress];
        CGFloat newWidthValue = from.width + widthDelta * widthEasedProgress;
        
        CGFloat heightEasedProgress = [heightEasingFunction easedProgress:progress];
        CGFloat newHeightValue = from.height + heightDelta * heightEasedProgress;
        
        NSValue *newValue = [NSValue valueWithCGSize:CGSizeMake(newWidthValue, newHeightValue)];
        [result addObject:newValue];
    }
    
    return [result copy];
}

-     (NSArray *)valuesFromSize:(CGSize)from
                         toSize:(CGSize)to
                       duration:(NSTimeInterval)duration
           widthEasingCFunction:(ESQEasingCFunction)widthEasingCFunction
 widthEasingCFunctionParameters:(NSArray<NSNumber *> *)widthEasingCFunctionParameters
          heightEasingCFunction:(ESQEasingCFunction)heightEasingCFunction
heightEasingCFunctionParameters:(NSArray<NSNumber *> *)heightEasingCFunctionParameters {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    CGFloat widthDelta = to.width - from.width;
    CGFloat heightDelta = to.height - from.height;
    NSUInteger numberOfFrames = (NSUInteger)(duration * ESQFrameRate);
    CGFloat progressStep = 1.f / numberOfFrames;
    for (CGFloat progress = 0; progress < 1; progress += progressStep) {
        if (progress + progressStep > 1) {
            progress = 1;
        }
        
        CGFloat widthEasedProgress = callEasingFuncitonWithArray(widthEasingCFunction,
                                                                 progress,
                                                                 widthEasingCFunctionParameters);
        CGFloat newWidthValue = from.width + widthDelta * widthEasedProgress;
        
        CGFloat heightEasedProgress = callEasingFuncitonWithArray(heightEasingCFunction,
                                                                  progress,
                                                                  heightEasingCFunctionParameters);
        CGFloat newHeightValue = from.height + heightDelta * heightEasedProgress;
        
        NSValue *newValue = [NSValue valueWithCGSize:CGSizeMake(newWidthValue, newHeightValue)];
        [result addObject:newValue];
    }
    
    return [result copy];
}

@end
