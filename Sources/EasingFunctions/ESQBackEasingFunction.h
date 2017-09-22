//
//  ESQBackEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

static const CGFloat ESQDefaultBackOvershotValue = 1.70158f;

CGFloat backIn(CGFloat progress, CGFloat overshoot);
CGFloat backOut(CGFloat progress, CGFloat overshoot);
CGFloat backInOut(CGFloat progress, CGFloat overshoot);
CGFloat backOutIn(CGFloat progress, CGFloat overshoot);

@interface ESQBackEasingFunction : ESQEasingFunction

@property (assign, nonatomic) CGFloat overshoot;

+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type overshoot:(CGFloat)overshoot;
- (instancetype)initWithType:(ESQEasingFunctionType)type overshoot:(CGFloat)overshoot;

@end
