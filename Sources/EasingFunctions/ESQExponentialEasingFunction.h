//
//  ESQExponentialEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

/**
 Exponential easing function that used to ease values for ESQExponentialEasingFunction with ESQEasingFunctionTypeIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat exponentialIn(CGFloat progress);

/**
 Exponential easing function that used to ease values for ESQExponentialEasingFunction with ESQEasingFunctionTypeOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat exponentialOut(CGFloat progress);

/**
 Exponential easing function that used to ease values for ESQExponentialEasingFunction with ESQEasingFunctionTypeInOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat exponentialInOut(CGFloat progress);

/**
 Exponential easing function that used to ease values for ESQExponentialEasingFunction with ESQEasingFunctionTypeOutIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat exponentialOutIn(CGFloat progress);

/**
 Exponential easing function represented by $$2^{10(p-1)}$$ easing funciton where p is a progress for ESQEasingFunctionTypeIn and corresponding transformation for each other type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 */
@interface ESQExponentialEasingFunction : ESQEasingFunction

@end
