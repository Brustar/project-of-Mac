//
//  CICMyDocumentController.m
//  CIC library
//
//  Created by Brustar.xiao on 2018/3/23.
//  Copyright © 2018年 Brustar.xiao. All rights reserved.
//

#import "CICMyDocumentController.h"
#import "JRTLeftSliderController.h"

@interface CICMyDocumentController ()
@property (nonatomic, readonly) JRTLeftSliderController *leftSliderController;
@end

@implementation CICMyDocumentController

- (JRTLeftSliderController *)leftSliderController {
    if ([self.parentViewController isKindOfClass:[JRTLeftSliderController class]]) {
        return (JRTLeftSliderController *)self.parentViewController;
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)menuAction:(id)sender {
    [self.leftSliderController showLeftContainer:YES animated:YES];
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

@end
