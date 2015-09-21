//
//  ViewController.m
//  RAYWebView
//
//  Created by 党磊 on 15/9/16.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import "ViewController.h"
#import "RAYCircleView.h"
#import "RAYCircleProgressView.h"

@interface ViewController ()

@property (strong, nonatomic)RAYCircleProgressView *progressView;

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad { // addSubview
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    RAYCircleView *circle = [[RAYCircleView alloc]initWithFrame:CGRectMake(40, 40, 150, 150)];
    [circle setBackgroundColorWithView:[UIColor orangeColor]];
    [circle setTitleWithLabel:@""];
    [self.view addSubview:circle];
    
//    [sv mas_makeConstraints:^(MASConstraintMaker *make){
//        make.center.equalTo(self.view);
//        make.size.mas_equalTo(CGSizeMake(130, 130));
//    }];
    
//    NSString * dateString = [RAYDateFormatterUitl dateToStringFormat:[NSDate date] partten:@"yyyyMMddHHmmss"];
//    NSLog(@"%@",RAY_CONSTANT_DEFAULT_DATETIME_FORMAT_PATTERN);
    

    
    self.progressView = [[RAYCircleProgressView alloc] initWithFrame:CGRectMake(40, 150, 150, 150)];
    [self.view addSubview:self.progressView];
    self.progressView.trackColor = [UIColor blackColor];
    self.progressView.progressColor = [UIColor orangeColor];
    self.progressView.progress = .1;
    self.progressView.progressWidth = 10;
//    [self.progressView setProgress:0.9 animated:YES];
//    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make){
//        make.center.equalTo(self.view);
//        make.size.mas_equalTo(CGSizeMake(130, 130));
//    }];
    
 [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(progressChange) userInfo:nil repeats:YES];
    
    NSString *url =  @"http://www.zhefengcaifu.com/zf-appserver/process";
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:
                              @"3",@"page_num",//
                              @"00",@"product_type",//
                              @"20150918145127",@"req_time",//
                              @"ProductList", @"req_type",//
                              @"0", @"start_index",
                              nil];
//NetworkSingleton
/** 注释*/

    [[NetworkSingleton sharedManager] postAppInitial:dic
                                                 url:url
                                        successBlock:^(id responseBody){
                                            NSLog(@"请求成功");
                                            NSLog(@"%@",responseBody[@"msg_rsp_desc"]);
                                            NSLog(@"%@",responseBody);
                                        }
                                        failureBlock:^(NSString *error){
                                            NSLog(@"请求失败：%@",error);
                                                }];

}
- (void)progressChange {
    
    self.progressView.progress += 0.01;

    if (self.progressView.progress > 1.0f) {
        self.progressView.progress = 0.0f;
    }
}
- (void)viewWillAppear:(BOOL)animated {//布局
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - ****************
#pragma mark - delegate

#pragma mark - event response

#pragma mark - private methods

#pragma mark - getters and setters
#pragma mark - ****************
#pragma mark - Life Cycle
#pragma mark - Init View
#pragma mark - Network Request
#pragma mark - UITableViewDelegate
#pragma mark - CustomDelegate
#pragma mark - Event Response
#pragma mark - Private Methods
#pragma mark - Public Methods
#pragma mark - Getters And Setters

@end
