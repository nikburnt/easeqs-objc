//
//  ESQExampleEasingSettings.h
//  easeqs-objc-example
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

@import Foundation;

@interface ESQExampleEasingSettings : NSObject

@property (strong, nonatomic) ESQEasingFunction *xEasingFunction;
@property (strong, nonatomic) ESQEasingFunction *yEasingFunction;

@property (assign, nonatomic) BOOL useTheSameEasingFunctionForXAndY;

+ (instancetype)defaultSettings;

@end
