//
//  ESQCircularEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

CGFloat circularIn(CGFloat progress);
CGFloat circularOut(CGFloat progress);
CGFloat circularInOut(CGFloat progress);
CGFloat circularOutIn(CGFloat progress);

@interface ESQCircularEasingFunction : ESQEasingFunction

@end
