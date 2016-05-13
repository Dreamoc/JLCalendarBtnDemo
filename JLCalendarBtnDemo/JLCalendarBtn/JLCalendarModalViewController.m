//
//  JLCalendarModalViewController.m
//  JLCustomCalendar
//
//  Created by eall_linger on 16/5/13.
//  Copyright © 2016年 eall_linger. All rights reserved.
//

#import "JLCalendarModalViewController.h"
#import "JLCalendarScrollView.h"

@interface JLCalendarModalViewController ()<JLCalendarItemDelegate>

@end

@implementation JLCalendarModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createCalendarNavigationBar];
    [self createMainView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)createCalendarNavigationBar
{
    UIView *nvView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width,64)];
    nvView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:nvView];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 44, 44)];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backOnClick) forControlEvents:UIControlEventTouchUpInside];
    [nvView addSubview:backBtn];
}
- (void)backOnClick
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)createMainView
{
    self.view.backgroundColor = [UIColor whiteColor];
    JLCalendarScrollView * view = [[JLCalendarScrollView alloc]initWithFrame:CGRectMake(0,64, self.view.frame.size.width, 300)];
    view.delegate       = self;
    view.currentDay     = self.currentDay;
    view.currentMonth   = self.currentMonth;
    view.currentYear    = self.currentYear;
    [self.view addSubview:view];

}
- (void)seletedOneDay:(NSInteger)day withMonth:(NSInteger)month withYear:(NSInteger)year
{
    [self.delegate seletedOneDay:day withMonth:month withYear:year];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)monthOnclick:(NSInteger)lastOrNext
{
    if (lastOrNext) {
        NSLog(@"下一个月");
    }else{
        NSLog(@"上一个月");
    }
}

-(void)yearOnclick:(NSInteger)lastOrNext
{
    if (lastOrNext) {
        NSLog(@"下一个年");
    }else{
        NSLog(@"上一个年");
    }
}
@end
