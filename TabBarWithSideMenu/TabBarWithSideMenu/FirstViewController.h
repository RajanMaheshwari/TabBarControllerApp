//
//  FirstViewController.h
//  TabBarWithSideMenu
//
//  Created by Rajan Maheshwari on 06/12/15.
//  Copyright © 2015 rajanmaheshwari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

@end
