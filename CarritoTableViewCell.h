//
//  CarritoTableViewCell.h
//  MiTienda
//
//  Created by Dani Gonzalez castillo on 23/09/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarritoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Nombre;
@property (weak, nonatomic) IBOutlet UILabel *Precio;
@property (weak, nonatomic) IBOutlet UILabel *Color;
@property (weak, nonatomic) IBOutlet UILabel *Talla;
@property (weak, nonatomic) IBOutlet UIImageView *imagen;

@end
