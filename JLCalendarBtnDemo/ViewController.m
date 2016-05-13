//
//  ViewController.m
//  JLCalendarBtnDemo
//
//  Created by eall_linger on 16/5/13.
//  Copyright © 2016年 eall_linger. All rights reserved.
//

#import "ViewController.h"
#import "JLCalendarBtn.h"

@interface ViewController ()

@end

@implementation ViewController
{
    JLCalendarBtn *btn;
    JLCalendarBtn *btn1;
    JLCalendarBtn *btn2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    btn = [[JLCalendarBtn alloc]initWithFrame:CGRectMake(100, 50, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    btn.currentYear  =2022;
    btn.currentMonth = 12;
    [self.view addSubview:btn];
    
    btn1 = [[JLCalendarBtn alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    btn1.backgroundColor = [UIColor redColor];
    btn1.currentYear  =2033;
    [self.view addSubview:btn1];
    
    btn2 = [[JLCalendarBtn alloc]initWithFrame:CGRectMake(100, 350, 100, 100)];
    btn2.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn2];

    
    
    UIButton *btsssn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    [btsssn addTarget:self action:@selector(log) forControlEvents:UIControlEventTouchUpInside];
    btsssn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btsssn];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)log
{
    NSLog(@"btn:%ld-%ld-%ld",btn.currentYear,btn.currentMonth,btn.currentDay);
    NSLog(@"btn1:%ld-%ld-%ld",btn1.currentYear,btn1.currentMonth,btn1.currentDay);
    NSLog(@"btn2:%ld-%ld-%ld",btn2.currentYear,btn2.currentMonth,btn2.currentDay);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
