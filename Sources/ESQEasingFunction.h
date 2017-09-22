//
//  ESQEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

@import UIKit;

typedef CGFloat (*ESQEasingCFunction)(CGFloat progress, ...);

typedef NS_ENUM(NSUInteger, ESQEasingFunctionType) {
    ESQEasingFunctionTypeIn = 0,
    ESQEasingFunctionTypeOut,
    ESQEasingFunctionTypeInOut,
    ESQEasingFunctionTypeOutIn,
};

@interface ESQEasingFunction : NSObject

@property (assign, nonatomic) ESQEasingFunctionType type;
@property (assign, nonatomic, readonly) ESQEasingFunctionType defaultType;

+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type;
- (instancetype)initWithType:(ESQEasingFunctionType)type;

- (CGFloat)easedProgress:(CGFloat)progress;

@end
