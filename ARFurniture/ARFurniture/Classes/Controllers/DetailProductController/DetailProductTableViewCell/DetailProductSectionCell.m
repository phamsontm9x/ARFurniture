//
//  DetailProductSectionCell.m
//  ARFurniture
//
//  Created by ThanhSon on 7/20/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "DetailProductSectionCell.h"

@implementation DetailProductSectionCell

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 1;
    self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    _lineViewOverview.backgroundColor = [UIColor blackColor];

}

- (void)setUISection:(NSInteger)index {
    
    if (index == 0) {
        _lblOverview.textColor = [UIColor blackColor];
        _lblDetail.textColor = [UIColor lightGrayColor];
        _constraintLeading.constant = 0;
    } else {
        _lblDetail.textColor = [UIColor blackColor];
        _lblOverview.textColor = [UIColor lightGrayColor];
        _constraintLeading.constant = self.frame.size.width/2;
    }
    [self layoutIfNeeded];
}

- (IBAction)btnSelectedSection:(UIButton *)btn {
    [self setAnimation:btn.tag];
}

- (void)setAnimation:(NSInteger)index {
    
    if (index == 0) {
        [UIView animateWithDuration:0.3 animations:^{
            _lblOverview.textColor = [UIColor blackColor];
            _lblDetail.textColor = [UIColor lightGrayColor];
            _constraintLeading.constant = 0;
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
            self.indexSegment = index;
            if (self.delegate && [self.delegate respondsToSelector:@selector(baseTableCellSelected:)]) {
                [self.delegate baseTableCellSelected:self];
            }
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            _lblDetail.textColor = [UIColor blackColor];
            _lblOverview.textColor = [UIColor lightGrayColor];
            _constraintLeading.constant = self.frame.size.width/2;
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
            self.indexSegment = index;
            if (self.delegate && [self.delegate respondsToSelector:@selector(baseTableCellSelected:)]) {
                [self.delegate baseTableCellSelected:self];
            }
        }];
    }
}

@end
