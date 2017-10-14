//
//  ESQBounceEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

static const CGFloat ESQDefaultBounceOvershotValue = .7f;

/**
 Bounce easing function that used to ease values for ESQBounceEasingFunction with ESQEasingFunctionTypeIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @param overshoot
     specify height of bouncing multiplier
 @return
     eased progress value
 */
CGFloat bounceIn(CGFloat progress, CGFloat overshoot);

/**
 Bounce easing function that used to ease values for ESQBounceEasingFunction with ESQEasingFunctionTypeOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @param overshoot
     specify height of bouncing multiplier
 @return
     eased progress value
 */
CGFloat bounceOut(CGFloat progress, CGFloat overshoot);

/**
 Bounce easing function that used to ease values for ESQBounceEasingFunction with ESQEasingFunctionTypeInOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @param overshoot
     specify height of bouncing multiplier
 @return
     eased progress value
 */
CGFloat bounceInOut(CGFloat progress, CGFloat overshoot);

/**
 Bounce easing function that used to ease values for ESQBounceEasingFunction with ESQEasingFunctionTypeOutIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @param overshoot
     specify height of bouncing multiplier
 @return
     eased progress value
 */
CGFloat bounceOutIn(CGFloat progress, CGFloat overshoot);

/**
 Bounce easing function represented by four part bounce easing funciton with ability to control overshoot value that represent the height of bouncing multiplier
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 */
@interface ESQBounceEasingFunction : ESQEasingFunction

/**
 An overshoot property specify height of bouncing multiplier 
 */
@property (assign, nonatomic) CGFloat overshoot;

/**
 Creates an instance of ESQBounceEasingFunction with specified type and overshoot
 
 @param type
     easing function type that specify the direction and position of easement on the resulting function
 @return
     new instance of ESQBounceEasingFunction
 */
+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type overshoot:(CGFloat)overshoot;

/**
 Initialize an instance of ESQBounceEasingFunction with specified type and overshoot
 
 @param type
     easing function type that specify the direction and position of easement on the resulting function
 @return
     initialized instance of ESQBounceEasingFunction
 */
- (instancetype)initWithType:(ESQEasingFunctionType)type overshoot:(CGFloat)overshoot;

@end
