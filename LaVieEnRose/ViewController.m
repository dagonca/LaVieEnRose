//
//  ViewController.m
//  LaVieEnRose
//
//  Created by Dani Gonzalez castillo on 12/11/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
@interface ViewController ()

@end

@implementation ViewController
@synthesize texto,imagen;

- (void)viewDidLoad {
    [super viewDidLoad];
    PFQuery *query = [PFQuery queryWithClassName:@"Principal"];
    [query getObjectInBackgroundWithId:@"gXfRrbTMC7" block:^(PFObject *textobject, NSError *error) {
       
       
        texto.text=[textobject objectForKey:@"Noticia"];
        PFFile *foto = [textobject objectForKey:@"imagen"];
        
        [foto getDataInBackgroundWithBlock:^(NSData *data, NSError *error){
            if(!error){
                imagen.image = [UIImage imageWithData:data];
            }
            
            
        }];
        
        
        
        
        
    }];
    
  


    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)instagram:(id)sender {
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:@"http://instagram.com/lavienroseshop"]];

}
- (IBAction)facebook:(id)sender {
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:@"https://www.facebook.com/pages/La-Vie-en-Rose/576247515804607?ref=ts&fref=ts"]];

}
- (IBAction)terjeta:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Nº de cuenta(La Caixa)"
                                                   message: @"ESB4-2100-7943-40-0100089627"
                                                  delegate: self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil,nil];
    
    
    [alert show];

    
}

@end
