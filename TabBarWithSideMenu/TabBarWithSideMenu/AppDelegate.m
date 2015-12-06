//
//  AppDelegate.m
//  TabBarWithSideMenu
//
//  Created by Rajan Maheshwari on 06/12/15.
//  Copyright © 2015 rajanmaheshwari. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftSideViewController.h"
#import "SWRevealViewController.h"
#import "MainTabBarViewController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backToTabIndexControllerFirst) name:@"backToTabIndexControllerFirst" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backToTabIndexControllerSecond) name:@"backToTabIndexControllerSecond" object:nil];


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(firstVCWithoutNAV) name:@"firstVCWithoutNAV" object:nil];
    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(secondVCWithoutNAV) name:@"secondVCWithoutNAV" object:nil];
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;
    
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LeftSideViewController *leftSideController = [storyBoard instantiateViewControllerWithIdentifier:@"LeftSideViewController"];
                                
    
    MainTabBarViewController *mainTabBarController = [storyBoard instantiateViewControllerWithIdentifier:@"MainTabBarViewController"];
    
    SWRevealViewController *mainRevealController = [[SWRevealViewController alloc]
                                                    initWithRearViewController:leftSideController frontViewController:mainTabBarController];
    
    mainRevealController.delegate = self;
    
    self.viewController = mainRevealController;
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)firstVCWithoutNAV{
    
    self.window.rootViewController = nil;
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController * firstVC = [storyBoard instantiateViewControllerWithIdentifier:@"FirstNAV"];
    LeftSideViewController *leftSideController = [storyBoard instantiateViewControllerWithIdentifier:@"LeftSideViewController"];
    SWRevealViewController *mainRevealController = [[SWRevealViewController alloc]
                                                    initWithRearViewController:leftSideController frontViewController:firstVC];
    
    mainRevealController.delegate = self;
    
    self.viewController = mainRevealController;
    
    self.window.rootViewController = self.viewController;
}

-(void)secondVCWithoutNAV{

    self.window.rootViewController = nil;
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController * secondVC = [storyBoard instantiateViewControllerWithIdentifier:@"SecondNAV"];
    LeftSideViewController *leftSideController = [storyBoard instantiateViewControllerWithIdentifier:@"LeftSideViewController"];
    SWRevealViewController *mainRevealController = [[SWRevealViewController alloc]
                                                    initWithRearViewController:leftSideController frontViewController:secondVC];
    
    mainRevealController.delegate = self;
    
    self.viewController = mainRevealController;
    
    self.window.rootViewController = self.viewController;

}

-(void)backToTabIndexControllerFirst{
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LeftSideViewController *leftSideController = [storyBoard instantiateViewControllerWithIdentifier:@"LeftSideViewController"];
    
    
    MainTabBarViewController *mainTabBarController = [storyBoard instantiateViewControllerWithIdentifier:@"MainTabBarViewController"];
    
    SWRevealViewController *mainRevealController = [[SWRevealViewController alloc]
                                                    initWithRearViewController:leftSideController frontViewController:mainTabBarController];
    
    mainRevealController.delegate = self;
    
    self.viewController = mainRevealController;
    
    self.window.rootViewController = self.viewController;
}

-(void)backToTabIndexControllerSecond{

    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LeftSideViewController *leftSideController = [storyBoard instantiateViewControllerWithIdentifier:@"LeftSideViewController"];
    
    
    MainTabBarViewController *mainTabBarController = [storyBoard instantiateViewControllerWithIdentifier:@"MainTabBarViewController"];
    
    //To make selected index as the one which is clicked from tab bar
    mainTabBarController.selectedIndex = 1;
    SWRevealViewController *mainRevealController = [[SWRevealViewController alloc]
                                                    initWithRearViewController:leftSideController frontViewController:mainTabBarController];
    
    mainRevealController.delegate = self;
    
    self.viewController = mainRevealController;
    
    self.window.rootViewController = self.viewController;
}
@end
