//
//  ViewController.h
//  pruebaCamara
//
//  Created by Jeycood Jordany Pérez Campos on 13/10/16.
//  Copyright © 2016 Jeycood Jordany Pérez Campos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "ViewRegistrer.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, SegundoViewControllerDelegate,UISearchBarDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic) User *user;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

