//
//  ViewController.m
//  RAYWebView
//
//  Created by 党磊 on 15/9/16.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad { // addSubview
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *sv = [[UIView alloc]init];
    sv.backgroundColor = [UIColor blueColor];
    [self.view addSubview:sv];
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make){
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(130, 130));
    }];
    
    NSString *dateString = [RAYDateFormatterUitl dateToStringFormat:[NSDate date] partten:@"yyyyMMddHHmmss"];
    NSLog(@"%@",RAY_CONSTANT_DEFAULT_DATETIME_FORMAT_PATTERN);
    
}

- (void)viewWillAppear:(BOOL)animated {//布局
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate

#pragma mark - event response

#pragma mark - private methods

#pragma mark - getters and setters


@end
