//
//  ESQCircularEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

/**
 Circular easing function that used to ease values for ESQCircularEasingFunction with ESQEasingFunctionTypeIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat circularIn(CGFloat progress);

/**
 Circular easing function that used to ease values for ESQCircularEasingFunction with ESQEasingFunctionTypeOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat circularOut(CGFloat progress);

/**
 Circular easing function that used to ease values for ESQCircularEasingFunction with ESQEasingFunctionTypeInOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat circularInOut(CGFloat progress);

/**
 Circular easing function that used to ease values for ESQCircularEasingFunction with ESQEasingFunctionTypeOutIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat circularOutIn(CGFloat progress);

/**
 Circular easing function represented by $$1-\sqrt{1-p^2}$$ easing funciton where p is a progress for ESQEasingFunctionTypeIn and corresponding transformation for each other type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 */
@interface ESQCircularEasingFunction : ESQEasingFunction

@end
