//
//  ESQEasingSelectionViewController.h
//  easeqs-objc-example
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

@import UIKit;

#import "ESQExampleEasingSettings.h"

@class ESQEasingSelectionViewController;
@protocol ESQEasingSelectionViewControllerDelegate <NSObject>

-  (void)viewController:(ESQEasingSelectionViewController *)viewController
didUpdateEasingSettings:(ESQExampleEasingSettings *)easingSettings;

@end

@interface ESQEasingSelectionViewController : UIViewController

@property (weak, nonatomic) id<ESQEasingSelectionViewControllerDelegate> delegate;

@property (strong, nonatomic) ESQExampleEasingSettings *settings;

@end
