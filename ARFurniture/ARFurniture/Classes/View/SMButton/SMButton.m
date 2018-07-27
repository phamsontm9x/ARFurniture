//
//  SMButton.m
//  BocThe
//
//  Created by ThanhSon on 7/25/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "SMButton.h"

@implementation SMButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.layer.cornerRadius = _cornerRadious;
    self.clipsToBounds = YES;
    self.layer.masksToBounds = YES;
}

- (void)setCornerRadious:(CGFloat)cornerRadious {
    _cornerRadious = cornerRadious;
    self.layer.cornerRadius = _cornerRadious;
    self.clipsToBounds = YES;
}

- (void)setTypeButton:(NSInteger)typeButton {
    _typeButton = typeButton;
    
    switch (typeButton) {
        case 0: {
            CAGradientLayer *gradientLayer = [CAGradientLayer layer];
            gradientLayer.frame = self.layer.bounds;
            
            gradientLayer.colors = [NSArray arrayWithObjects:
                                    (id)[UIColor colorWithRed:180/255.0 green:165/255.0 blue:125/255.0 alpha:1].CGColor,
                                    (id)[UIColor colorWithRed:250/255.0 green:218/255.0 blue:161/255.0 alpha:1].CGColor,
                                    nil];
            
            gradientLayer.startPoint = CGPointMake(0.0, 0.5);
            gradientLayer.endPoint = CGPointMake(1.0, 0.5);
            
            gradientLayer.cornerRadius = self.layer.cornerRadius;
            [self.layer addSublayer:gradientLayer];
        }
            break;
            
        case 1: {
            CAGradientLayer *gradientLayer = [CAGradientLayer layer];
            gradientLayer.frame = self.layer.bounds;
            
            gradientLayer.colors = [NSArray arrayWithObjects:
                                    (id)[UIColor colorWithRed:169/255.0 green:125/255.0 blue:68/255.0 alpha:1].CGColor,
                                    (id)[UIColor colorWithRed:241/255.0 green:202/255.0 blue:141/255.0 alpha:1].CGColor,
                                    nil];
            
            gradientLayer.startPoint = CGPointMake(0.5, 0.0);
            gradientLayer.endPoint = CGPointMake(0.5, 1.0);
            
            gradientLayer.cornerRadius = self.layer.cornerRadius;
            [self.layer addSublayer:gradientLayer];
        }
            break;
            
        default:
            break;
    }
    
}

@end
