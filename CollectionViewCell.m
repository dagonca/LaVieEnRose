//
//  CollectionViewCell.m
//  LaVieEnRose
//
//  Created by Dani Gonzalez castillo on 12/11/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
@synthesize imagen,nombre,precio,visible,imagenAgotada;



- (void)awakeFromNib {
    self.imagen.layer.cornerRadius=10.0f;
    self.imagen.clipsToBounds = YES;
   
}
@end
