//
//  ESQQuarticEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

/**
 Quartic easing function that used to ease values for ESQQuarticEasingFunction with ESQEasingFunctionTypeIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat quarticIn(CGFloat progress);

/**
 Quartic easing function that used to ease values for ESQQuarticEasingFunction with ESQEasingFunctionTypeOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat quarticOut(CGFloat progress);

/**
 Quartic easing function that used to ease values for ESQQuarticEasingFunction with ESQEasingFunctionTypeInOut type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat quarticInOut(CGFloat progress);

/**
 Quartic easing function that used to ease values for ESQQuarticEasingFunction with ESQEasingFunctionTypeOutIn type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 
 @param progress
     initial progress from 0 to 1 that should be eased using this function
 @return
     eased progress value
 */
CGFloat quarticOutIn(CGFloat progress);

/**
 Quartic easing function represented by $$p^4$$ easing funciton where p is a progress for ESQEasingFunctionTypeIn and corresponding transformation for each other type
 More information and easing curves examples can be founded on the [homepage](https://github.com/nikburnt/easeqs-objc)
 */
@interface ESQQuarticEasingFunction : ESQEasingFunction

@end
