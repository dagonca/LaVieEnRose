//
//  OtrosViewController.m
//  LaVieEnRose
//
//  Created by Dani Gonzalez castillo on 12/11/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "OtrosViewController.h"
#import "CollectionViewCell.h"
#import "InfoViewController.h"

@interface OtrosViewController ()

@end

@implementation OtrosViewController
{
    NSArray *FotosArray;
    NSArray *FotosArray1;
    NSArray *FotosArray2;
    NSArray *FotosArray3;
    NSArray *precioArray;
    NSArray *nombreArray;
    NSArray *visibleArray;
}
@synthesize cellection,segment;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(retrieveFromParse)];
    // Do any additional setup after loading the view.
}
- (void) retrieveFromParse {
    
    PFQuery *retrieveColors2 = [PFQuery queryWithClassName:@"Otros"];
    [retrieveColors2 orderByDescending:@"createdAt"];
    [retrieveColors2 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            FotosArray = [[NSArray alloc] initWithArray:objects];
            precioArray = [[NSArray alloc] initWithArray:objects];
            nombreArray = [[NSArray alloc] initWithArray:objects];
            visibleArray = [[NSArray alloc] initWithArray:objects];
            FotosArray1 = [[NSArray alloc] initWithArray:objects];
            FotosArray2 = [[NSArray alloc] initWithArray:objects];
            FotosArray3 = [[NSArray alloc] initWithArray:objects];
            
            
        }
        
        [cellection reloadData];
        
    }];
}
- (IBAction)SegmentControl:(id)sender {
    if(segment.selectedSegmentIndex == 0){
        PFQuery *retrieveColors2 = [PFQuery queryWithClassName:@"Otros"];
        [retrieveColors2 orderByDescending:@"createdAt"];
        [retrieveColors2 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                FotosArray = [[NSArray alloc] initWithArray:objects];
                precioArray = [[NSArray alloc] initWithArray:objects];
                nombreArray = [[NSArray alloc] initWithArray:objects];
                visibleArray = [[NSArray alloc] initWithArray:objects];
                FotosArray1 = [[NSArray alloc] initWithArray:objects];
                FotosArray2 = [[NSArray alloc] initWithArray:objects];
                FotosArray3 = [[NSArray alloc] initWithArray:objects];
                
                
            }
            
            [cellection reloadData];
        }];
        
    }
    if(segment.selectedSegmentIndex == 1){
        PFQuery *retrieveColors2 = [PFQuery queryWithClassName:@"Otros"];
        [retrieveColors2 orderByAscending:@"precio"];
        [retrieveColors2 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                FotosArray = [[NSArray alloc] initWithArray:objects];
                precioArray = [[NSArray alloc] initWithArray:objects];
                nombreArray = [[NSArray alloc] initWithArray:objects];
                visibleArray = [[NSArray alloc] initWithArray:objects];
                FotosArray1 = [[NSArray alloc] initWithArray:objects];
                FotosArray2 = [[NSArray alloc] initWithArray:objects];
                FotosArray3 = [[NSArray alloc] initWithArray:objects];
                
                
            }
            
            [cellection reloadData];
        }];
        
        
    }
    
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
    return [FotosArray count];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    PFObject *tempObjec2 = [nombreArray objectAtIndex:indexPath.row];
    PFObject *tempObjec3 = [precioArray objectAtIndex:indexPath.row];
    PFObject *tempObjec4 = [visibleArray objectAtIndex:indexPath.row];
    
    
    
    cell.nombre.text = [tempObjec2 objectForKey:@"Nombre"];
    cell.precio.text = [tempObjec3 objectForKey:@"Precio"];
    cell.visible = [tempObjec4 objectForKey:@"visible"];
    
    
    
    
    
    
    PFObject *FotoObjec = [FotosArray objectAtIndex:indexPath.row];
    
    PFFile *foto = [FotoObjec objectForKey:@"Imagen"];
    [foto getDataInBackgroundWithBlock:^(NSData *data, NSError *error){
        if(!error){
            cell.imagen.image = [UIImage imageWithData:data];
        }
        
    }];
    
    
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Info"]) {
        NSArray *indexPaths = [self.cellection indexPathsForSelectedItems];
        InfoViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        
        //destViewController.recipeImageName = [recipeImages[indexPath.section] objectAtIndex:indexPath.row];
        
        
        PFObject *imageObject = [FotosArray objectAtIndex:indexPath.row];
        PFFile *imageFile = [imageObject objectForKey:@"Imagen"];
        NSData *imageData = [imageFile getData];
        UIImage *image = [UIImage imageWithData:imageData];
        
        destViewController.Foto = image;
        
        PFObject *imageObject1 = [FotosArray1 objectAtIndex:indexPath.row];
        PFFile *imageFile1 = [imageObject1 objectForKey:@"Imagen1"];
        NSData *imageData1 = [imageFile1 getData];
        UIImage *image1 = [UIImage imageWithData:imageData1];
        
        destViewController.Foto1 = image1;
        
        PFObject *imageObject2 = [FotosArray2 objectAtIndex:indexPath.row];
        PFFile *imageFile2 = [imageObject2 objectForKey:@"Imagen2"];
        NSData *imageData2 = [imageFile2 getData];
        UIImage *image2 = [UIImage imageWithData:imageData2];
        
        destViewController.Foto2 = image2;
        
        PFObject *imageObject3 = [FotosArray3 objectAtIndex:indexPath.row];
        PFFile *imageFile3 = [imageObject3 objectForKey:@"Imagen3"];
        NSData *imageData3 = [imageFile3 getData];
        UIImage *image3 = [UIImage imageWithData:imageData3];
        
        destViewController.Foto3 = image3;
        
        
        
        PFObject *ComentaObject = [nombreArray objectAtIndex:indexPath.row];
        destViewController.recipeNombre =[ComentaObject objectForKey:@"Nombre"];
        
        PFObject *TituloObject = [precioArray objectAtIndex:indexPath.row];
        destViewController.recipePrecio = [TituloObject objectForKey:@"Precio"];
        
        PFObject *PrecioObject2 = [visibleArray objectAtIndex:indexPath.row];
        destViewController.StringVisible =[PrecioObject2 objectForKey:@"visible"];
        
        
    }
}




@end
