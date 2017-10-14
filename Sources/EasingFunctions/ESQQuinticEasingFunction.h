//
//  ESQQuinticEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

/**
 Quintic easing function that used to ease values for ESQQuinticEasingFunction with ESQEasingFunctionTypeIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat quinticIn(CGFloat progress);

/**
 Quintic easing function that used to ease values for ESQQuinticEasingFunction with ESQEasingFunctionTypeOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat quinticOut(CGFloat progress);

/**
 Quintic easing function that used to ease values for ESQQuinticEasingFunction with ESQEasingFunctionTypeInOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat quinticInOut(CGFloat progress);

/**
 Quintic easing function that used to ease values for ESQQuinticEasingFunction with ESQEasingFunctionTypeOutIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat quinticOutIn(CGFloat progress);

/**
 Quintic easing function represented by $$p^5$$ easing funciton where p is a progress for ESQEasingFunctionTypeIn and corresponding transformation for each other type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 */
@interface ESQQuinticEasingFunction : ESQEasingFunction

@end
