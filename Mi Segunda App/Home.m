//
//  ViewController.m
//  Mi Segunda App
//
//  Created by Sergio Martinez on 9/16/17.
//  Copyright © 2017 Sergio Martinez. All rights reserved.
//

#import "Home.h"

//Color picker variables
int rcolor=0;
int gcolor=0;
int bcolor=0;
float alpha=1;
UIColor *color;
NSString *hex;

//Changing value label variables
int currentValue = 0;
int currentColor = 0;
NSArray *labelTitles ;
NSArray *labelColors;

@interface Home () {

}

@end

@implementation Home

//Initialize variables and return an object of the curent class
- (instancetype) initWithCoder: (NSCoder*) decoder {
    if (self = [super initWithCoder:decoder]) {
        labelTitles = @[@"Uno", @"Dos", @"Tres", @"Cuatro", @"Cinco"];
        labelColors = @[[UIColor redColor], [UIColor yellowColor], [UIColor greenColor], [UIColor purpleColor], [UIColor blueColor]];
    }
    return self;
}

//This function is executed on view load
- (void)viewDidLoad {

    _lbColor.layer.cornerRadius = CGRectGetWidth(_lbColor.frame)/2;
    _lbColor.layer.masksToBounds = true;
    

    
    [self refreshColor];
}

- (void)didReceiveMemoryWarning {

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

void setColor(int rcol,int gcol,int bcol, float al){
    rcolor=rcol;
    gcolor=gcol;
    bcolor=bcol;
    alpha=al;
    color=[UIColor colorWithRed:rcolor/255.0
                          green:gcolor/255.0
                           blue:bcolor/255.0
                          alpha:al];
    
}

-(void) refreshColor{
    //Asi se llama a un action
    //[self changeGreen:nil];
    
    alpha=self.slAlpha.value;
    alpha=(double)alpha/100;
    self.lbAlpha.text=[NSString stringWithFormat:@"%.2f", alpha];
    
    gcolor=self.slGreen.value;
    self.lbGreen.text=[@(gcolor) stringValue];
    
    bcolor=self.slBlue.value;
    self.lbBlue.text=[@(bcolor) stringValue];
    
    rcolor=self.slRed.value;
    self.lbRed.text=[@(rcolor) stringValue];
    setColor(rcolor, gcolor, bcolor, alpha);
    
    
    self.lbColor.backgroundColor=color;
    
    NSString *hexred=@"";
    hexred = [NSString stringWithFormat:@"%lX",
              (unsigned long)[[@(rcolor) stringValue] integerValue]];
    
    NSString *hexgreen=@"";
    hexgreen = [NSString stringWithFormat:@"%lX",
                (unsigned long)[[@(gcolor) stringValue] integerValue]];
    
    NSString *hexblue=@"";
    hexblue = [NSString stringWithFormat:@"%lX",
               (unsigned long)[[@(bcolor) stringValue] integerValue]];
    
    NSString *hex;
    
    hexred=[self formatHex:hexred];
    hexgreen=[self formatHex:hexgreen];
    hexblue=[self formatHex:hexblue];
    hex = [NSString stringWithFormat:@"%@%@%@",hexred,hexgreen,hexblue ];
    self.txtColor.text=hex;
    
}

-(NSString*) formatHex:(NSString*)hex{
    int len = [hex length];
    if(len==1){
        hex = [NSString stringWithFormat:@"%@%@",@"0",hex ];
    }
    return hex;
}

- (IBAction)changeRed:(id)sender {
    [self refreshColor];
}

- (IBAction)changeAlpha:(id)sender {
    [self refreshColor];
}


- (IBAction)changeGreen:(id)sender {
    [self refreshColor];
}

- (IBAction)changeBlue:(id)sender {
    [self refreshColor];
}
- (IBAction)hideColorPanel:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        self.lbColor.hidden = false;
    } else {
        self.lbColor.hidden = true;
    }
}

- (IBAction)setRandomColor:(id)sender {
    rcolor = arc4random() % 254;
    gcolor = arc4random() % 254;
    bcolor = arc4random() % 254;
    alpha = arc4random() % 254;
    setColor(rcolor, gcolor, bcolor, alpha);
    self.lbColor.backgroundColor=color;
}

- (IBAction)showAlert:(id)sender {
    UIAlertController * alert;
    if(self.swShowHide.isOn){
        alert = [UIAlertController
                alertControllerWithTitle:@"Alert"
                message:[NSString stringWithFormat:@"%@%@%@",self.NombreText.text,self.TelefonoText.text,self.txtColor.text]
                preferredStyle:UIAlertControllerStyleAlert];
    }else{
       alert = [UIAlertController
                                     alertControllerWithTitle:@"Alert"
                                     message:@"No hay Circulo"
                                     preferredStyle:UIAlertControllerStyleAlert];
    }
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
    }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
