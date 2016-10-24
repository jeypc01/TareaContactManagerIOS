//
//  DetailViewController.m
//  pruebaCamara
//
//  Created by Jeycood Jordany Pérez Campos on 17/10/16.
//  Copyright © 2016 Jeycood Jordany Pérez Campos. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _name.text=[NSString stringWithFormat:@"%@ %@",_user.name,_user.lastName];
    _cellphone.text=_user.cellphone;
    _homephone.text=_user.homephone;
    _email.text=_user.email;
    _ImageView.image=_user.image;
    
    //Pone imagen Circular
    self.ImageView.layer.cornerRadius = self.ImageView.frame.size.width / 2;
    self.ImageView.clipsToBounds = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sendMessage:(id)sender {
    NSString *PreURL=@"sms:";
    NSString *URL=[NSString stringWithFormat: @"%@%@",PreURL,_user.cellphone];
    NSURL *finalURL=[NSURL URLWithString:URL];
    NSLog(@"%@", URL);
    
    //Nueva manera de programar en IOS 10
    [[UIApplication sharedApplication] openURL:finalURL options:@{} completionHandler:nil];
    
    
}

- (IBAction)callHomephone:(id)sender {
    NSString *PreURL=@"tel:";
    NSString *URL=[NSString stringWithFormat: @"%@%@",PreURL,_user.cellphone];
    NSURL *finalURL=[NSURL URLWithString:URL];
    NSLog(@"%@", URL);
    
    //Nueva manera de programar en IOS 10
    [[UIApplication sharedApplication] openURL:finalURL options:@{} completionHandler:nil];
    
    
}
@end
