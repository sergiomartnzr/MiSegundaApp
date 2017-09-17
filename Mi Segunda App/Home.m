//
//  ViewController.m
//  Mi Segunda App
//
//  Created by Sergio Martinez on 9/16/17.
//  Copyright © 2017 Sergio Martinez. All rights reserved.
//

#import "Home.h"

@interface Home () {

    int currentValue;
    int currentColor;

    NSArray *labelTitles;
    NSArray *labelColors;
}

@end

@implementation Home

//Initialize variables and return an object of the curent class
- (instancetype) initWithCoder: (NSCoder*) decoder {
    if (self = [super initWithCoder:decoder]) {
        currentValue = 0;
        currentColor = 0;
        labelTitles = @[@"Uno", @"Dos", @"Tres", @"Cuatro", @"Cinco"];
        labelColors = @[[UIColor redColor], [UIColor yellowColor], [UIColor greenColor], [UIColor purpleColor], [UIColor blueColor]];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//On press and release action the label text will change to "Mentira!"
- (IBAction)changeButtonPressed:(id)sender {
    
    NSString *currentTitle = labelTitles[currentValue ++];
    UIColor *currentBackground = labelColors[currentColor ++];
    
    self.lbWelcome.text = currentTitle;
    self.lbWelcome.backgroundColor = currentBackground;
    
    if (currentValue == labelTitles.count) {
        currentValue = 0;
    }
    
    if (currentColor == labelColors.count) {
        currentColor = 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
