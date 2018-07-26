//
//  NSDate+NSDateEx.h
//  FinacialManager_iOS
//
//  Created by ThanhSon on 4/26/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (NSDateEx)

- (NSInteger) year;
- (NSInteger) month;
- (NSInteger) day;
- (NSInteger) hour;
- (NSInteger) minute;
- (NSInteger) second;

- (BOOL)isEqualExactDay:(NSDate *)date;

@end
