//
//  ViewController.m
//  CIC library
//
//  Created by Brustar.xiao on 2018/3/20.
//  Copyright © 2018年 Brustar.xiao. All rights reserved.
//

#import "ViewController.h"
#import "CICLoginController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpace;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _logo.transform = CGAffineTransformMakeScale(1.0, 1.0);
    [UIView animateWithDuration:1.0 delay:2.0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        _logo.transform = CGAffineTransformMakeScale(0.68, 0.68);
    }completion:^(BOOL finish){
        [UIView animateWithDuration:1.0 animations:^{
            _topSpace.constant = 56;
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            //[self performSegueWithIdentifier:@"cic_login" sender:self];
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            CICLoginController *controller = [storyBoard instantiateViewControllerWithIdentifier:@"cicLogin"];
            
            UIWindow *window = UIApplication.sharedApplication.delegate.window;
            window.rootViewController = controller;
            [UIView transitionWithView:window
                              duration:1.0
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:nil];
        }];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
