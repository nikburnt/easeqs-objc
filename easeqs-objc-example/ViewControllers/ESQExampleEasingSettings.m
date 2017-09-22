//
//  ESQExampleEasingSettings.m
//  easeqs-objc-example
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQExampleEasingSettings.h"

#import "ESQLinearEasingFunction.h"

@implementation ESQExampleEasingSettings

#pragma mark - Public

+ (instancetype)defaultSettings {
    ESQExampleEasingSettings *result = [[ESQExampleEasingSettings alloc] init];
    
    result.xEasingFunction = [[ESQLinearEasingFunction alloc] initWithType:ESQEasingFunctionTypeInOut];
    result.yEasingFunction = [[ESQLinearEasingFunction alloc] initWithType:ESQEasingFunctionTypeInOut];
    
    result.useTheSameEasingFunctionForXAndY = YES;
    
    return result;
}

@end
