//
//  InfoViewController.h
//  LaVieEnRose
//
//  Created by Dani Gonzalez castillo on 12/11/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController<UITextFieldDelegate>



@property (nonatomic, strong) UIImage *Foto;

@property (nonatomic, strong) UIImage *Foto1;
@property (nonatomic, strong) UIImage *Foto2;
@property (nonatomic, strong) UIImage *Foto3;

@property (nonatomic, strong) NSString *recipeNombre;
@property (nonatomic, strong) NSString *recipeCantidad;
@property (nonatomic, strong) NSString *recipePrecio;
@property (nonatomic, strong) NSString *StringPrecio;
@property (nonatomic, strong) NSString *StringVisible;


@property (strong, nonatomic) IBOutlet UIView *viewg;
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (weak, nonatomic) IBOutlet UILabel *labelNombre;
@property (weak, nonatomic) IBOutlet UILabel *labelPrecio;
@property (weak, nonatomic) IBOutlet UITextField *cant;
@property (weak, nonatomic) IBOutlet UIPageControl *pageContro;
@end
