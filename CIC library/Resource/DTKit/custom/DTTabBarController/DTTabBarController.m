//
//  DTTabBarController.m
//  UITabBarControllerDemo
//
//  Created by DT on 15/9/4.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import "DTTabBarController.h"

@implementation DTTabBarItem

+(DTTabBarItem*)itemWithViewController:(UIViewController*)viewController
                                 title:(NSString*)title
                           normalImage:(NSString*)normalImage
                        highlightImage:(NSString*)highlightImage
                            badgeValue:(NSString*)badgeValue {
    DTTabBarItem *item = [[DTTabBarItem alloc] init];
    item.viewController = viewController;
    item.title = title;
    item.normalImage = normalImage;
    item.highlightImage = highlightImage;
    item.badgeValue = badgeValue;
    
    return item;
}


@end

#pragma mark -

@interface DTTabBarController ()<UITabBarControllerDelegate>

@end

@implementation DTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    [self.tabBar addSubview:self.shadeImageView];
    [self.tabBar sendSubviewToBack:self.shadeImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) clearShadowImage {
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
}


- (void) setNormalTintColor:(UIColor*)color {
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:color} forState:UIControlStateNormal];
}

- (void) setHighlightedTintColor:(UIColor*)color {
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:color} forState:UIControlStateSelected];
}

- (void) setBackgroundColor:(UIColor*)color {
    [self clearShadowImage];
    self.tabBar.backgroundColor = color;
}

- (void) setBackgroundImage:(UIImage*)image {
    [self clearShadowImage];
    self.tabBar.backgroundImage = image;
}

- (void) replaceAtIndex:(NSInteger)index
            normalImage:(NSString*)normalImage
         highlightImage:(NSString*)highlightImage {
    if (self.viewControllers.count > index) {
        UIViewController *vc = [self.viewControllers objectAtIndex:index];
        vc.tabBarItem.image = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:highlightImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}

- (void)setViewControllers:(NSArray *)viewControllers {
    
    NSMutableArray *array = [NSMutableArray new];
    for (int i=0; i<viewControllers.count; i++) {
        DTTabBarItem *item = [viewControllers objectAtIndex:i];
        if (![item isKindOfClass:[DTTabBarItem class]]) {
            continue;
        }
        UIViewController *vc = item.viewController;
        vc.tabBarItem.title = item.title;
        vc.tabBarItem.image = [[UIImage imageNamed:item.normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:item.highlightImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
        vc.tabBarItem.badgeValue = item.badgeValue;
        vc.tabBarItem.tag = i;
        
        [array addObject:vc];
    }
    if (array.count != viewControllers.count) {
        [super setViewControllers:viewControllers];
    }else{
        [super setViewControllers:array];
    }
    _shadeImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tabBar.frame)/viewControllers.count, CGRectGetHeight(self.tabBar.frame));
}

#pragma mark - UITabBarControllerDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    CGRect frame = _shadeImageView.frame;
    frame.origin.x = CGRectGetWidth(_shadeImageView.frame) * item.tag;
    
    [UIView animateWithDuration:0.25 animations:^{
        _shadeImageView.frame = frame;
    } completion:^(BOOL finished) {
        if (self.didSelectIndexBlock) {
            self.didSelectIndexBlock(item.tag);
        }
    }];
}

#pragma mark - setter
- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    CGRect frame = _shadeImageView.frame;
    frame.origin.x = CGRectGetWidth(_shadeImageView.frame) * self.selectedIndex;
    _shadeImageView.frame = frame;
}

#pragma mark - getter
- (UIImageView*)shadeImageView {
    if (!_shadeImageView) {
        _shadeImageView = [[UIImageView alloc] init];
        _shadeImageView.backgroundColor = [UIColor clearColor];
    }
    return _shadeImageView;
}

@end
