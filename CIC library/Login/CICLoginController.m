//
//  CICLoginController.m
//  CIC library
//
//  Created by Brustar.xiao on 2018/3/20.
//  Copyright © 2018年 Brustar.xiao. All rights reserved.
//

#import "CICLoginController.h"
#import "EasyShowView.h"
#import "EasyAlertGlobalConfig.h"

@interface CICLoginController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *forgotten;

@end

@implementation CICLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.loginBtn setBackgroundColorOfNormal:kOtherColor(@"D0E2D7")];
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self login];
    }];
    
    [[self.forgotten rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        NSMutableAttributedString *leftAlign = [[NSMutableAttributedString alloc] initWithString:@"请输入您的邮箱"];
        [leftAlign addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, [[leftAlign string] length])];
        [alertController setValue:leftAlign forKey:@"attributedTitle"];
        
        UIView *subView1 = alertController.view.subviews[0];
        UIView *subView2 = subView1.subviews[0];
        UIView *subView3 = subView2.subviews[0];
        UIView *subView4 = subView3.subviews[0];
        UIView *subView5 = subView4.subviews[0];
        
        UILabel *title = subView5.subviews[0];
        title.textAlignment = NSTextAlignmentLeft;
        
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"请输入邮箱地址";
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [cancelAction setValue:kOtherColor(@"979797") forKey:@"_titleTextColor"];
        
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UITextField *mail = alertController.textFields.firstObject;
            NSLog(@"mail is %@",mail.text);
            [[DTNetworkRAC RACHTTPPost:CREATE_URL(FORGOTTEN_URL) param:@{@"email":mail.text}] subscribeNext:^(id x) {
                if ([x[@"status"] doubleValue] == 0) {
                    [self showTips:[NSString stringWithFormat: @"重置密码邮件已发送到%@",mail.text]];
                }else{
                    [self showTips:@"不存在该邮箱，邮件发送失败"];
                }
            }];
        }];
        
        [confirmAction setValue:kOtherColor(@"34AD54") forKey:@"_titleTextColor"];
        [alertController addAction:cancelAction];
        [alertController addAction:confirmAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
    
    [self.account setValue:kOtherColor(@"4BD274") forKeyPath:@"_placeholderLabel.textColor"];
    self.account.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"login_account_icon"]];
    self.account.leftViewMode=UITextFieldViewModeAlways;
    self.account.backgroundColor = kOtherColor(@"A4EDB7");
    
    [self.pwd setValue:kOtherColor(@"4BD274") forKeyPath:@"_placeholderLabel.textColor"];
    self.pwd.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"login_pwd_icon"]];
    self.pwd.leftViewMode=UITextFieldViewModeAlways;
    self.pwd.backgroundColor = kOtherColor(@"A4EDB7");
    
    RACSignal *signal1 = [_account rac_textSignal];
    RACSignal *signal2 = [_pwd rac_textSignal];
    RAC(self.loginBtn,enabled) = [[RACSignal combineLatest:@[signal1,signal2]] reduceEach:^id(NSString *account, NSString *pwd){
        
        if (account.length>INPUT_LENGTH && pwd.length>INPUT_LENGTH) {
            [_loginBtn setColorOfNormal:kOtherColor(@"3FB25D")];
        }else{
            [_loginBtn setColorOfNormal:kOtherColor(@"AAD3B5")];
        }
        return @(account.length>INPUT_LENGTH && pwd.length>INPUT_LENGTH);
    }];
    
    [[self rac_signalForSelector:@selector(textFieldShouldReturn:) fromProtocol:@protocol(UITextFieldDelegate)] subscribeNext:^(RACTuple *tuple) {
        UITextField *textField = (UITextField *)tuple.first;
        if ([textField isEqual:_account]) {
            [_pwd becomeFirstResponder];
        }else{
            [_pwd resignFirstResponder];
            [self login];
        }
    }];
}

-(void)showTips:(NSString *)tip
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    NSMutableAttributedString *subTitleAttr = [[NSMutableAttributedString alloc] initWithString:tip];
    [subTitleAttr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, [[subTitleAttr string] length])];
    [subTitleAttr addAttribute:NSForegroundColorAttributeName value:kTipsFontColor range:NSMakeRange(0, [[subTitleAttr string] length])];
    [alertController setValue:subTitleAttr forKey:@"attributedMessage"];
    
    NSMutableAttributedString *titleAttr = [[NSMutableAttributedString alloc] initWithString:@"提示"];
    [titleAttr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, [[titleAttr string] length])];
    [titleAttr addAttribute:NSForegroundColorAttributeName value:kTipsFontColor range:NSMakeRange(0, [[titleAttr string] length])];
    [alertController setValue:titleAttr forKey:@"attributedTitle"];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [confirmAction setValue:kTipsFontColor forKey:@"_titleTextColor"];
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)autoTips:(NSString *)tip
{
    [EasyTextView showText:tip config:^EasyTextConfig *{
        return [EasyTextConfig shared].setAnimationType(TextAnimationTypeNone).setStatusType(TextStatusTypeBottom).setBgColor([UIColor clearColor]).setTitleColor([UIColor redColor]).setSuperView(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark -
#pragma mark HTTP 请求
-(void)login
{
    [[DTNetworkRAC RACHTTPPost:CREATE_URL(LOGIN_URL) param:@{@"username":self.account.text,@"password":self.pwd.text}] subscribeNext:^(id x) {
        if ([x[@"status"] doubleValue] == 0) {
            NSDictionary *data = x[@"data"];
            
            NSDictionary *staff = @{@"name": data[@"user_nickname"] , @"avatar" : data[@"user_avatar"] , @"mail" :data[@"user_email"] , @"userId" : data[@"user_id"]};
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:staff forKey:@"staff"];
            [defaults synchronize];
            
            [self performSegueWithIdentifier:@"main" sender:self];
        }else{
            [self autoTips:@"对不起，登录失败，帐号和密码错误！"];
        }
    }];
}

@end
