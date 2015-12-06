//
//  FirstViewController.m
//  TabBarWithSideMenu
//
//  Created by Rajan Maheshwari on 06/12/15.
//  Copyright © 2015 rajanmaheshwari. All rights reserved.
//

#import "FirstViewController.h"
#import "SWRevealViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealController = [self revealViewController];
    
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    
    
    UIBarButtonItem* revealButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"reveal-icon.png"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;

    // Do any additional setup after loading the view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
