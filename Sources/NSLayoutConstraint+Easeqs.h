//
//  NSLayoutConstraint+Easeqs.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

@interface NSLayoutConstraint (Easeqs)

- (void)esq_setConstant:(CGFloat)constant
    usingEasingFunction:(ESQEasingFunction *)esq_easingFunction
               duration:(NSTimeInterval)duration;

@end
