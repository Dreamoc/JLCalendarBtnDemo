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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    JLCalendarBtn *btn = [[JLCalendarBtn alloc]initWithFrame:CGRectMake(100, 50, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    btn.currentYear  =2022;
    btn.currentMonth = 12;
    [self.view addSubview:btn];
    
    JLCalendarBtn *btn1 = [[JLCalendarBtn alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    btn1.backgroundColor = [UIColor redColor];
    btn1.currentYear  =2033;
    [self.view addSubview:btn1];
    
    JLCalendarBtn *btn2 = [[JLCalendarBtn alloc]initWithFrame:CGRectMake(100, 350, 100, 100)];
    btn2.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn2];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
