//
//  ESQCircularEasingFunction.m
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQCircularEasingFunction.h"

#pragma mark - Inline

NS_INLINE CGFloat in(CGFloat progress) {
    return 1 - sqrtf(1 - progress * progress);
}

NS_INLINE CGFloat out(CGFloat progress) {
    return sqrtf(1 - (progress -= 1) * progress);
}

NS_INLINE CGFloat inOut(CGFloat progress) {
    if ((progress *= 2) < 1) {
        return in(progress) / 2;
    } else {
        return (sqrtf(1 - (progress -= 2) * progress) + 1) / 2;
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

CGFloat circularIn(CGFloat progress) {
    return in(progress);
}

CGFloat circularOut(CGFloat progress) {
    return out(progress);
}

CGFloat circularInOut(CGFloat progress) {
    return inOut(progress);
}

CGFloat circularOutIn(CGFloat progress) {
    return outIn(progress);
}

@interface ESQCircularEasingFunction()

@property (copy, nonatomic) CGFloat(^easingBlock)(CGFloat progress);

@end

@implementation ESQCircularEasingFunction

#pragma mark - Overrides

+ (NSString *)description {
    return @"Circular";
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
