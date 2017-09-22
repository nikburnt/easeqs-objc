//
//  ESQSinusoidalEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingFunction.h"

CGFloat sinusoidalIn(CGFloat progress);
CGFloat sinusoidalOut(CGFloat progress);
CGFloat sinusoidalInOut(CGFloat progress);
CGFloat sinusoidalOutIn(CGFloat progress);

@interface ESQSinusoidalEasingFunction : ESQEasingFunction

@end
