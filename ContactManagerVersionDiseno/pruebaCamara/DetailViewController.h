//
//  DetailViewController.h
//  pruebaCamara
//
//  Created by Jeycood Jordany Pérez Campos on 17/10/16.
//  Copyright © 2016 Jeycood Jordany Pérez Campos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
@interface DetailViewController : UIViewController

@property (nonatomic,strong) User * user;
@property (nonatomic,weak) IBOutlet UILabel *name;
@property (nonatomic,weak) IBOutlet UILabel *lastName;
@property (nonatomic,weak) IBOutlet UILabel* cellphone;
@property (nonatomic,weak) IBOutlet UILabel *homephone;
@property (nonatomic,weak) IBOutlet UILabel * email;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;



- (IBAction)sendMessage:(id)sender;
- (IBAction)callHomephone:(id)sender;





@end
