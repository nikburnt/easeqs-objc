//
//  NSLayoutConstraint+Easeqs.m
//  easeqs-objc
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "NSLayoutConstraint+Easeqs.h"

#import <objc/runtime.h>

@interface  NSLayoutConstraint()

@property (strong, nonatomic) CADisplayLink *displayLink;
@property (strong, nonatomic) ESQEasingFunction *easingFunction;
@property (strong, nonatomic) NSNumber *initialConstant;
@property (strong, nonatomic) NSNumber *constantDelta;
@property (strong, nonatomic) NSNumber *animationEndTime;
@property (strong, nonatomic) NSNumber *animationDuration;

@property (strong, nonatomic) UIView *layoutingView;

@end

@implementation NSLayoutConstraint (Easeqs)

#pragma mark - Accessors

- (void)setEasingFunction:(ESQEasingFunction *)easingFunction {
    objc_setAssociatedObject(self, @selector(easingFunction), easingFunction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ESQEasingFunction *)easingFunction {
    return objc_getAssociatedObject(self, @selector(easingFunction));
}

- (void)setDisplayLink:(CADisplayLink *)displayLink {
    objc_setAssociatedObject(self, @selector(displayLink), displayLink, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CADisplayLink *)displayLink {
    return objc_getAssociatedObject(self, @selector(displayLink));
}

- (void)setInitialConstant:(NSNumber *)initialConstant {
    objc_setAssociatedObject(self, @selector(initialConstant), initialConstant, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)initialConstant {
    return objc_getAssociatedObject(self, @selector(initialConstant));
}

- (void)setConstantDelta:(NSNumber *)constantDelta {
    objc_setAssociatedObject(self, @selector(constantDelta), constantDelta, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)constantDelta {
    return objc_getAssociatedObject(self, @selector(constantDelta));
}

- (void)setAnimationEndTime:(NSNumber *)animationEndTime {
    objc_setAssociatedObject(self, @selector(animationEndTime), animationEndTime, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)animationEndTime {
    return objc_getAssociatedObject(self, @selector(animationEndTime));
}

- (void)setAnimationDuration:(NSNumber *)animationDuration {
    objc_setAssociatedObject(self, @selector(animationDuration), animationDuration, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)animationDuration {
    return objc_getAssociatedObject(self, @selector(animationDuration));
}

- (void)setLayoutingView:(UIView *)layoutingView {
    objc_setAssociatedObject(self, @selector(layoutingView), layoutingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)layoutingView {
    return objc_getAssociatedObject(self, @selector(layoutingView));
}

#pragma mark - Public

- (void)esq_setConstant:(CGFloat)constant
    usingEasingFunction:(ESQEasingFunction *)easingFunction
               duration:(NSTimeInterval)duration{
    if (self.constant == constant) {
        return;
    }

    if (self.displayLink) {
        [self freeResources];
    }

    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkTrigger:)];
    [self.displayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSDefaultRunLoopMode];

    self.easingFunction = easingFunction;

    self.initialConstant = @(self.constant);
    self.constantDelta = @(constant - self.constant);

    self.animationDuration = @(duration);

    UIView *view = nil;
    if ([self.firstItem isKindOfClass:UIView.class]) {
        view = (UIView *)self.firstItem;
    } else if ([self.secondItem isKindOfClass:UIView.class]) {
        view = (UIView *)self.secondItem;
    }
    self.layoutingView = view;
}

#pragma mark - Internal

- (void)displayLinkTrigger:(CADisplayLink *)displayLink {
    if (!self.animationEndTime) {
        NSTimeInterval animationEndTime = self.displayLink.timestamp + self.animationDuration.floatValue;
        self.animationEndTime = @(animationEndTime);
    }
    
    CGFloat progress = (CGFloat) (1 - (self.animationEndTime.floatValue - displayLink.timestamp)
                                  / self.animationDuration.floatValue);
    CGFloat easedProgress = [self.easingFunction easedProgress:progress];
    CGFloat currentConstant = self.initialConstant.floatValue + self.constantDelta.floatValue * easedProgress;
    self.constant = currentConstant;
    
    [self.layoutingView layoutIfNeeded];
    
    if (progress >= 1) {
        [self freeResources];
    }
}

- (void)freeResources {
    [self.displayLink invalidate];
    self.displayLink = nil;

    self.easingFunction = nil;
    self.initialConstant = nil;
    self.constantDelta = nil;
    self.animationEndTime = nil;
    self.animationDuration = nil;
}

@end
