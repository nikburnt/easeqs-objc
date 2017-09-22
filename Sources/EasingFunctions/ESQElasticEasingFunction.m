//
//  ESQElasticEasingFunction.m
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQElasticEasingFunction.h"

#pragma mark - Inline

NS_INLINE CGFloat _elasticIn(CGFloat progress,
                            CGFloat minimum, CGFloat maximum, CGFloat delta,
                            CGFloat amplitude, CGFloat period) {
    if (progress == 0) {
        return minimum;
    }
    
    if ((progress /= delta) == 1) {
        return minimum + maximum;
    }
    
    CGFloat s;
    if (amplitude < ABS(maximum)) {
        amplitude = maximum;
        s = period / 4.0f;
    } else {
        s = period / (2 * (CGFloat)M_PI) * asinf(maximum / amplitude);
    }
    
    return minimum - amplitude
                     * powf(2, 10 * (progress -= 1))
                     * sinf((progress * delta - s) * (2 * (CGFloat)M_PI) / period);
}

NS_INLINE CGFloat _elasticOut(CGFloat progress, CGFloat maximum, CGFloat amplitude, CGFloat period) {
    if (progress == 0) {
        return 0;
    }
    
    if (progress == 1) {
        return maximum;
    }
    
    float s = period;
    if (amplitude < maximum) {
        amplitude = maximum;
        s /= 4;
    } else {
        s /= 2 * (CGFloat)M_PI * asinf(maximum / amplitude);
    }
    
    return amplitude * powf(2, -10 * progress) * sinf((progress - s) * (2 * (CGFloat)M_PI) / period) + maximum;
}

NS_INLINE CGFloat in(CGFloat progress, CGFloat amplitude, CGFloat period) {
    return _elasticIn(progress, 0, 1, 1, amplitude, period);
}

NS_INLINE CGFloat out(CGFloat progress, CGFloat amplitude, CGFloat period) {
    return _elasticOut(progress, 1, amplitude, period);
}

NS_INLINE CGFloat inOut(CGFloat progress, CGFloat amplitude, CGFloat period) {
    if (progress == 0) {
        return 0;
    }
    
    if ((progress *= 2) == 2) {
        return 1;
    }
    
    float s = period;
    if (amplitude < 1) {
        amplitude = 1;
        s /= 4;
    } else {
        s /= 2 * (CGFloat)M_PI * asinf(1 / amplitude);
    }
    
    if ((progress -= 1) < 0) {
        return -(amplitude * powf(2, 10 * progress) * sinf((progress - s) * (2 * (CGFloat)M_PI) / period)) / 2;
    } else {
        return amplitude * powf(2, -10 * progress) * sinf((progress - s) * (2 * (CGFloat)M_PI) / period ) / 2 + 1;
    }
}

NS_INLINE CGFloat outIn(CGFloat progress, CGFloat amplitude, CGFloat period) {
    if ((progress *= 2) < 1) {
        return _elasticOut(progress, 0.5, amplitude, period);
    } else {
        return _elasticIn(progress - 1, 0.5f, 0.5f, 1, amplitude, period);
    }
}

#pragma mark - External Functions Declarations

CGFloat elasticIn(CGFloat progress, CGFloat amplitude, CGFloat period) {
    return in(progress, amplitude, period);
}

CGFloat elasticOut(CGFloat progress, CGFloat amplitude, CGFloat period) {
    return out(progress, amplitude, period);
}

CGFloat elasticInOut(CGFloat progress, CGFloat amplitude, CGFloat period) {
    return inOut(progress, amplitude, period);
}

CGFloat elasticOutIn(CGFloat progress, CGFloat amplitude, CGFloat period) {
    return outIn(progress, amplitude, period);
}

@interface ESQElasticEasingFunction()

@property (copy, nonatomic) CGFloat(^easingBlock)(CGFloat progress);

@end

@implementation ESQElasticEasingFunction

#pragma mark - Lifecycle

+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type {
    return [self easingFunctionWithType:type amplitude:ESQDefaultElasticAmplitude period:ESQDefaultElasticPeriod];
}

- (instancetype)initWithType:(ESQEasingFunctionType)type {
    return [self initWithType:type amplitude:ESQDefaultElasticAmplitude period:ESQDefaultElasticPeriod];
}

+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type amplitude:(CGFloat)amplitude period:(CGFloat)period {
    ESQElasticEasingFunction *result = [[ESQElasticEasingFunction alloc] initWithType:type
                                                                            amplitude:amplitude
                                                                               period:period];
    return result;
}

- (instancetype)initWithType:(ESQEasingFunctionType)type amplitude:(CGFloat)amplitude period:(CGFloat)period {
    self = [super initWithType:type];
    if (self) {
        _amplitude = amplitude;
        _period = period;
    }
    return self;
}

#pragma mark - Overrides

+ (NSString *)description {
    return @"Elastic";
}

#pragma mark - Accessors

- (void)setType:(ESQEasingFunctionType)type {
    [super setType:type];
    
    typeof(self) __weak weakSelf = self;
    switch (type) {
        case ESQEasingFunctionTypeIn: {
            self.easingBlock = ^CGFloat(CGFloat progress) {
                return in(progress, weakSelf.amplitude, weakSelf.period);
            };
        } break;
            
        case ESQEasingFunctionTypeOut: {
            self.easingBlock = ^CGFloat(CGFloat progress) {
                return out(progress, weakSelf.amplitude, weakSelf.period);
            };
        } break;
            
        case ESQEasingFunctionTypeInOut: {
            self.easingBlock = ^CGFloat(CGFloat progress) {
                return inOut(progress, weakSelf.amplitude, weakSelf.period);
            };
        } break;
            
        case ESQEasingFunctionTypeOutIn: {
            self.easingBlock = ^CGFloat(CGFloat progress) {
                return outIn(progress, weakSelf.amplitude, weakSelf.period);
            };
        } break;
    }
}

#pragma mark - ESQEasingFunctionProtocol

- (CGFloat)easedProgress:(CGFloat)progress {
    return self.easingBlock(progress);
}

@end
