//
//  NSDateFormatter+Util.m
//  FinacialManager_iOS
//
//  Created by ThanhSon on 4/26/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//


#import "NSDateFormatter+Util.h"
#import "AppDelegate.h"
#import "define.h"
#import "NSTimeZone+Util.h"

@implementation NSDateFormatter (Util)

+ (NSDateFormatter *)serverDateFormatter {
    static NSDateFormatter *__formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __formatter = [[NSDateFormatter alloc] init];
//        NSLocale *enUSPOSIXLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
//        [__formatter setLocale:enUSPOSIXLocale];
        [__formatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'"];
        [__formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:7*60*60]];
    });
    return __formatter;
}

+ (NSDateFormatter *)displayFormatter {
    static NSDateFormatter *__formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __formatter = [[NSDateFormatter alloc] init];
        [__formatter setDateFormat:@"dd'-'MM'-'yyyy"];
        [__formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:7*60*60]];
    });
    return __formatter;
}

@end
