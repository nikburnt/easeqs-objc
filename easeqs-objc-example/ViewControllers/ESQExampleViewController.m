//
//  ESQExampleViewController.m
//  easeqs-objc-example
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQExampleViewController.h"

#import "ESQEasingSelectionViewController.h"

static const CGFloat ESQStartDelay = .5f;
static const CGFloat ESQBeginAnimationDuration = .75f;
static const CGFloat ESQExampleMoveAnimationDuration = .75f;

static const CGFloat ESQMovingCircleRadius = 13.f;

static const NSUInteger ESQNumberOfSamples = 11;

static NSString * const ESQSelectEasingSegue = @"selectEasing";

static NSString * const ESQPositionAnimationKeyFormat = @"positionAnimation%lu";

@interface ESQExampleViewController () <ESQEasingSelectionViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *easingFunctionsSettingsButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *captionLabelYConstraint;

@property (strong, nonatomic) ESQExampleEasingSettings *settings;

@property (strong, nonatomic) CALayer *movingCircle;

@property (strong, nonatomic) NSMutableArray *sampleCircles;

@end

@implementation ESQExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    nbt_dispatch_after_on_main(ESQStartDelay, ^{
        [self animateViewAppear];
    });
    
    self.settings = [ESQExampleEasingSettings defaultSettings];
    
    self.sampleCircles = [[NSMutableArray alloc] init];
    
    CGPoint movingCirclePosition = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    self.movingCircle = [self createMovingCircleWithPosition:movingCirclePosition];
    [self.contentView.layer addSublayer:self.movingCircle];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:ESQSelectEasingSegue]) {
        ESQEasingSelectionViewController *easingSettingsViewController = segue.destinationViewController;
        easingSettingsViewController.settings = self.settings;
        easingSettingsViewController.delegate = self;
    }
}

#pragma mark - Accessors

- (void)setSettings:(ESQExampleEasingSettings *)settings {
    _settings = settings;
    
    [self updateEasingFunctionSettingsButtonState];
}

#pragma mark - Actions

- (IBAction)handleTap:(UITapGestureRecognizer *)gestureRecognizer {
    CGPoint newPosition = [gestureRecognizer locationInView:self.view];
    CGPoint fromPosition = self.movingCircle.presentationLayer.position;
    NSTimeInterval duration = ESQExampleMoveAnimationDuration;
    
    [self.movingCircle removeAllAnimations];
    
    // Animate Movement
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation esq_animationWithKeyPath:@"position"
                                                                                 fromPoint:fromPosition
                                                                                   toPoint:newPosition
                                                                                  duration:duration
                                                                           xEasingFunction:self.settings.xEasingFunction
                                                                           yEasingFunction:self.settings.yEasingFunction];
    self.movingCircle.position = newPosition;
    
    NSString *animationKey = [NSString stringWithFormat:ESQPositionAnimationKeyFormat,
                                                        (unsigned long)positionAnimation.hash];
    [self.movingCircle addAnimation:positionAnimation forKey:animationKey];
    
    // Schedule Samples Appearing
    
    [self.sampleCircles makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    [self.sampleCircles removeAllObjects];
    
    CGFloat xDelta = newPosition.x - fromPosition.x;
    CGFloat yDelta = newPosition.y - fromPosition.y;
    CGFloat progressStep = ESQExampleMoveAnimationDuration / ESQNumberOfSamples;
    for (CGFloat progress = 0; progress <= 1; progress += progressStep) {
        CGFloat xEasedProgress = [self.settings.xEasingFunction easedProgress:progress];
        CGFloat x = fromPosition.x + xDelta * xEasedProgress;
        
        CGFloat yEasedProgress = [self.settings.yEasingFunction easedProgress:progress];
        CGFloat y = fromPosition.y + yDelta * yEasedProgress;
        
        CGPoint traceCirclePosition = CGPointMake(x, y);
    
        nbt_dispatch_after_on_main(duration * progress, ^{
            if (![self.movingCircle animationForKey:animationKey]) {
                return;
            }
    
            CALayer *sampleLayer = [self createSampleCircleWithPosition:traceCirclePosition];
            [self.contentView.layer addSublayer:sampleLayer];
            [self.sampleCircles addObject:sampleLayer];
        });
    }
}

#pragma mark - ESQEasingSelectionViewControllerDelegate

-  (void)viewController:(ESQEasingSelectionViewController *)viewController
didUpdateEasingSettings:(ESQExampleEasingSettings *)easingSettings {
    self.settings = easingSettings;
}

#pragma mark - Internal

- (CALayer *)createMovingCircleWithPosition:(CGPoint)position {
    CALayer *result = [self createCircleLayer];
    result.position = position;
    return result;
}

- (CALayer *)createSampleCircleWithPosition:(CGPoint)position {
    CALayer *result = [self createCircleLayer];
    result.opacity = .2f;
    result.position = position;
    return result;
}
   
- (CALayer *)createCircleLayer {
    CALayer *result = [[CALayer alloc] init];
    CGFloat movingCircleDiameter = ESQMovingCircleRadius * 2;
    result.frame = (CGRect){ CGPointZero, CGSizeMake(movingCircleDiameter, movingCircleDiameter) };
    result.cornerRadius = ESQMovingCircleRadius;
    result.masksToBounds = YES;
    result.backgroundColor = UIColor.lightGrayColor.CGColor;
    return result;
}

- (void)animateViewAppear {
    ESQQuadraticEasingFunction *easingFunction = [ESQQuadraticEasingFunction easingFunctionWithType:ESQEasingFunctionTypeOut];
    CGFloat viewControllerHeight = CGRectGetHeight(self.view.frame);
    CGFloat statusBarHeight = CGRectGetHeight(UIApplication.sharedApplication.statusBarFrame);
    [self.captionLabelYConstraint esq_setConstant:-viewControllerHeight / 2 - statusBarHeight
                              usingEasingFunction:easingFunction
                                         duration:ESQBeginAnimationDuration];
    
    [UIView animateWithDuration:ESQBeginAnimationDuration animations:^{
        self.contentView.alpha = 1;
    }];
}

- (void)updateEasingFunctionSettingsButtonState {
    NSString *title = [NSString stringWithFormat:@"%@(%@) : %@(%@)",
                                                   self.settings.xEasingFunction.description,
                    [self easingFunctionTypeAcronym:self.settings.xEasingFunction.type],
                                                   self.settings.yEasingFunction.description,
                    [self easingFunctionTypeAcronym:self.settings.yEasingFunction.type]];
    
    [self.easingFunctionsSettingsButton setTitle:title forState:UIControlStateNormal];
    
    
}

- (NSString *)easingFunctionTypeAcronym:(ESQEasingFunctionType)type {
    NSString *result = @"Undefined";
    switch (type) {
        case ESQEasingFunctionTypeIn:
            result = @"I";
            break;
            
        case ESQEasingFunctionTypeOut:
            result = @"O";
            break;
            
        case ESQEasingFunctionTypeInOut:
            result = @"IO";
            break;
            
        case ESQEasingFunctionTypeOutIn:
            result = @"OI";
            break;
    }
    return result;
}

@end
