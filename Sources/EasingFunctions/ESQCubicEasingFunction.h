//
//  ESQCubicEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

CGFloat cubicIn(CGFloat progress);
CGFloat cubicOut(CGFloat progress);
CGFloat cubicInOut(CGFloat progress);
CGFloat cubicOutIn(CGFloat progress);

@interface ESQCubicEasingFunction : ESQEasingFunction

@end
