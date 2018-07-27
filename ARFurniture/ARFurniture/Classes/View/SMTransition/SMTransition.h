//
//  SMTransition.h
//  BocThe
//
//  Created by ThanhSon on 7/23/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIkit.h"

@interface SMTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic) CGFloat duration;
@property (nonatomic, assign) BOOL isPresent;

@end
