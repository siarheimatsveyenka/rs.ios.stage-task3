#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSInteger numberOfMonth = monthNumber;
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MMMM";

    if (numberOfMonth < 1 || numberOfMonth > 12) {
        return nil;
    }
    
    [components setMonth:numberOfMonth];
    NSDate *calculatedDate = [[NSCalendar currentCalendar] dateFromComponents:components];

    return [dateFormatter stringFromDate:calculatedDate];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    NSDate *nsDate = [dateFormatter dateFromString:date];
    dateFormatter.dateFormat = @"dd";

    return [dateFormatter stringFromDate:nsDate].intValue;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EE";
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeInterval weekInterval;
    NSDate *firstDayOfWeek = [[NSDate alloc] init];
    [calendar rangeOfUnit:NSCalendarUnitWeekOfYear startDate:&firstDayOfWeek interval:&weekInterval forDate:currentDate];
    NSDate *lastDateOfWeek = [firstDayOfWeek dateByAddingTimeInterval:weekInterval - 1];
    BOOL isInWeek = [date compare:firstDayOfWeek] != NSOrderedAscending && [date compare:lastDateOfWeek] != NSOrderedDescending;
    
    return isInWeek;
}

@end
