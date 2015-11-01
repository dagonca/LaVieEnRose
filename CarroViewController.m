//
//  CarroViewController.m
//  MiTienda
//
//  Created by Dani Gonzalez castillo on 23/09/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "CarroViewController.h"
#import "CarritoTableViewCell.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface CarroViewController (){
    NSString *total;
    float t;
    float r;
    NSString *suma;
}

@end

@implementation CarroViewController
@synthesize tableView,LabelTotal;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    if (appDelegate.globalArray.count == 0  || appDelegate.globalArray1.count == 0  || appDelegate.globalArray2.count == 0 || appDelegate.globalArray3.count == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"No hay Artículos"
                                                       message: @"Aun no has añadido artículos a tu carro"
                                                      delegate: self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"OK",nil];
        
        
        [alert show];
        
        
    }
    
    for (NSNumber *n in appDelegate.globalArray3){
        t += [n floatValue];
    }

    LabelTotal.text=[NSString stringWithFormat:@"%.2f",t] ;
 

    
    
}

- (IBAction)back:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    return [appDelegate.globalArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    CarritoTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!Cell) {
        Cell = [[CarritoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    Cell.Nombre.text = [appDelegate.globalArray objectAtIndex:indexPath.row];
    Cell.Precio.text= [appDelegate.globalArray1 objectAtIndex:indexPath.row];
    Cell.Talla.text= [appDelegate.globalArray2 objectAtIndex:indexPath.row];
    Cell.Color.text=[NSString stringWithFormat:@"%.2f",[[appDelegate.globalArray3 objectAtIndex:indexPath.row]floatValue]];
    
    
    
    for (NSNumber *n in appDelegate.globalArray1){
        t += [n floatValue];
    }
   

    return Cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [appDelegate.globalArray removeObjectAtIndex:indexPath.row];
    [appDelegate.globalArray1 removeObjectAtIndex:indexPath.row];
    [appDelegate.globalArray2 removeObjectAtIndex:indexPath.row];
    
    
    [tableView reloadData];
    
    t=0;
    
    for (NSNumber *n in appDelegate.globalArray1){
        t += [n floatValue];
    }
    
    LabelTotal.text=[NSString stringWithFormat:@"%.2f",t];
   
    
    NSLog(@"t= %f",t);
    
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Eliminar";
}



- (IBAction)refresh:(id)sender {
    [tableView reloadData];
    

    
}



@end
