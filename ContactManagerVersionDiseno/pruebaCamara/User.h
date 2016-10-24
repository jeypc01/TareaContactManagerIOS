//
//  User.h
//  pruebaCamara
//
//  Created by Jeycood Jordany Pérez Campos on 16/10/16.
//  Copyright © 2016 Jeycood Jordany Pérez Campos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic,strong) NSString *lastName;
@property (nonatomic,strong) NSString* cellphone;
@property (nonatomic,strong) NSString* homephone;
@property (nonatomic,strong) NSString* email;
@property (nonatomic,retain) UIImage* image;

-(id)initWithName: (NSString*) name lastName:(NSString*) lastName
         cellphone:(NSString*)cellphone homephone:(NSString*) homephone
            email:(NSString*)email
            image:(UIImage*)image;

@end
