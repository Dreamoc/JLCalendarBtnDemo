//
//  JLCalendarBtn.h
//  JLCustomCalendar
//
//  Created by eall_linger on 16/5/13.
//  Copyright © 2016年 eall_linger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JlCalendarModalViewController.h"

@interface JLCalendarBtn : UIButton<JLCalendarModalViewControllerDeleagte>
@property (nonatomic,assign)NSInteger currentYear;
@property (nonatomic,assign)NSInteger currentMonth;
@property (nonatomic,assign)NSInteger currentDay;

@end
