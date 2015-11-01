//
//  TwitterViewController.m
//  LaVieEnRose
//
//  Created by Dani Gonzalez castillo on 12/11/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "TwitterViewController.h"

@interface TwitterViewController ()

@end

@implementation TwitterViewController
@synthesize web;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlAd =[[NSBundle mainBundle]pathForResource:@"twitter" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:urlAd];
    NSURLRequest *reqOb=[NSURLRequest requestWithURL:url];
    [web loadRequest:reqOb];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
