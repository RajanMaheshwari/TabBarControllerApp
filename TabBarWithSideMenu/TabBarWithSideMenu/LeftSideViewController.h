//
//  LeftSideViewController.h
//  TabBarWithSideMenu
//
//  Created by Rajan Maheshwari on 06/12/15.
//  Copyright © 2015 rajanmaheshwari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftSideViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
