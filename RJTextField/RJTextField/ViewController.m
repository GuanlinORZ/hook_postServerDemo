//
//  ViewController.m
//  RJTextField
//
//  Created by ChangRJey on 2017/7/27.
//  Copyright © 2017年 RenJiee. All rights reserved.
//

#import "ViewController.h"
#import "RJTextField.h"

@interface ViewController ()
@property(nonatomic,strong)RJTextField * account;
@property(nonatomic,strong)RJTextField * password;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.account = [[RJTextField alloc]initWithFrame:CGRectMake(0, 60, SCREEN_SIZE.width, 60)];
    self.account.placeholder = @"请输入手机号";
    self.account.maxLength = 11;
    self.account.errorStr = @"超出字数限制";
    self.account.leftIconName = @"loginPhone";
    self.account.textField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.account];
    
    self.password = [[RJTextField alloc]initWithFrame:CGRectMake(0, 120, SCREEN_SIZE.width, 60)];
    self.password.placeholder = @"请输入密码";
    self.password.maxLength = 16;
    self.password.errorStr = @"超出字数限制";
    self.password.leftIconName = @"Key";
    self.password.textField.keyboardType = UIKeyboardTypeASCIICapable;
    self.password.textField.secureTextEntry = YES;
    [self.view addSubview:self.password];
    
    UIButton * loginButton = [UIButton buttonWithType:0];
    loginButton.frame = CGRectMake(0, 200, SCREEN_SIZE.width, 60);
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    loginButton.backgroundColor = [UIColor redColor];
    loginButton.titleLabel.textColor = [UIColor whiteColor];
    
    
    
}

-(void)loginBtnClick{
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.100:8080?name=%@&pwd=%@",self.account.textField.text,self.password.textField.text]]];
    
    [request setTimeoutInterval:30];
    
    [request setHTTPMethod:@"POST"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
     
                           completionHandler:^(NSURLResponse *respone,
                                               
                                               NSData *data,
                                               
                                               NSError *error)
     
     {
         NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)respone;
         if(httpResponse.statusCode == 200){
             NSLog(@"send pwd success!");
         }
         
         
     }];
}
// 退出键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
