//
//  NSDate+NSDateEx.m
//  FinacialManager_iOS
//
//  Created by ThanhSon on 4/26/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "NSDate+NSDateEx.h"

@implementation NSDate (NSDateEx)

- (NSInteger)day {
    NSCalendar *iso8601 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierISO8601];
    NSDateComponents *comp = [iso8601 components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    return [comp day];
}

- (NSInteger)month {
    NSCalendar *iso8601 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierISO8601];
    NSDateComponents *comp = [iso8601 components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    return [comp month];
}

- (NSInteger)year {
    NSCalendar *iso8601 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierISO8601];
    NSDateComponents *comp = [iso8601 components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    return [comp year];
}

- (NSInteger)hour {
    NSCalendar *iso8601 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierISO8601];
    NSDateComponents *comp = [iso8601 components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour) fromDate:self];
    return [comp hour];
}

- (NSInteger)minute {
    NSCalendar *iso8601 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierISO8601];
    
    NSDateComponents *comp = [iso8601 components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:self];
    return [comp minute];
}

- (NSInteger)second {
    NSCalendar *iso8601 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierISO8601];
    NSDateComponents *comp = [iso8601 components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:self];
    return [comp second];
}

- (BOOL)isEqualExactDay:(NSDate *)date {
    return (self.year == date.year && self.month == date.month && self.day == date.day);
}

@end
