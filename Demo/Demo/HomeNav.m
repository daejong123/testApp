//
//  HomeNav.m
//  Demo
//
//  Created by daejong on 16/7/30.
//  Copyright © 2016年 DaeJong. All rights reserved.
//

#import "HomeNav.h"

@implementation HomeNav

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [[UINavigationBar appearance] setTranslucent:NO];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    
}

//重写push方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(clickBack)];
    
    [super pushViewController:viewController animated:YES];
}

-(void)clickBack {
    [super popViewControllerAnimated:YES];
}

@end
