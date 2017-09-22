//
//  ESQBackEasingFunction.m
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQBackEasingFunction.h"

static const CGFloat ESQOvershootMultiplier = 1.525f;

#pragma mark - Inline

NS_INLINE CGFloat in(CGFloat progress, CGFloat overshoot) {
    return progress * progress * (progress + progress * overshoot - overshoot);
}

NS_INLINE CGFloat out(CGFloat progress, CGFloat overshoot) {
    return (progress -= 1) * progress * (progress + progress * overshoot + overshoot) + 1;
}

NS_INLINE CGFloat inOut(CGFloat progress, CGFloat overshoot) {
    if ((progress *= 2) < 1) {
        return in(progress, overshoot * ESQOvershootMultiplier + 1) / 2;
    } else {
        return (out(progress - 1, overshoot * ESQOvershootMultiplier + 1) - 1) / 2 + 1;
    }
}

NS_INLINE CGFloat outIn(CGFloat progress, CGFloat overshoot) {
    if ((progress *= 2) < 1) {
        return out(progress, overshoot) / 2;
    } else {
        return (in(progress - 1, overshoot) + 1) / 2;
    }
}

#pragma mark - External Functions Declarations

CGFloat backIn(CGFloat progress, CGFloat overshoot) {
    return in(progress, overshoot);
}

CGFloat backOut(CGFloat progress, CGFloat overshoot) {
    return out(progress, overshoot);
}

CGFloat backInOut(CGFloat progress, CGFloat overshoot) {
    return inOut(progress, overshoot);
}

CGFloat backOutIn(CGFloat progress, CGFloat overshoot) {
    return outIn(progress, overshoot);
}

@interface ESQBackEasingFunction()

@property (copy, nonatomic) CGFloat(^easingBlock)(CGFloat progress);

@end

@implementation ESQBackEasingFunction

#pragma mark - Lifecycle

+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type {
    return [self easingFunctionWithType:type overshoot:ESQDefaultBackOvershotValue];
}

- (instancetype)initWithType:(ESQEasingFunctionType)type {
    return [self initWithType:type overshoot:ESQDefaultBackOvershotValue];
}

+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type overshoot:(CGFloat)overshoot {
    ESQBackEasingFunction *result = [[ESQBackEasingFunction alloc]
            initWithType:type overshoot:overshoot];
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
    return @"Back";
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
