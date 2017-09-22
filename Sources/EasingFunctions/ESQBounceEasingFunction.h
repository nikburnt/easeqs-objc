//
//  ESQBounceEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

static const CGFloat ESQDefaultBounceOvershotValue = .7f;

CGFloat bounceIn(CGFloat progress, CGFloat overshoot);
CGFloat bounceOut(CGFloat progress, CGFloat overshoot);
CGFloat bounceInOut(CGFloat progress, CGFloat overshoot);
CGFloat bounceOutIn(CGFloat progress, CGFloat overshoot);

@interface ESQBounceEasingFunction : ESQEasingFunction

@property (assign, nonatomic) CGFloat overshoot;

+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type overshoot:(CGFloat)overshoot;
- (instancetype)initWithType:(ESQEasingFunctionType)type overshoot:(CGFloat)overshoot;

@end
