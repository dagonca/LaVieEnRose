//
//  ContactoViewController.m
//  LaVieEnRose
//
//  Created by Dani Gonzalez castillo on 12/11/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "ContactoViewController.h"
#import <Parse/Parse.h>
@interface ContactoViewController ()

@end

@implementation ContactoViewController
@synthesize nombre,direccion,correro,telefono,mensaje,viewg;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    viewg.frame = CGRectMake(viewg.frame.origin.x, (viewg.frame.origin.y - 115.0), viewg.frame.size.width, viewg.frame.size.height);
    [UIView commitAnimations];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    viewg.frame = CGRectMake(viewg.frame.origin.x, (viewg.frame.origin.y + 115.0), viewg.frame.size.width, viewg.frame.size.height);
    [UIView commitAnimations];
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([nombre isFirstResponder] && [touch view] != nombre) {
        [nombre resignFirstResponder];
    }
    if ([direccion isFirstResponder] && [touch view] != direccion) {
        [direccion resignFirstResponder];
    }
    
    if ([correro isFirstResponder] && [touch view] != correro) {
        [correro resignFirstResponder];
    }
    if ([telefono isFirstResponder] && [touch view] != telefono) {
        [telefono resignFirstResponder];
    }
    if ([mensaje isFirstResponder] && [touch view] != mensaje) {
        [mensaje resignFirstResponder];
    }
    
    [super touchesBegan:touches withEvent:event];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)enviar:(id)sender {
    
    
    
    if ([nombre.text isEqualToString:@"" ] || [direccion.text isEqualToString:@"" ] || [correro.text isEqualToString:@"" ] || [telefono.text isEqualToString:@"" ] || [mensaje.text isEqualToString:@"" ]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Error"
                                                       message: @"Rellene todos los Campos"
                                                      delegate: self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"OK",nil];
        
        
        [alert show];

    }else{
    
    
    NSString *documentsDirectory = [NSHomeDirectory()
                                    stringByAppendingPathComponent:@"Documents"];
    
    NSString *filePath = [documentsDirectory
                          stringByAppendingPathComponent:@"Pedido.txt"];
    

    
    
    NSString *pedido = [NSString stringWithFormat:@"\n Nombre:  %@ \n Direccion:  %@ \n e-mail:  %@ \n Telefono:  %@ \n Mensaje:  %@ "  ,nombre.text,direccion.text,correro.text,telefono.text,mensaje.text];
    
    
    [pedido writeToFile:filePath atomically:YES
               encoding:NSUTF8StringEncoding error:nil];
    
    //ENVIAR PEDIDO
    
    NSData *data = [NSData dataWithContentsOfFile:
                    [filePath stringByExpandingTildeInPath]];
    
    PFFile *pedFile = [PFFile fileWithName:nombre.text data:data];
    PFObject *recipe = [PFObject objectWithClassName:@"Contacto"];
    [recipe setObject:pedFile forKey:@"Contacto"];
    // Upload recipe to Parse
    
    [recipe saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        
        if (!error) {
            // Show success message
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Gracias por contactar con nosotros" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            
            
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"No se ha podido enviar su información" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        
    }];
    

    }
    
    
}



@end
