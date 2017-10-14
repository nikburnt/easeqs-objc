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

/**
 Elastic easing function that used to ease values for ESQElasticEasingFunction with ESQEasingFunctionTypeIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @param amplitude
     property that specify how big function curve ocilation amplitude will be
 @param period
     property that specify the length of function curve oscillation
 @return
     eased progress value
 */
CGFloat elasticIn(CGFloat progress, CGFloat amplitude, CGFloat period);

/**
 Elastic easing function that used to ease values for ESQElasticEasingFunction with ESQEasingFunctionTypeOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @param amplitude
     property that specify how big function curve ocilation amplitude will be
 @param period
     property that specify the length of function curve oscillation
 @return
     eased progress value
 */
CGFloat elasticOut(CGFloat progress, CGFloat amplitude, CGFloat period);

/**
 Elastic easing function that used to ease values for ESQElasticEasingFunction with ESQEasingFunctionTypeInOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @param amplitude
     property that specify how big function curve ocilation amplitude will be
 @param period
     property that specify the length of function curve oscillation
 @return
     eased progress value
 */
CGFloat elasticInOut(CGFloat progress, CGFloat amplitude, CGFloat period);

/**
 Elastic easing function that used to ease values for ESQElasticEasingFunction with ESQEasingFunctionTypeOutIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @param amplitude
     property that specify how big function curve ocilation amplitude will be
 @param period
     property that specify the length of function curve oscillation
 @return
     eased progress value
 */
CGFloat elasticOutIn(CGFloat progress, CGFloat amplitude, CGFloat period);

/**
 Elastic easing function represented by easing funciton wit oscilation with controllable period and amlitude values
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 */
@interface ESQElasticEasingFunction : ESQEasingFunction

/**
 An amplitude property specify how big function curve ocilation amplitude will be
 */
@property (assign, nonatomic) CGFloat amplitude;

/**
 A period property specify the length of function curve oscillation
 */
@property (assign, nonatomic) CGFloat period;

/**
 Creates an instance of ESQElasticEasingFunction with specified type, amplitude and period
 
 @param type
     easing function type that specify the direction and position of easement on the resulting function
 @param amplitude
     property that specify how big function curve ocilation amplitude will be
 @param period
     property that specify the length of function curve oscillation
 @return
     new instance of ESQElasticEasingFunction
 */
+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type amplitude:(CGFloat)amplitude period:(CGFloat)period;

/**
 Initialize an instance of ESQElasticEasingFunction with specified type, amplitude and period
 
 @param type
     easing function type that specify the direction and position of easement on the resulting function
 @param amplitude
     property that specify how big function curve ocilation amplitude will be
 @param period
     property that specify the length of function curve oscillation
 @return
     new instance of ESQElasticEasingFunction
 */
- (instancetype)initWithType:(ESQEasingFunctionType)type amplitude:(CGFloat)amplitude period:(CGFloat)period;

@end
