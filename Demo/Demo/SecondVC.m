//
//  SecondVC.m
//  Demo
//
//  Created by daejong on 16/7/30.
//  Copyright © 2016年 DaeJong. All rights reserved.
//

#import "SecondVC.h"

@implementation SecondVC

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor greenColor]];
    
//    self.navigationItem.title = @"SecondVC";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(clickCamera)];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"我的", @"你的"]];
    CGRect rect = segment.frame;
    rect.size.width = 150;
    segment.frame = rect;
    
    self.navigationItem.titleView = segment;
    
    [segment addTarget:self action:@selector(clickSegment:) forControlEvents:UIControlEventValueChanged];
    
    segment.selectedSegmentIndex = 0;
    
    
    
}

-(void)clickSegment:(UISegmentedControl *)segment {
    if(segment.selectedSegmentIndex == 0) {
        NSLog(@"first item...");
    } else if(segment.selectedSegmentIndex == 1) {
        NSLog(@"second item...");
    }
}

-(void)clickCamera {
    
}

@end
