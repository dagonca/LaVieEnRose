//
//  CarroViewController.h
//  MiTienda
//
//  Created by Dani Gonzalez castillo on 23/09/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarroViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *LabelTotal;

@end
