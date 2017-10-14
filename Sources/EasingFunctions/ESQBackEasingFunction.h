//
//  ESQBackEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

static const CGFloat ESQDefaultBackOvershotValue = 1.70158f;

/**
 Back easing function that used to ease values for ESQBackEasingFunction with ESQEasingFunctionTypeIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)

 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @param overshoot
     specify how much function curve will get takeoff before grow up
 @return
     eased progress value
 */
CGFloat backIn(CGFloat progress, CGFloat overshoot);

/**
 Back easing function that used to ease values for ESQBackEasingFunction with ESQEasingFunctionTypeOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)

 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @param overshoot
     specify how much function curve will get takeoff before grow up
 @return
     eased progress value
 */
CGFloat backOut(CGFloat progress, CGFloat overshoot);

/**
 Back easing function that used to ease values for ESQBackEasingFunction with ESQEasingFunctionTypeInOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)

 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @param overshoot
     specify how much function curve will get takeoff before grow up
 @return
     eased progress value
 */
CGFloat backInOut(CGFloat progress, CGFloat overshoot);

/**
 Back easing function that used to ease values for ESQBackEasingFunction with ESQEasingFunctionTypeOutIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)

 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @param overshoot
     specify how much function curve will get takeoff before grow up
 @return
     eased progress value
 */
CGFloat backOutIn(CGFloat progress, CGFloat overshoot);

/**
 Back easing function represented by $$p^2_(p + po - o)$$ easing funciton where p is a progress and o is an overshoot for ESQEasingFunctionTypeIn and corresponding transformation for each other type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 */
@interface ESQBackEasingFunction : ESQEasingFunction

/**
 An overshoot property specify how much function curve will get takeoff before grow up
 */
@property (assign, nonatomic) CGFloat overshoot;

/**
 Creates an instance of ESQBackEasingFunction with specified type and overshoot
 
 @param type
     easing function type that specify the direction and position of easement on the resulting function
 @param overshoot
     property that specify how much function curve will get takeoff before grow up
 @return
     new instance of ESQBackEasingFunction
 */
+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type overshoot:(CGFloat)overshoot;

/**
 Initialize an instance of ESQBackEasingFunction with specified type and overshoot
 
 @param type
     easing function type that specify the direction and position of easement on the resulting function
 @param overshoot
     property that specify how much function curve will get takeoff before grow up
 @return
     initialized instance of ESQBackEasingFunction
 */
- (instancetype)initWithType:(ESQEasingFunctionType)type overshoot:(CGFloat)overshoot;

@end
