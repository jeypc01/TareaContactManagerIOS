//
//  ViewRegistrer.m
//  pruebaCamara
//
//  Created by Jeycood Jordany Pérez Campos on 13/10/16.
//  Copyright © 2016 Jeycood Jordany Pérez Campos. All rights reserved.
//

#import "ViewRegistrer.h"

#import "User.h"

@interface ViewRegistrer (){
    
    
}

@end

@implementation ViewRegistrer



@synthesize imagenView, abrirGaleria, tomarFoto;
@synthesize delegate;
@synthesize userByField;

- (IBAction)abrirGaleria:(id)sender
{
    // Inicia el Controlador
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    // Define el Delegate
    picker.delegate = self;
    
    //permite la edición del a foto
    picker.allowsEditing=YES;
    
    // Establece el origen de la imagen
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    // Agrega la vista del controlador a la pantalla
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:picker];
        [popover presentPopoverFromRect:CGRectMake(200, 940.0, 0.0, 0.0)
                                 inView:self.view
               permittedArrowDirections:UIPopoverArrowDirectionAny
                               animated:YES];
    }
    else
        [self presentModalViewController:picker animated:YES];
}


-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    NSLog(@"No han seleccionado una imagen");
}



- (IBAction)tomarFoto:(id)sender
{
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentModalViewController:picker animated:YES];
}

- (IBAction)enviarDatos:(id)sender {
    NSString *name=_nameField.text;
    NSString *lastName=_lastNameField.text;
    NSString *cellphone=_cellphoneField.text;
    NSString *homephone=_homephoneField.text;
    NSString *email=_emailField.text;
    
    
    userByField =[[User alloc]initWithName:name lastName:lastName cellphone:cellphone homephone:homephone email:email image:imagenView.image] ;

    [delegate devolverUser:self.userByField];
}

// Recibe el mensaje cuando el controlador a finalizado
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Quita la vista del controlador
    [self dismissViewControllerAnimated:YES completion:nil];
    // Establece la imagen tomada en el objeto UIImageView
    imagenView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    //Pone la imagen circular
    self.imagenView.layer.cornerRadius = self.imagenView.frame.size.width / 2;
    self.imagenView.clipsToBounds = YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
