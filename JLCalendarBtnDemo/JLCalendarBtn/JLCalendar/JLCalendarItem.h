//
//  JLCalendarItem.h
//  JLCustomCalendar
//
//  Created by eall_linger on 16/5/11.
//  Copyright © 2016年 eall_linger. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JLCalendarItemDelegate <NSObject>

- (void)seletedOneDay:(NSInteger )day withMonth:(NSInteger )month withYear:(NSInteger )year;
- (void)monthOnclick:(NSInteger)lastOrNext;
- (void)yearOnclick:(NSInteger)lastOrNext;

@end

@interface JLCalendarItem : UIView

- (NSDate *)nextMonth:(NSDate *)date;
- (NSDate *)lastMonth:(NSDate *)date;
- (NSDate *)nextYear:(NSDate *)date;
- (NSDate *)lastYear:(NSDate *)date;

@property (nonatomic, strong)   NSDate *date;
@property (nonatomic, assign)   id <JLCalendarItemDelegate>delegate;

@property (nonatomic, assign)    NSInteger currentDay;
@property (nonatomic, assign)    NSInteger currentMonth;
@property (nonatomic, assign)    NSInteger currentYear;


@end
