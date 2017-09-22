//
//  ESQSinusoidalEasingFunction.m
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQSinusoidalEasingFunction.h"

#pragma mark - Inline

NS_INLINE CGFloat in(CGFloat progress) {
    return 1 - cosf(progress * (CGFloat)M_PI_2);
}

NS_INLINE CGFloat out(CGFloat progress) {
    return sinf(progress * (CGFloat)M_PI_2);
}

NS_INLINE CGFloat inOut(CGFloat progress) {
    return (1 - cosf((CGFloat)M_PI * progress )) / 2;
}

NS_INLINE CGFloat outIn(CGFloat progress) {
    if ((progress *= 2) < 1) {
        return out(progress) / 2;
    } else {
        return (in(progress - 1 ) + 1) / 2;
    }
}

#pragma mark - External Functions Declarations

CGFloat sinusoidalIn(CGFloat progress) {
    return in(progress);
}

CGFloat sinusoidalOut(CGFloat progress) {
    return out(progress);
}

CGFloat sinusoidalInOut(CGFloat progress) {
    return inOut(progress);
}

CGFloat sinusoidalOutIn(CGFloat progress) {
    return outIn(progress);
}

@interface ESQSinusoidalEasingFunction()

@property (copy, nonatomic) CGFloat(^easingBlock)(CGFloat progress);

@end

@implementation ESQSinusoidalEasingFunction

#pragma mark - Overrides

+ (NSString *)description {
    return @"Sinusoidal";
}

#pragma mark - Accessors

- (void)setType:(ESQEasingFunctionType)type {
    [super setType:type];
    
    switch (type) {
        case ESQEasingFunctionTypeIn:
            self.easingBlock = ^CGFloat(CGFloat progress) {
                return in(progress);
            };
            break;
            
        case ESQEasingFunctionTypeOut:
            self.easingBlock = ^CGFloat(CGFloat progress) {
                return out(progress);
            };
            break;
            
        case ESQEasingFunctionTypeInOut:
            self.easingBlock = ^CGFloat(CGFloat progress) {
                return inOut(progress);
            };
            break;
            
        case ESQEasingFunctionTypeOutIn:
            self.easingBlock = ^CGFloat(CGFloat progress) {
                return outIn(progress);
            };
            break;
    }
}

#pragma mark - ESQEasingFunctionProtocol

- (CGFloat)easedProgress:(CGFloat)progress {
    return self.easingBlock(progress);
}

@end
