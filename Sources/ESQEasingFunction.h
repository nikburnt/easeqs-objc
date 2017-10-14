//
//  ESQEasingFunction.h
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

@import UIKit;

/**
 Define the type of C easing funciton that should take at least one perameter as progress and various number of parameters as modifyers
 */
typedef CGFloat (*ESQEasingCFunction)(CGFloat progress, ...);


/**
 Easing function type that specify the direction and position of easement on the resulting function

 - ESQEasingFunctionTypeIn:
     easement take whole funciton and directed forward
 - ESQEasingFunctionTypeOut:
     easement take whole function and directed backward
 - ESQEasingFunctionTypeInOut:
     has two easements, first located at the beginning of the function and directed forward, second located at the end of the function and directed backward
 - ESQEasingFunctionTypeOutIn: 
     has two easements, first located at the beginning of the function and directed backward, second located at the end of the function and directed forward
 */
typedef NS_ENUM(NSUInteger, ESQEasingFunctionType) {
    ESQEasingFunctionTypeIn = 0,
    ESQEasingFunctionTypeOut,
    ESQEasingFunctionTypeInOut,
    ESQEasingFunctionTypeOutIn,
};

/**
 Base class for easing funcitons, should not be used without subclassing and overriding [ESQEasingFunction easedProgress:]
 @exception NSInvalidArgumentException
     if used without overriding [ESQEasingFunction easedProgress:]
 */
@interface ESQEasingFunction : NSObject

/**
 Easing function type that specify the direction and position of easement on the resulting function
 */
@property (assign, nonatomic) ESQEasingFunctionType type;

/**
 Default easing function type that specify the direction and position of easement on the resulting function
 */
@property (assign, nonatomic, readonly) ESQEasingFunctionType defaultType;

/**
 Creates an instance of ESQEasingFunction with specified type

 @param type
     easing function type that specify the direction and position of easement on the resulting function
 @return
     new instance of ESQEasingFunction
 */
+ (instancetype)easingFunctionWithType:(ESQEasingFunctionType)type;

/**
 Initialize an instance of ESQEasingFunction with specified type

 @param type
     easing function type that specify the direction and position of easement on the resulting function
 @return
     initialized instance of ESQEasingFunction
 */
- (instancetype)initWithType:(ESQEasingFunctionType)type;

/**
 This method should be overrided in subclass and should return eased progress using concrete easing function

 @param progress
     progress value from 0 to 1
 @return
     eased progress value
 */
- (CGFloat)easedProgress:(CGFloat)progress;

@end
