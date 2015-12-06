//
//  SecondViewController.m
//  TabBarWithSideMenu
//
//  Created by Rajan Maheshwari on 06/12/15.
//  Copyright © 2015 rajanmaheshwari. All rights reserved.
//

#import "SecondViewController.h"
#include "SWRevealViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealController = [self revealViewController];
    
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    
    
    UIBarButtonItem* revealButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"reveal-icon.png"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSUInteger indexOfTab = [[tabBar items] indexOfObject:item];
    NSLog(@"Tab index = %u", (int)indexOfTab);
    
    if(indexOfTab == 0){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"backToTabIndexControllerFirst" object:nil];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"backToTabIndexControllerSecond" object:nil];
    }
}

@end
