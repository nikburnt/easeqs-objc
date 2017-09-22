//
//  ESQExponentialEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

CGFloat exponentialIn(CGFloat progress);
CGFloat exponentialOut(CGFloat progress);
CGFloat exponentialInOut(CGFloat progress);
CGFloat exponentialOutIn(CGFloat progress);

@interface ESQExponentialEasingFunction : ESQEasingFunction

@end
