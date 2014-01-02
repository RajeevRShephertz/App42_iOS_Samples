//
//  App42LoginViewController.h
//  SearchByPassion
//
//  Created by Rajeev Ranjan on 31/12/13.
//  Copyright (c) 2013 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface App42LoginViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UIView *signUpView;
    IBOutlet UITextField *userNameToLogin;
    IBOutlet UITextField *passwordToLogin;
    IBOutlet UITextField *userNameToSignUp;
    IBOutlet UITextField *emailToSignUp;
    IBOutlet UITextField *passwordToSignUp;
    IBOutlet UIButton    *signInButton;
    IBOutlet UIButton    *signUpButton;
}

-(IBAction)signIn:(id)sender;
-(IBAction)signUp:(id)sender;
-(IBAction)registerAction:(id)sender;
@end
