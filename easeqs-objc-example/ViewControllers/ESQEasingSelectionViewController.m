//
//  ESQEasingSelectionViewController.m
//  easeqs-objc-example
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#import "ESQEasingSelectionViewController.h"

#import <objc/runtime.h>

#import <JBChartView/JBLineChartView.h>

static const CGFloat ESQJBLineChartViewAnimationDuration = .35f;

static const CGFloat ESQEasingFunctionsTypeSwitchAnimationDuration = .25f;
static const CGFloat ESQSegmentedControlPadding = 28.f;

static const NSUInteger ESQYEasingComponentIndex = 1;
static const NSUInteger ESQXEasingComponentIndex = 0;
static const CGFloat ESQChartLineWidth = 2.f;

@interface ESQEasingSelectionViewController () <UIPickerViewDelegate, UIPickerViewDataSource,
JBLineChartViewDelegate, JBLineChartViewDataSource>

@property (weak, nonatomic) IBOutlet JBLineChartView *plotView;

@property (weak, nonatomic) IBOutlet UISwitch *useTheSameXYSwitch;

@property (weak, nonatomic) IBOutlet UIPickerView *easingFunctionPickerView;

@property (weak, nonatomic) IBOutlet UIView *segmentedControllerRightContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *segmentedContainersLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *segmentedContainersRightConstraint;

@property (weak, nonatomic) IBOutlet UISegmentedControl *xEasingFunctionTypeSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *yEasingFunctionTypeSegmentedControl;

@property (strong, nonatomic) NSArray<Class> *availableEasingFunctions;

@property (assign, nonatomic) BOOL chartViewUpdateRequired;

@end

@implementation ESQEasingSelectionViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.availableEasingFunctions = [self getAvailableEasingFunctions];
    
    [self.easingFunctionPickerView reloadAllComponents];
    
    self.plotView.delegate = self;
    self.plotView.dataSource = self;
    [self.plotView reloadDataAnimated:NO];
    
    if (self.settings) {
        [self setSettings:self.settings];
    }
    
    self.chartViewUpdateRequired = NO;
}

- (void)dealloc {
    [self.plotView removeFromSuperview];
    self.plotView = nil;
}

#pragma mark - Accessors

- (void)setSettings:(ESQExampleEasingSettings *)settings {
    _settings = settings;
    
    self.useTheSameXYSwitch.on = settings.useTheSameEasingFunctionForXAndY;
    
    self.xEasingFunctionTypeSegmentedControl.selectedSegmentIndex = settings.xEasingFunction.type;
    self.yEasingFunctionTypeSegmentedControl.selectedSegmentIndex = settings.yEasingFunction.type;
    
    NSUInteger xEasingFunctionIndex = [self.availableEasingFunctions indexOfObject:self.settings.xEasingFunction.class];
    [self.easingFunctionPickerView selectRow:xEasingFunctionIndex inComponent:ESQXEasingComponentIndex animated:NO];
    
    if (!settings.useTheSameEasingFunctionForXAndY) {
        NSUInteger index = [self.availableEasingFunctions indexOfObject:self.settings.yEasingFunction.class];
        [self.easingFunctionPickerView selectRow:index inComponent:ESQYEasingComponentIndex animated:NO];
    }
    
    [self setRightSegmentedContainerHidden:self.settings.useTheSameEasingFunctionForXAndY];
}

#pragma mark - Actions

