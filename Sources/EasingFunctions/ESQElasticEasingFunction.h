//
//  ESQElasticEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

static const CGFloat ESQDefaultElasticAmplitude = .1f;
static const CGFloat ESQDefaultElasticPeriod = .3f;

CGFloat elasticIn(CGFloat progress, CGFloat amplitude, CGFloat period);
CGFloat elasticOut(CGFloat progress, CGFloat amplitude, CGFloat period);
CGFloat elasticInOut(CGFloat progress, CGFloat amplitude, CGFloat period);
CGFloat elasticOutIn(CGFloat progress, CGFloat amplitude, CGFloat period);

@interface ESQElasticEasingFunction : ESQEasingFunction

@property (assign, nonatomic) CGFloat amplitude;
@property (assign, nonatomic) CGFloat period;

+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type amplitude:(CGFloat)amplitude period:(CGFloat)period;
- (instancetype)initWithType:(ESQEasingFunctionType)type amplitude:(CGFloat)amplitude period:(CGFloat)period;

@end
