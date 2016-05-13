//
//  JLCalendarScrollView.m
//  JLCustomCalendar
//
//  Created by eall_linger on 16/5/11.
//  Copyright © 2016年 eall_linger. All rights reserved.
//

#import "JLCalendarScrollView.h"

/**
 *  TotalNumber
 *
 *   总月数 从今天起 前4000/2 个月  后4000/2个月 前后333年 应该够用。可随意调节。4000时候创建后占用内存大概2M
 *   选择 上一年或下一年 的时候，数据会重置。同上。
 */

#define TotalNumber 4000  

@implementation JLCalendarScrollView
{
    UICollectionView * _collectionView;
    NSArray *dateArray;
    
    NSInteger _currentScrollIndexRow;
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initCalendarView];
    }
    return self;
}
- (void)initCalendarView
{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.minimumLineSpacing=0;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)  collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    _collectionView.pagingEnabled = YES;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = self.backgroundColor;
    [self addSubview:_collectionView];
    [self createDate:[NSDate date]];
}
#pragma mark 初始化 当日期填写正确  自动调整显示到设置日期页
-(void)setCurrentYear:(NSInteger)currentYear
{
    _currentYear =currentYear;
    [self customYearMonthDay];
}
-(void)setCurrentMonth:(NSInteger)currentMonth
{
    _currentMonth = currentMonth;
    [self customYearMonthDay];
}
-(void)setCurrentDay:(NSInteger)currentDay
{
    _currentDay =currentDay;
    [self customYearMonthDay];
}

- (void)customYearMonthDay
{
    
    if (self.currentYear > 0) {
        NSString *dateStr = [NSString stringWithFormat:@"%ld-1-1",self.currentYear];
        if (self.currentMonth > 0 && self.currentMonth < 13) {
            dateStr = [NSString stringWithFormat:@"%ld-%ld-1",self.currentYear,self.currentMonth];
            if (self.currentDay > 0 && self.currentDay <= 31) {
                dateStr = [NSString stringWithFormat:@"%ld-%ld-%ld",self.currentYear,self.currentMonth,self.currentDay];
            }
        }
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat =@"yyyy-MM-dd";
        NSDate *date = [formatter dateFromString:dateStr];
        [self createDate:date];

    }else{
        [self createDate:[NSDate date]];
    }
}
#pragma mark 加载数据
- (void)createDate:(NSDate *)date
{
    NSMutableArray *tmpArray= [[NSMutableArray alloc]init];
    
    NSDate * currentDate = date;
    
    for (NSInteger i = 0; i < TotalNumber/2; i++) {
        [tmpArray addObject:currentDate];
        currentDate = [self nextMonth:currentDate];
    }
    
    currentDate = [self lastMonth:date];
    
    for (NSInteger i = 0; i < TotalNumber/2; i++) {
        [tmpArray insertObject:currentDate atIndex:0];
        currentDate = [self lastMonth:currentDate];
    }
    
    dateArray = tmpArray;
    _currentScrollIndexRow = TotalNumber/2;
    
    [_collectionView reloadData];
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:TotalNumber/2 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dateArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    JLCalendarItem *tmpCalendarView = [cell viewWithTag:100];
    if (tmpCalendarView) {
        [tmpCalendarView removeFromSuperview];
        tmpCalendarView.delegate = nil;
        tmpCalendarView = nil;
    }
    
    JLCalendarItem *calendarView = [[JLCalendarItem alloc] init];
    calendarView.frame      = CGRectMake(0, 0, self.frame.size.width, 200);
    calendarView.tag        = 100;
    calendarView.delegate   = self;

    calendarView.currentDay     = _currentDay;
    calendarView.currentMonth   = _currentMonth;
    calendarView.currentYear    = _currentYear;
    
    calendarView.date = dateArray[indexPath.row];
    [cell.contentView addSubview:calendarView];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width, 200);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _collectionView) {
        _currentScrollIndexRow = _collectionView.contentOffset.x/self.frame.size.width;
    }
}
#pragma mark 计算日期
- (NSDate *)lastMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

- (NSDate*)nextMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

- (NSDate *)lastYear:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

- (NSDate*)nextYear:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

#pragma mark action

- (void)seletedOneDay:(NSInteger)day withMonth:(NSInteger)month withYear:(NSInteger)year
{
    [self.delegate seletedOneDay:day withMonth:month withYear:year];
}

- (void)monthOnclick:(NSInteger)lastOrNext
{
    if (lastOrNext) {
        if (_currentScrollIndexRow < TotalNumber - 1) {
            [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_currentScrollIndexRow + 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
        }
    }else{
        if (_currentScrollIndexRow > 0) {
            [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_currentScrollIndexRow - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
        }
    }
    [self.delegate monthOnclick:lastOrNext];
}

- (void)yearOnclick:(NSInteger)lastOrNext
{
    NSDate *date = dateArray[_currentScrollIndexRow];
    if (lastOrNext) {
        [self createDate: [self nextYear:date]];
    }else{
        [self createDate: [self lastYear:date]];
    }
    [self.delegate yearOnclick:lastOrNext];
}

@end
