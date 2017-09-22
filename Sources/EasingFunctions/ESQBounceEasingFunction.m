//
//  ESQBounceEasingFunction.m
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQBounceEasingFunction.h"

static const CGFloat ESQTwoSeventyFivePowTwo = 7.5625f;

static const CGFloat ESQBounceFirstStepLimit = .363636f;

static const CGFloat ESQBounceSecondStepLimit = .727273f;
static const CGFloat ESQBounceSecondStepProgressShift = .545455f;
static const CGFloat ESQBounceSecondStepShift = .75f;

static const CGFloat ESQBounceThirdStepLimit = .909091f;
static const CGFloat ESQBounceThirdStepProgressShift = .818182f;
static const CGFloat ESQBounceThirdStepShift = .9375f;

static const CGFloat ESQBounceFourthStepProgressShift = .954545f;
static const CGFloat ESQBounceFourthStepShift = .984375f;

#pragma mark - Inline

NS_INLINE CGFloat bounceIntermediateValue(CGFloat progress) {
    return ESQTwoSeventyFivePowTwo * progress * progress;
}

NS_INLINE CGFloat bounce(CGFloat progress, CGFloat delta, CGFloat overshoot) {
    if (progress == 1) {
        return delta;
    }
    
    if (progress < ESQBounceFirstStepLimit) {
        return delta * bounceIntermediateValue(progress);
    } else if (progress < ESQBounceSecondStepLimit) {
        return ((bounceIntermediateValue(progress - ESQBounceSecondStepProgressShift) + ESQBounceSecondStepShift) - 1)
                * overshoot + delta;
    } else if (progress < ESQBounceThirdStepLimit) {
        return ((bounceIntermediateValue(progress - ESQBounceThirdStepProgressShift) + ESQBounceThirdStepShift) - 1)
                * overshoot + delta;
    } else {
        return ((bounceIntermediateValue(progress - ESQBounceFourthStepProgressShift) + ESQBounceFourthStepShift) - 1)
                * overshoot + delta;
    }
}

NS_INLINE CGFloat in(CGFloat progress, CGFloat overshoot) {
    return 1 - bounce(1 - progress, 1, overshoot);
}

NS_INLINE CGFloat out(CGFloat progress, CGFloat overshoot) {
    return bounce(progress, 1, overshoot);
}

NS_INLINE CGFloat inOut(CGFloat progress, CGFloat overshoot) {
    if ((progress *= 2) < 1) {
        return in(progress, overshoot) / 2;
    } else {
        return progress == 2 ? 1 : (out(progress - 1, overshoot) + 1) / 2;
    }
}

NS_INLINE CGFloat outIn(CGFloat progress, CGFloat overshoot) {
    if ((progress *= 2) < 1) {
        return bounce(progress, .5f, overshoot);
    } else {
        return 1 - bounce(2 - progress, .5f, overshoot);
    }
}

#pragma mark - External Functions Declarations

CGFloat bounceIn(CGFloat progress, CGFloat overshoot) {
    return in(progress, overshoot);
}

CGFloat bounceOut(CGFloat progress, CGFloat overshoot) {
    return out(progress, overshoot);
}

CGFloat bounceInOut(CGFloat progress, CGFloat overshoot) {
    return inOut(progress, overshoot);
}

CGFloat bounceOutIn(CGFloat progress, CGFloat overshoot) {
    return outIn(progress, overshoot);
}

@interface ESQBounceEasingFunction()

@property (copy, nonatomic) CGFloat(^easingBlock)(CGFloat progress);

@end

@implementation ESQBounceEasingFunction

#pragma mark - Lifecycle

+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type {
    return [self easingFunctionWithType:type overshoot:ESQDefaultBounceOvershotValue];
}

- (instancetype)initWithType:(ESQEasingFunctionType)type {
    return [self initWithType:type overshoot:ESQDefaultBounceOvershotValue];
}

+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type overshoot:(CGFloat)overshoot {
    ESQBounceEasingFunction *result = [[ESQBounceEasingFunction alloc] initWithType:type overshoot:overshoot];
    return result;
}

- (instancetype)initWithType:(ESQEasingFunctionType)type overshoot:(CGFloat)overshoot {
    self = [super initWithType:type];
    if (self) {
        _overshoot = overshoot;
    }
    return self;
}

#pragma mark - Overrides

+ (NSString *)description {
    return @"Bounce";
}

#pragma mark - Accessors

- (void)setType:(ESQEasingFunctionType)type {
    [super setType:type];
    
    typeof(self) __weak weakSelf = self;
    switch (type) {
        case ESQEasingFunctionTypeIn: {
            self.easingBlock = ^CGFloat(CGFloat progress) {
                return in(progress, weakSelf.overshoot);
            };
        } break;
            
        case ESQEasingFunctionTypeOut: {
            self.easingBlock = ^CGFloat(CGFloat progress) {
                return out(progress, weakSelf.overshoot);
            };
        } break;
            
        case ESQEasingFunctionTypeInOut: {
            self.easingBlock = ^CGFloat(CGFloat progress) {
                return inOut(progress, weakSelf.overshoot);
            };
        } break;
            
        case ESQEasingFunctionTypeOutIn: {
            self.easingBlock = ^CGFloat(CGFloat progress) {
                return outIn(progress, weakSelf.overshoot);
            };
        } break;
    }
}

#pragma mark - ESQEasingFunctionProtocol

- (CGFloat)easedProgress:(CGFloat)progress {
    return self.easingBlock(progress);
}

@end
