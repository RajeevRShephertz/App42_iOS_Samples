//
//  App42LoginViewController.m
//  SearchByPassion
//
//  Created by Rajeev Ranjan on 31/12/13.
//  Copyright (c) 2013 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import "App42LoginViewController.h"
#import "App42ApiHandler.h"
#import "App42Constants.h"


@interface App42LoginViewController ()

@end

@implementation App42LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    emailToSignUp.delegate = self;
    userNameToLogin.delegate = self;
    userNameToSignUp.delegate = self;
    passwordToLogin.delegate = self;
    passwordToSignUp.delegate = self;

    
    emailToSignUp.enablesReturnKeyAutomatically = YES;
    userNameToLogin.enablesReturnKeyAutomatically = YES;
    userNameToSignUp.enablesReturnKeyAutomatically = YES;
    passwordToLogin.enablesReturnKeyAutomatically = YES;
    passwordToSignUp.enablesReturnKeyAutomatically = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)signIn:(id)sender
{
    NSString *userName = userNameToLogin.text;
    NSString *password = passwordToLogin.text;
    
    if (!userName || !password)
    {
        [self showAlertWithInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Exception",TITLE,@"Fields can not be empty!",MESSAGE, nil]];
    }
    else
    {
        userName = [userName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        password = [password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (!userName.length || !password.length)
        {
            [self showAlertWithInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Exception",TITLE,@"Fields can not be empty!",MESSAGE, nil]];
        }
        else
        {
             NSMutableDictionary *responseDict = [[App42ApiHandler sharedInstance] loginUserWithName:userName password:password];
            
            if (responseDict)
            {
                if (![[responseDict objectForKey:@"isResponseSuccess"] boolValue])
                {
                    NSError *error = nil;
                    SBJSON *json = [[SBJSON alloc] init];
                    NSDictionary *exceptionDict = [json objectWithString:[responseDict objectForKey:@"exception"] error:&error];
                    NSString *message = [[exceptionDict objectForKey:@"app42Fault"] objectForKey:@"details"];
                    [self showAlertWithInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Exception",TITLE,message,MESSAGE, nil]];
                }
                else
                {
                    [self showAlertWithInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Login",TITLE,@"Loggedin successfully!",MESSAGE,[NSNumber numberWithLong:[sender tag]],ALERT_TAG, nil]];
                }
            }
        }
    }
    
}


-(IBAction)signUp:(id)sender
{
    signUpView.hidden = NO;
    self.navigationItem.title = @"Register";
}


-(IBAction)registerAction:(id)sender
{
   
    NSString *userName = userNameToSignUp.text;
    NSString *password = passwordToSignUp.text;
    NSString *emailId  = emailToSignUp.text;
    
    if (!userName || !password || !emailId)
    {
        [self showAlertWithInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Exception",TITLE,@"Fields can not be empty!",MESSAGE, nil]];
    }
    else
    {
        userName = [userName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        password = [password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        emailId  = [emailId stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if (!userName.length || !password.length || !emailId.length)
        {
            [self showAlertWithInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Exception",TITLE,@"Fields can not be empty!",MESSAGE, nil]];
        }
        else if (![self isEmailValid:emailId])
        {
            [self showAlertWithInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Exception",TITLE,@"Enter a valid email address!",MESSAGE, nil]];
        }
        else
        {
            NSMutableDictionary *responseDict = [[App42ApiHandler sharedInstance] registerUserWithName:userName email:emailId password:password];
            if (responseDict)
            {
                if (![[responseDict objectForKey:@"isResponseSuccess"] boolValue])
                {
                    NSError *error = nil;
                    SBJSON *json = [[SBJSON alloc] init];
                    NSDictionary *exceptionDict = [json objectWithString:[responseDict objectForKey:@"exception"] error:&error];
                    [self showAlertWithInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Exception",TITLE,[[exceptionDict objectForKey:@"app42Fault"] objectForKey:@"details"],MESSAGE, nil]];
                }
                else
                {
                    [self showAlertWithInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Registration",TITLE,@"Registered successfully!",MESSAGE,[NSNumber numberWithLong:[sender tag]],ALERT_TAG, nil]];
                }
            }
        }
    }
}


-(void)showAlertWithInfo:(NSDictionary*)infoDict
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[infoDict objectForKey:TITLE] message:[infoDict objectForKey:MESSAGE] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    alertView.tag = [[infoDict objectForKey:ALERT_TAG] integerValue];
    [self.view addSubview:alertView];
    [alertView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ((alertView.tag == 2)||(alertView.tag == 3))
    {
       
    }
    else
    {
        // Do Nothing
    }
}


-(BOOL)isEmailValid:(NSString*)email
{
    if(email == NULL)
    {
        return NO;
    }
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
}



-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
