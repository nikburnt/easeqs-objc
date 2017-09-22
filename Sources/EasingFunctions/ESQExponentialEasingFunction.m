//
//  ESQExponentialEasingFunction.m
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQExponentialEasingFunction.h"

#pragma mark - Inline

NS_INLINE CGFloat in(CGFloat progress) {
    return progress == 0 ? 0 : powf(2, 10 * (progress - 1));
}

NS_INLINE CGFloat out(CGFloat progress) {
    return progress == 1 ? 1 : 1 - powf(2, -10 * progress);
}

NS_INLINE CGFloat inOut(CGFloat progress) {
    if (progress == 0) {
        return 0;
    }
    
    if (progress == 1) {
        return 1;
    }
    
    if ((progress *= 2) < 1) {
        return powf(2, 10 * (progress - 1)) / 2;
    } else {
        return 1 - powf(2, -10 * (progress - 1)) / 2;
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

CGFloat exponentialIn(CGFloat progress) {
    return in(progress);
}

CGFloat exponentialOut(CGFloat progress) {
    return out(progress);
}

CGFloat exponentialInOut(CGFloat progress) {
    return inOut(progress);
}

CGFloat exponentialOutIn(CGFloat progress) {
    return outIn(progress);
}

@interface ESQExponentialEasingFunction()

@property (copy, nonatomic) CGFloat(^easingBlock)(CGFloat progress);

@end

@implementation ESQExponentialEasingFunction

#pragma mark - Overrides

+ (NSString *)description {
    return @"Exponential";
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
