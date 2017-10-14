//
//  NSLayoutConstraint+Easeqs.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

/**
 Extension for NSLayoutConstraint to be used with ESQEasingFunction-s or their underlying C-functions for modifying constraints
 */
@interface NSLayoutConstraint (Easeqs)

/**
 Set constraint constant animated using specified easing funciton using CADisplayLink to synchronize animation with screen refresh rate

 @param constant
     new constant value that will be used to end interpolation(current value will be used to start interpolation)
 @param esq_easingFunction 
     timing function decorator, extension of ESQEasingFunction, defining the pacing of the animation
 @param duration
     the duration (measured in seconds) of the animation
 */
- (void)esq_setConstant:(CGFloat)constant
    usingEasingFunction:(ESQEasingFunction *)esq_easingFunction
               duration:(NSTimeInterval)duration;

@end
