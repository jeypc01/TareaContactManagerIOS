//
//  ViewRegistrer.h
//  pruebaCamara
//
//  Created by Jeycood Jordany Pérez Campos on 13/10/16.
//  Copyright © 2016 Jeycood Jordany Pérez Campos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"



@protocol SegundoViewControllerDelegate <NSObject>;

- (void)devolverUser:(User *) user;

@end

@interface ViewRegistrer : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIImageView *imagenView;
    UIButton    *abrirGaleria;
    UIButton    *tomarFoto;
   
}

@property (nonatomic, weak) id <SegundoViewControllerDelegate> delegate;

@property (strong, nonatomic) User* userByField;



@property (nonatomic, retain) IBOutlet UIImageView *imagenView;
@property (nonatomic, retain) IBOutlet UIButton *abrirGaleria;
@property (nonatomic, retain) IBOutlet UIButton *tomarFoto;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *cellphoneField;
@property (weak, nonatomic) IBOutlet UITextField *homephoneField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;





- (IBAction)abrirGaleria:(id)sender;
- (IBAction)tomarFoto:(id)sender;
- (IBAction)enviarDatos:(id)sender;



@end
