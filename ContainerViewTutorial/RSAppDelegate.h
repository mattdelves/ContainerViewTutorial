//
//  RSAppDelegate.h
//  ContainerViewTutorial
//
//  Created by Matthew Delves on 11/07/13.
//  Copyright (c) 2013 Reformed Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSViewController;

@interface RSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RSViewController *viewController;

@end
