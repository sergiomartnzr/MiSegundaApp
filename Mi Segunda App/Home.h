//
//  ViewController.h
//  Mi Segunda App
//
//  Created by Sergio Martinez on 9/16/17.
//  Copyright © 2017 Sergio Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lbWelcome;

@property (strong, nonatomic) IBOutlet UILabel *lbColor;
@property (strong, nonatomic) IBOutlet UILabel *lbRed;
@property (strong, nonatomic) IBOutlet UILabel *lbGreen;
@property (strong, nonatomic) IBOutlet UILabel *lbBlue;
@property (strong, nonatomic) IBOutlet UILabel *lbAlpha;

@property (strong, nonatomic) IBOutlet UITextField *txtColor;

@property (strong, nonatomic) IBOutlet UISlider *slRed;
@property (strong, nonatomic) IBOutlet UISlider *slGreen;
@property (strong, nonatomic) IBOutlet UISlider *slBlue;
@property (strong, nonatomic) IBOutlet UISlider *slAlpha;

@property (weak, nonatomic) IBOutlet UISwitch *swShowHide;

@property (weak, nonatomic) IBOutlet UITextField *NombreText;
@property (weak, nonatomic) IBOutlet UITextField *TelefonoText;
@property (weak, nonatomic) IBOutlet UIButton *alertaButton;

- (IBAction)changeGreen:(id)sender;
- (IBAction)changeBlue:(id)sender;
- (IBAction)changeRed:(id)sender;
- (IBAction)changeAlpha:(id)sender;

@end

