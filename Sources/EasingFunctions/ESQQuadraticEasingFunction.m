//
//  ESQQuadraticEasingFunction.m
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQQuadraticEasingFunction.h"

#pragma mark - Inline

NS_INLINE CGFloat in(CGFloat progress) {
    return progress * progress;
}

NS_INLINE CGFloat out(CGFloat progress) {
    return progress * (2 - progress);
}

NS_INLINE CGFloat inOut(CGFloat progress) {
    if ((progress *= 2) < 1) {
        return in(progress) / 2;
    } else {
        return (1 + out(progress - 1)) / 2;
    }
}

NS_INLINE CGFloat outIn(CGFloat progress) {
    if ((progress *= 2) < 1) {
        return out(progress) * 0.5f;
    } else {
        return in(progress - 1) * 0.5f + 0.5f;
    }
}

#pragma mark - External Functions Declarations

CGFloat quadraticIn(CGFloat progress) {
    return in(progress);
}

CGFloat quadraticOut(CGFloat progress) {
    return out(progress);
}

CGFloat quadraticInOut(CGFloat progress) {
    return inOut(progress);
}

CGFloat quadraticOutIn(CGFloat progress) {
    return outIn(progress);
}

@interface ESQQuadraticEasingFunction()

@property (copy, nonatomic) CGFloat(^easingBlock)(CGFloat progress);

@end

@implementation ESQQuadraticEasingFunction

#pragma mark - Overrides

+ (NSString *)description {
    return @"Quadratic";
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
