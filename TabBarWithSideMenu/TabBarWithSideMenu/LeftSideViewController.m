//
//  LeftSideViewController.m
//  TabBarWithSideMenu
//
//  Created by Rajan Maheshwari on 06/12/15.
//  Copyright © 2015 rajanmaheshwari. All rights reserved.
//

#import "LeftSideViewController.h"
#import "SWRevealViewController.h"

@interface LeftSideViewController ()

@end

@implementation LeftSideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(indexPath.row == 0){
        cell.textLabel.text = @"First VC Without Tab";

    }else{
        cell.textLabel.text = @"Second VC Without Tab";

    }
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SWRevealViewController *revealController = self.revealViewController;
    [revealController revealToggleAnimated:YES];
    
    // Used this just to show the animation completion and then changing the root
    [self performSelector:@selector(changeControllers:) withObject:indexPath afterDelay:0.3];

}

-(void)changeControllers:(NSIndexPath*)indexPath{
    
    if(indexPath.row == 0){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"firstVCWithoutNAV" object:nil];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"secondVCWithoutNAV" object:nil];
    }
}
@end
