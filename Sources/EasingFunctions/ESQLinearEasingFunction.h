//
//  ESQLinearEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

CGFloat linearIn(CGFloat progress);
CGFloat linearOut(CGFloat progress);
CGFloat linearInOut(CGFloat progress);
CGFloat linearOutIn(CGFloat progress);

@interface ESQLinearEasingFunction : ESQEasingFunction

@end
