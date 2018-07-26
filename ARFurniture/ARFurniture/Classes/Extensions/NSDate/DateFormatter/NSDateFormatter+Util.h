//
//  NSDateFormatter+Util.h
//  FinacialManager_iOS
//
//  Created by ThanhSon on 4/26/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSDateFormatter (Util)

+ (NSDateFormatter *)serverDateFormatter;
+ (NSDateFormatter *)displayFormatter;

@end
