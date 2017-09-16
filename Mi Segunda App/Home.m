//
//  ViewController.m
//  Mi Segunda App
//
//  Created by Sergio Martinez on 9/16/17.
//  Copyright © 2017 Sergio Martinez. All rights reserved.
//

#import "Home.h"

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//On press and release action the label text will change to "Mentira!"
- (IBAction)changeButtonPressed:(id)sender {
    self.lbWelcome.text = @"Mentira";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
