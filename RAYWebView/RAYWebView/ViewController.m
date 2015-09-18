//
//  ViewController.m
//  RAYWebView
//
//  Created by 党磊 on 15/9/16.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import "ViewController.h"
#import "RAYCircleProgressView.h"

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
    
//    NSString * dateString = [RAYDateFormatterUitl dateToStringFormat:[NSDate date] partten:@"yyyyMMddHHmmss"];
//    NSLog(@"%@",RAY_CONSTANT_DEFAULT_DATETIME_FORMAT_PATTERN);
    
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(40, 40, 40, 40)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = path.CGPath;
    sv.layer.mask = maskLayer;
    
    RAYCircleProgressView *progress = [[RAYCircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:progress];
    progress.trackColor = [UIColor blackColor];
    progress.progressColor = [UIColor orangeColor];
    progress.progress = .7;
    progress.progressWidth = 10;
    
    
    NSString *url =  @"http://www.zhefengcaifu.com/zf-appserver/process";
    NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:
                              @"3",@"page_num",//
                              @"00",@"product_type",//
                              @"20150918145127",@"req_time",//
                              @"ProductList", @"req_type",//
                              @"0", @"start_index",
                              nil];
    
    [[NetworkSingleton sharedManager] postAppInitial:dic url:url successBlock:^(id responseBody){
        NSLog(@"请求成功");
        NSLog(@"%@",responseBody[@"msg_rsp_desc"]);
                NSLog(@"%@",responseBody);
    } failureBlock:^(NSString *error){
        NSLog(@"请求失败：%@",error);
    }];
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
