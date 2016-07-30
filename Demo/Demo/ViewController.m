//
//  ViewController.m
//  Demo
//
//  Created by daejong on 16/7/30.
//  Copyright © 2016年 DaeJong. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)clickNext {
    SecondVC *secondVC = [[SecondVC alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    [self.navigationItem setTitle:@"VC"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(clickNext)];
    
}

//沙盒中存取图片文件。
-(void)test1 {
    UIImage *image = [UIImage imageNamed:@"icon"];
    NSData *imageData = UIImagePNGRepresentation(image);
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"path = %@", path);
    
    
    NSString *ImagesPath = [path stringByAppendingPathComponent:@"images"];
    NSString *firstPng = [ImagesPath stringByAppendingPathComponent:@"firstPng"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager fileExistsAtPath:ImagesPath]) {
        NSLog(@"create directory...");
        if(![manager createDirectoryAtPath:ImagesPath withIntermediateDirectories:YES attributes:nil error:nil]) {
            NSLog(@"create failed");
        }
    }
    
    if(![manager fileExistsAtPath:firstPng]) {
        NSLog(@"createFile...");
        if(![manager createFileAtPath:firstPng contents:nil attributes:nil]) {
            NSLog(@"create failed...");
        }
        
    }
    
    if([imageData writeToFile:firstPng atomically:YES]) {
        NSLog(@"success!");
    }
    
    UIImage *myImage = [UIImage imageWithContentsOfFile:firstPng];
    UIImageView *myImageView = [[UIImageView alloc] initWithImage:myImage];
    [self.view addSubview:myImageView];
    [myImageView setFrame:CGRectMake(20, 100, 100, 100)];
    [myImageView setContentMode:UIViewContentModeScaleAspectFit];
}

//获取当前时间。
-(void)test {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    NSDate *currentTime = [NSDate date];
    NSString *timeString = [dateFormatter stringFromDate:currentTime];
    NSLog(@"timeString = %@", timeString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
