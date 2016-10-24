//
//  ViewController.m
//  pruebaCamara
//
//  Created by Jeycood Jordany Pérez Campos on 13/10/16.
//  Copyright © 2016 Jeycood Jordany Pérez Campos. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "DetailViewController.h"

@interface ViewController (){
    NSMutableArray *Users;
    NSMutableArray *UsersFiltered;
    BOOL isFiltered;
    
    }

@end

@implementation ViewController

@synthesize user;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    _searchBar.delegate=self;
    
    Users = [[NSMutableArray alloc] init];
    
    [self cargaUser];
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



-(void)cargaUser{
    User *uno=[[User alloc]initWithName:@"Jeycood" lastName:@"Perez" cellphone:@"87856232" homephone:@"24335401" email:@"jeypc01@gmail.com" image:nil];
    
     User *dos=[[User alloc]initWithName:@"ana" lastName:@"Perez" cellphone:@"87856232" homephone:@"24335401" email:@"jeypc01@gmail.com" image:nil];
    
    [Users addObject:uno];
     [Users addObject:dos];
    
    if( user != nil){
        [Users addObject:user];
    }
    NSLog(@"USERS %@", Users);
}


#pragma mark - SearchBar Part

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_tableView resignFirstResponder];
}


-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length==0){
        isFiltered=NO;
    }else{
        isFiltered=YES;
        UsersFiltered=[[NSMutableArray alloc]init];
        for(User * us in Users )
        {
            NSRange stringRange=[us.name rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if(stringRange.location !=NSNotFound){
                [UsersFiltered addObject:us];
            }
        }
    }
    [_tableView reloadData];
}


#pragma mark  - TableView Part

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count;
    
    if(isFiltered){
        count=[UsersFiltered count];
    }else{
        count=[Users count];
    }
    
    return count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
   
    
    
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    //Pintado
    if(!isFiltered){
        User *userToPaint=[Users objectAtIndex:indexPath.row];
        
        cell.textLabel.text=[NSString stringWithFormat:@"%@ %@", userToPaint.name, userToPaint.lastName ];
    }else{
        
        User *userFiltered=[UsersFiltered objectAtIndex:indexPath.row];
        
        cell.textLabel.text=[NSString stringWithFormat:@"%@ %@", userFiltered.name, userFiltered.lastName ];
        
        
    }
    
 
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    User * auser = [Users objectAtIndex:indexPath.row];
    DetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    
    detail.user = auser;
    
    [self.navigationController pushViewController:detail animated:YES];
}







//ESTE METODO ESTA EN EL VIEW CONTROLLER PRINCIPAL
-(void)devolverUser:(User *)otherUser{
    NSLog(@"%@", self.user.name);
    [Users addObject:otherUser];
    
    [self.tableView reloadData];
 }


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"SegueForRegister"]){
        
    ViewRegistrer * Register = segue.destinationViewController;
    
    Register.delegate = self;
     }
}




@end