- (IBAction)doneTapped:(id)sender {
    if ([self.delegate respondsToSelector:@selector(viewController:didUpdateEasingSettings:)]) {
        [self.delegate viewController:self didUpdateEasingSettings:self.settings];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)useTheSameEasingForXAndYSwitched:(UISwitch *)sender {
    self.settings.useTheSameEasingFunctionForXAndY = sender.isOn;
    
    [self.easingFunctionPickerView reloadAllComponents];
    if (!sender.isOn) {
        NSInteger index = [self.easingFunctionPickerView selectedRowInComponent:ESQXEasingComponentIndex];
        [self.easingFunctionPickerView selectRow:index
                                     inComponent:ESQYEasingComponentIndex
                                        animated:YES];
        NSInteger row = [self.easingFunctionPickerView selectedRowInComponent:ESQXEasingComponentIndex];
        self.yEasingFunctionTypeSegmentedControl.selectedSegmentIndex = self.xEasingFunctionTypeSegmentedControl.selectedSegmentIndex;
        ESQEasingFunctionType type = (ESQEasingFunctionType)self.yEasingFunctionTypeSegmentedControl.selectedSegmentIndex;
        self.settings.yEasingFunction = [self easingFunctionForRow:row wihtType:type];
    }
    
    [self updateChart];
    
    [self setRightSegmentedContainerHidden:sender.isOn];
}

- (IBAction)xEasingFunctionTypeChanged:(UISegmentedControl *)sender {
    self.settings.xEasingFunction.type = (ESQEasingFunctionType)sender.selectedSegmentIndex;
    [self updateChart];
}

- (IBAction)yEasingFunctionTypeChanged:(UISegmentedControl *)sender {
    self.settings.yEasingFunction.type = (ESQEasingFunctionType)sender.selectedSegmentIndex;
    [self updateChart];
}

#pragma mark - UIPickerViewDelegate

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView
             attributedTitleForRow:(NSInteger)row
                      forComponent:(NSInteger)component {
    NSString *title = self.availableEasingFunctions[(NSUInteger)row].description;
    NSDictionary *attributes = @{ NSForegroundColorAttributeName:UIColor.whiteColor };
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:title
                                                                           attributes:attributes];
    return attributedString;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    ESQEasingFunctionType type = (component == ESQXEasingComponentIndex)
    ? (ESQEasingFunctionType)self.xEasingFunctionTypeSegmentedControl.selectedSegmentIndex
    : (ESQEasingFunctionType)self.yEasingFunctionTypeSegmentedControl.selectedSegmentIndex;
    ESQEasingFunction * easingFunction = [self easingFunctionForRow:row wihtType:type];
    if (component == ESQXEasingComponentIndex) {
        self.settings.xEasingFunction = easingFunction;
    }
    
    if (component == ESQYEasingComponentIndex || self.useTheSameXYSwitch.isOn) {
        self.settings.yEasingFunction = easingFunction;
    }
    
    [self updateChart];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.settings.useTheSameEasingFunctionForXAndY ? 1 : 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.availableEasingFunctions.count;
}

#pragma mark - JBLineChartViewDataSource

- (NSUInteger)numberOfLinesInLineChartView:(JBLineChartView *)lineChartView {
    return self.settings.useTheSameEasingFunctionForXAndY ? 1 : 2;
}

- (NSUInteger)lineChartView:(JBLineChartView *)lineChartView numberOfVerticalValuesAtLineIndex:(NSUInteger)lineIndex {
    return (NSUInteger)ceilf(lineChartView.frame.size.width);
}

- (BOOL)lineChartView:(JBLineChartView *)lineChartView smoothLineAtLineIndex:(NSUInteger)lineIndex {
    return YES;
}

