//
//  JLCalendarBtn.m
//  JLCustomCalendar
//
//  Created by eall_linger on 16/5/13.
//  Copyright © 2016年 eall_linger. All rights reserved.
//

#import "JLCalendarBtn.h"
@implementation JLCalendarBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
        [self addTarget:self action:@selector(seletedCalendar) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)seletedCalendar
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
           UIViewController* vc = (UIViewController*)nextResponder;
            JLCalendarModalViewController *calendar = [[JLCalendarModalViewController alloc]init];
            calendar.delegate       = self;
            calendar.currentYear    = _currentYear;
            calendar.currentMonth   = _currentMonth;
            calendar.currentDay     = _currentDay;
            [vc presentViewController:calendar animated:YES completion:^{
                
            }];
        }
    }

}
- (void)seletedOneDay:(NSInteger)day withMonth:(NSInteger)month withYear:(NSInteger)year
{
    self.currentYear = year;
    self.currentMonth = month;
    self.currentDay = day;
    
    
}

-(void)setCurrentYear:(NSInteger)currentYear
{
    _currentYear = currentYear;
     [self getDate];
}
-(void)setCurrentMonth:(NSInteger)currentMonth
{
    _currentMonth =currentMonth;
     [self getDate];
}
-(void)setCurrentDay:(NSInteger)currentDay
{
    _currentDay =currentDay;
     [self getDate];
}

- (void)getDate
{
    if (self.currentYear > 0) {
        NSString *dateStr = [NSString stringWithFormat:@"%ld",self.currentYear];
        if (self.currentMonth > 0 && self.currentMonth < 13) {
            dateStr = [NSString stringWithFormat:@"%ld-%ld",self.currentYear,self.currentMonth];
            if (self.currentDay > 0 && self.currentDay <= 31) {
                dateStr = [NSString stringWithFormat:@"%ld-%ld-%ld",self.currentYear,self.currentMonth,self.currentDay];
            }
        }
        [self setTitle:dateStr forState:UIControlStateNormal];

    }
}
@end
