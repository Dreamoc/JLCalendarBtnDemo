//
//  JLCalendarModalViewController.h
//  JLCustomCalendar
//
//  Created by eall_linger on 16/5/13.
//  Copyright © 2016年 eall_linger. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JLCalendarModalViewControllerDeleagte <NSObject>

- (void)seletedOneDay:(NSInteger )day withMonth:(NSInteger )month withYear:(NSInteger )year;


@end
@interface JLCalendarModalViewController : UIViewController

@property (nonatomic,assign)NSInteger currentDay;
@property (nonatomic,assign)NSInteger currentMonth;
@property (nonatomic,assign)NSInteger currentYear;
@property (nonatomic,assign)id <JLCalendarModalViewControllerDeleagte>delegate;
@end
