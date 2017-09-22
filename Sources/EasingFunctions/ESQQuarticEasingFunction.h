//
//  ESQQuarticEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

CGFloat quarticIn(CGFloat progress);
CGFloat quarticOut(CGFloat progress);
CGFloat quarticInOut(CGFloat progress);
CGFloat quarticOutIn(CGFloat progress);

@interface ESQQuarticEasingFunction : ESQEasingFunction

@end
