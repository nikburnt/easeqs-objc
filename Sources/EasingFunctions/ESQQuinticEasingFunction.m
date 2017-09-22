//
//  ESQQuinticEasingFunction.m
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQQuinticEasingFunction.h"

#pragma mark - Inline

NS_INLINE CGFloat in(CGFloat progress) {
    return progress * progress * progress * progress * progress;
}

NS_INLINE CGFloat out(CGFloat progress) {
    return (progress -= 1) * progress * progress * progress * progress + 1;
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

CGFloat quinticIn(CGFloat progress) {
    return in(progress);
}

CGFloat quinticOut(CGFloat progress) {
    return out(progress);
}

CGFloat quinticInOut(CGFloat progress) {
    return inOut(progress);
}

CGFloat quinticOutIn(CGFloat progress) {
    return outIn(progress);
}

@interface ESQQuinticEasingFunction()

@property (copy, nonatomic) CGFloat(^easingBlock)(CGFloat progress);

@end

@implementation ESQQuinticEasingFunction

#pragma mark - Overrides

+ (NSString *)description {
    return @"Quintic";
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
