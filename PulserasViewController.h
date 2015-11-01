//
//  PulserasViewController.h
//  LaVieEnRose
//
//  Created by Dani Gonzalez castillo on 12/11/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface PulserasViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *cellection;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@end
