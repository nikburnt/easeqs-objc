//
//  ESQEasingFunction.m
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

static const NSUInteger ESQDefaultEasingFunctionType = ESQEasingFunctionTypeOut;

@implementation ESQEasingFunction

#pragma mark - Lifecycle

- (instancetype)init {
    self = [self initWithType:self.defaultType];
    return self;
}

+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type {
    ESQEasingFunction *result = [((ESQEasingFunction *)[self alloc]) initWithType:type];
    return result;
}

- (instancetype)initWithType:(ESQEasingFunctionType)type {
    self = [super init];
    if (self) {
        switch (type) {
            case ESQEasingFunctionTypeIn:
            case ESQEasingFunctionTypeOut:
            case ESQEasingFunctionTypeInOut:
            case ESQEasingFunctionTypeOutIn:
                self.type = type;
                break;
                
            default:
                self.type = self.defaultType;
                break;
        }
    }
    return self;
}

#pragma mark - Overrides

- (NSString *)description {
    return self.class.description;
}

#pragma mark - Accessors

- (ESQEasingFunctionType)defaultType {
    return ESQDefaultEasingFunctionType;
}

#pragma mark - Public

- (CGFloat)easedProgress:(CGFloat)progress {
    [self doesNotRecognizeSelector:_cmd];
    return 0;
}

@end
