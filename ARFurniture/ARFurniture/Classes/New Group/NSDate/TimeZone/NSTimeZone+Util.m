//
//  NSTimeZone+Util.m
//  FinacialManager_iOS
//
//  Created by ThanhSon on 4/26/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "NSTimeZone+Util.h"
#import "AppDelegate.h"

@implementation NSTimeZone (Util)

+ (NSTimeZone *)setTimeZone:(NSInteger)intTimeZone {
   return [NSTimeZone timeZoneForSecondsFromGMT:intTimeZone*60*60];
}

@end
