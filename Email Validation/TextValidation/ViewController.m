//
//  ViewController.m
//  TextValidation
//
//  Created by ShrawanKumar Sharma on 07/03/17.
//  Copyright © 2017 com.ContainerVC. All rights reserved.
//

#import "ViewController.h"
#import "BZGMailgunEmailValidator.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfIELD;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_textfIELD addTarget:self
                            action:@selector(emailPwdValidation:)
                  forControlEvents:UIControlEventAllEditingEvents];

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)emailPwdValidation:(UITextField *)textField{
    
    BZGMailgunEmailValidator *validator =
    [BZGMailgunEmailValidator validatorWithPublicKey:@"pubkey-6ffu8aekev7xnv2ajgx3w8iy8jlop6w0"];
    
    [validator validateEmailAddress:textField.text
                            success:^(BOOL isValid, NSString *didYouMean) {
                               
                                NSLog(@" **didYouMean== %@ ---  && isValid %d  **",didYouMean,isValid  );
                                
                                
                                
                            } failure:^(NSError *error) {
                                
                                
                            }];
}


@end
