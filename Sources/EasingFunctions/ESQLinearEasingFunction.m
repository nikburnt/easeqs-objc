//
//  ESQLinearEasingFunction.m
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQLinearEasingFunction.h"

@implementation ESQLinearEasingFunction

#pragma mark - External Functions Declarations

CGFloat linearIn(CGFloat progress) {
    return progress;
}

CGFloat linearOut(CGFloat progress) {
    return progress;
}

CGFloat linearInOut(CGFloat progress) {
    return progress;
}

CGFloat linearOutIn(CGFloat progress) {
    return progress;
}

#pragma mark - Overrides

+ (NSString *)description {
    return @"Linear";
}

#pragma mark - ESQEasingFunctionProtocol

- (CGFloat)easedProgress:(CGFloat)progress {
    return progress;
}

@end
