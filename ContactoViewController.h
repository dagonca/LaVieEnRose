//
//  ContactoViewController.h
//  LaVieEnRose
//
//  Created by Dani Gonzalez castillo on 12/11/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactoViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nombre;
@property (weak, nonatomic) IBOutlet UITextField *direccion;
@property (weak, nonatomic) IBOutlet UITextField *correro;
@property (weak, nonatomic) IBOutlet UITextField *telefono;
@property (weak, nonatomic) IBOutlet UITextField *mensaje;
@property (strong, nonatomic) IBOutlet UIView *viewg;

@end
