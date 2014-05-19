//
//  LoginViewController.m
//  
//
//  Created by Steve Toosevich on 5/16/14.
//
//

#import "LoginViewController.h"
#import "Parse/Parse.h"
//#import "ParseManager.h"

@interface LoginViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[PFUser logOut];
    
    CALayer *loginButtonLayer = [self.loginButton layer];
    [loginButtonLayer setMasksToBounds:YES];
    [loginButtonLayer setCornerRadius:5.0f];
    
    self.passwordTextField.secureTextEntry = YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    if ([PFUser currentUser]){
        [self performSegueWithIdentifier:@"LoggedInSegue" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (IBAction)onLoginButtonPressed:(id)sender {
    [PFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passwordTextField.text];
    if ([PFUser currentUser])
    {
        [self performSegueWithIdentifier:@"LoggedInSegue" sender:self];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
    return YES;
}

@end