#pragma mark - JBLineChartViewDelegate

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView
verticalValueForHorizontalIndex:(NSUInteger)horizontalIndex
             atLineIndex:(NSUInteger)lineIndex {
    ESQEasingFunction * easingFunction = lineIndex == 0 ? self.settings.xEasingFunction : self.settings.yEasingFunction;
    CGFloat progress = (CGFloat)horizontalIndex / CGRectGetWidth(lineChartView.frame);
    CGFloat easedProgress = [easingFunction easedProgress:progress];
    return easedProgress;
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForLineAtLineIndex:(NSUInteger)lineIndex {
    return UIColor.whiteColor;
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView widthForLineAtLineIndex:(NSUInteger)lineIndex {
    return ESQChartLineWidth;
}

- (JBLineChartViewLineStyle)lineChartView:(JBLineChartView *)lineChartView
              lineStyleForLineAtLineIndex:(NSUInteger)lineIndex {
    return lineIndex ? JBLineChartViewLineStyleDashed : JBLineChartViewLineStyleSolid;
}

- (BOOL)lineChartView:(JBLineChartView *)lineChartView shouldIgnoreSelectionAtLineIndex:(NSUInteger)lineIndex {
    return YES;
}

#pragma mark - Internal

- (NSArray<Class> *)getAvailableEasingFunctions {
    NSMutableArray<Class> *availableEasingFunctions = [[NSMutableArray alloc] init];
    int numberOfClasses = objc_getClassList(NULL, 0);
    Class *classes = (__unsafe_unretained Class *) malloc(sizeof(Class) * numberOfClasses);
    numberOfClasses = objc_getClassList(classes, numberOfClasses);
    
    for (NSUInteger i = 0; i < numberOfClasses; i++) {
        Class class = classes[i];
        Class superclass = class;
        do {
            superclass = class_getSuperclass(superclass);
        } while (superclass && ESQEasingFunction.class != superclass);
        
        if (superclass) {
            [availableEasingFunctions addObject:class];
        }
    }
    free(classes);
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"description" ascending:YES];
    NSArray<Class> *result = [availableEasingFunctions sortedArrayUsingDescriptors:@[sortDescriptor]];
    return result;
}

- (ESQEasingFunction *)easingFunctionForRow:(NSInteger)row wihtType:(ESQEasingFunctionType)type {
    Class easingFunctionClass = self.availableEasingFunctions[(NSUInteger)row];
    ESQEasingFunction *easingFunction = [(ESQEasingFunction *)[easingFunctionClass alloc] initWithType:type];
    return easingFunction;
}

- (void)setRightSegmentedContainerHidden:(BOOL)hidden {
    ESQQuadraticEasingFunction *easingFunction = [[ESQQuadraticEasingFunction alloc] initWithType:ESQEasingFunctionTypeOut];
    CGFloat positionDelta = hidden ? CGRectGetWidth(self.segmentedControllerRightContainer.frame) / 2 : 0;
    [self.segmentedContainersLeftConstraint esq_setConstant:ESQSegmentedControlPadding + positionDelta
                                        usingEasingFunction:easingFunction
                                                   duration:ESQEasingFunctionsTypeSwitchAnimationDuration];
    
    [self.segmentedContainersRightConstraint esq_setConstant:ESQSegmentedControlPadding - positionDelta
                                         usingEasingFunction:easingFunction
                                                    duration:ESQEasingFunctionsTypeSwitchAnimationDuration];
    
    CGFloat fromOpacity = 0;
    CGFloat toOpacity = 1;
    if (hidden) {
        fromOpacity = 1;
        toOpacity = 0;
    }
    
    CAKeyframeAnimation *alphaAnimation = [CAKeyframeAnimation esq_animationWithKeyPath:@"opacity" fromFloat:fromOpacity
                                                                                toFloat:toOpacity
                                                                               duration:ESQEasingFunctionsTypeSwitchAnimationDuration
                                                                        easingCFunction:quadraticOut
                                                              easingCFunctionParameters:nil];
    self.segmentedControllerRightContainer.layer.opacity = toOpacity;
    [self.segmentedControllerRightContainer.layer addAnimation:alphaAnimation forKey:@"opacityAnimation"];
}

- (void)updateChart {
    if (self.plotView.reloading) {
        self.chartViewUpdateRequired = YES;
        return;
    }
    
    [self.plotView reloadDataAnimated:YES];
    
    typeof(self) __weak weakSelf = self;
    nbt_dispatch_after_on_main(ESQJBLineChartViewAnimationDuration, ^{
        if (weakSelf.chartViewUpdateRequired) {
            weakSelf.chartViewUpdateRequired = NO;
            [weakSelf updateChart];
        }
    });
}

@end
