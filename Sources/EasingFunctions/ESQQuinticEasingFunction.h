//
//  ESQQuinticEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

CGFloat quinticIn(CGFloat progress);
CGFloat quinticOut(CGFloat progress);
CGFloat quinticInOut(CGFloat progress);
CGFloat quinticOutIn(CGFloat progress);

@interface ESQQuinticEasingFunction : ESQEasingFunction

@end
