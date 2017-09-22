//
//  ESQCubicEasingFunction.m
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQCubicEasingFunction.h"

#pragma mark - Inline

NS_INLINE CGFloat in(CGFloat progress) {
    return progress * progress * progress;
}

NS_INLINE CGFloat out(CGFloat progress) {
    return (progress -= 1) * progress * progress + 1;
}

NS_INLINE CGFloat inOut(CGFloat progress) {
    if ((progress *= 2) < 1) {
        return in(progress) / 2;
    } else {
        return in(progress - 2) / 2 + 1;
    }
}

NS_INLINE CGFloat outIn(CGFloat progress) {
    if ((progress *= 2) < 1) {
        return out(progress) / 2;
    } else {
        return (in(progress - 1) + 1) / 2;
    }
}

#pragma mark - External Functions Declarations

CGFloat cubicIn(CGFloat progress) {
    return in(progress);
}

CGFloat cubicOut(CGFloat progress) {
    return out(progress);
}

CGFloat cubicInOut(CGFloat progress) {
    return inOut(progress);
}

CGFloat cubicOutIn(CGFloat progress) {
    return outIn(progress);
}

@interface ESQCubicEasingFunction()

@property (copy, nonatomic) CGFloat(^easingBlock)(CGFloat progress);

@end

@implementation ESQCubicEasingFunction

#pragma mark - Overrides

+ (NSString *)description {
    return @"Cubic";
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
