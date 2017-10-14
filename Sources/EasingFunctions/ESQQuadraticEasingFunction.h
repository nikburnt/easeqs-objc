//
//  ESQQuadraticEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

/**
 Quadratic easing function that used to ease values for ESQQuadraticEasingFunction with ESQEasingFunctionTypeIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat quadraticIn(CGFloat progress);

/**
 Quadratic easing function that used to ease values for ESQQuadraticEasingFunction with ESQEasingFunctionTypeOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat quadraticOut(CGFloat progress);

/**
 Quadratic easing function that used to ease values for ESQQuadraticEasingFunction with ESQEasingFunctionTypeInOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat quadraticInOut(CGFloat progress);

/**
 Quadratic easing function that used to ease values for ESQQuadraticEasingFunction with ESQEasingFunctionTypeOutIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat quadraticOutIn(CGFloat progress);

/**
 Quadratic easing function represented by $$p^2$$ easing funciton where p is a progress for ESQEasingFunctionTypeIn and corresponding transformation for each other type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 */
@interface ESQQuadraticEasingFunction : ESQEasingFunction

@end
