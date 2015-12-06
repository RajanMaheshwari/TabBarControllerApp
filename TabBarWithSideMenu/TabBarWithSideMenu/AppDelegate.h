//
//  AppDelegate.h
//  TabBarWithSideMenu
//
//  Created by Rajan Maheshwari on 06/12/15.
//  Copyright © 2015 rajanmaheshwari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,SWRevealViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SWRevealViewController *viewController;

@end

