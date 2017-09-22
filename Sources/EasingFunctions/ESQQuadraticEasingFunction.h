//
//  ESQQuadraticEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

CGFloat quadraticIn(CGFloat progress);
CGFloat quadraticOut(CGFloat progress);
CGFloat quadraticInOut(CGFloat progress);
CGFloat quadraticOutIn(CGFloat progress);

@interface ESQQuadraticEasingFunction : ESQEasingFunction

@end
