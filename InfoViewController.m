//
//  InfoViewController.m
//  LaVieEnRose
//
//  Created by Dani Gonzalez castillo on 12/11/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "InfoViewController.h"
#import "CollectionViewCell.h"
#import "AppDelegate.h"
@interface InfoViewController ()

@end

@implementation InfoViewController{
    NSArray *Fotos;
}
@synthesize Foto,Foto1,Foto2,Foto3,recipeCantidad,recipeNombre,recipePrecio,labelNombre,labelPrecio,cant,collection,pageContro,viewg,StringPrecio,StringVisible;
- (void)viewDidLoad {
     Fotos= [NSArray arrayWithObjects:Foto1,Foto2,Foto3,nil];
    labelNombre.text=recipeNombre;
    labelPrecio.text=recipePrecio;
    pageContro.numberOfPages=[ Fotos count];
    NSLog(@"String visible= %@",StringVisible);
    
    if ([StringVisible isEqualToString:@"no"]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Disculpa"
                                                   message: @"Articulo agotado"
                                                  delegate: self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil,nil];
    
    
    [alert show];

    }
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"Clicked button index 0");
         if ([StringVisible isEqualToString:@"no"]) {
       [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
         }
    } else {
        NSLog(@"Clicked button index other than 0");
        // Add another action here
    }
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    viewg.frame = CGRectMake(viewg.frame.origin.x, (viewg.frame.origin.y - 120.0), viewg.frame.size.width, viewg.frame.size.height);
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    viewg.frame = CGRectMake(viewg.frame.origin.x, (viewg.frame.origin.y + 120.0), viewg.frame.size.width, viewg.frame.size.height);
    [UIView commitAnimations];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([cant isFirstResponder] && [touch view] != cant) {
        [cant resignFirstResponder];
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

//Collection Program
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [Fotos count];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.imagen.image = [Fotos objectAtIndex:indexPath.row];
  
    
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = collection.frame.size.width;
    float currentPage = collection.contentOffset.x / pageWidth;
    
    if (0.0f != fmodf(currentPage, 1.0f)) {
        pageContro.currentPage = currentPage + 1;
    } else {
        pageContro.currentPage = currentPage;
    }
    
}

-(IBAction)carro:(id)sender{
    
if ([labelNombre.text isEqualToString:@"" ] || [labelPrecio.text isEqualToString:@"" ] || [cant.text isEqualToString:@"" ]) {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Error"
                                                   message: @"Rellene todos los Campos"
                                                  delegate: self
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK",nil];
    
    
    [alert show];
    
    
}


else{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [appDelegate.globalArray addObject:[NSString stringWithFormat:@"%@",labelNombre.text]];
    [appDelegate.globalArray1 addObject:[NSString stringWithFormat:@"%@",labelPrecio.text]];
    [appDelegate.globalArray2 addObject:[NSString stringWithFormat:@"%@",cant.text]];
    [appDelegate.globalArray3 addObject:[NSString stringWithFormat:@"%f",[StringPrecio floatValue]*[cant.text floatValue]]];
    
    
    UIAlertView  *alertView = [[UIAlertView alloc] initWithTitle:@"Añadido"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:nil
                                               otherButtonTitles:nil];
    
    
    [alertView show];
   [alertView dismissWithClickedButtonIndex:3 animated:YES];
    
    NSLog(@"%@",StringPrecio);
    
}



}


@end
