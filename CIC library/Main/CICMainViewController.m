//
//  CICMainViewController.m
//  CIC library
//
//  Created by Brustar.xiao on 2018/3/22.
//  Copyright © 2018年 Brustar.xiao. All rights reserved.
//

#import "CICMainViewController.h"
#import "JRTLeftSliderController.h"
#import "CICMyDocumentController.h"
#import "CICMenuController.h"

@interface CICMainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *logout;
@property (weak, nonatomic) IBOutlet UIButton *library;

@end

@implementation CICMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self.logout rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"staff"];
        [self performSegueWithIdentifier:@"cic_logout" sender:self];
    }];
    
    [[self.library rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        JRTLeftSliderController *leftSliderController = [[JRTLeftSliderController alloc] init];
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CICMenuController *left = [storyBoard instantiateViewControllerWithIdentifier:@"cicMenu"];
        CICMyDocumentController *right = [storyBoard instantiateViewControllerWithIdentifier:@"cicMyDocument"];
        leftSliderController.leftViewController = left;
        leftSliderController.mainViewController = right;
        leftSliderController.interactiveShowGestureRecognizerEnable = YES;
        
        [self presentViewController:leftSliderController animated:YES completion:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
