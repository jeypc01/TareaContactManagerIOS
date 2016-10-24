//
//  User.m
//  pruebaCamara
//
//  Created by Jeycood Jordany Pérez Campos on 16/10/16.
//  Copyright © 2016 Jeycood Jordany Pérez Campos. All rights reserved.
//

#import "User.h"

@implementation User


-(id)initWithName: (NSString*) name lastName:(NSString*) lastName
        cellphone:(NSString*)cellphone homephone:(NSString*) homephone
            email:(NSString*)email
            image:(UIImage*)image
{
    
    self=[super init];
    if(self){
        _name=name;
        _lastName=lastName;
        _cellphone=cellphone;
        _homephone=homephone;
        _email=email;
        _image=image;
    }
    return self;
}


@end
