//
//  InspirationTableViewCell.m
//  ARFurniture
//
//  Created by ThanhSon on 6/23/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "InspirationTableViewCell.h"

@implementation InspirationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.vBackground.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.vBackground.layer.borderWidth = 1;
    self.vBackground.layer.cornerRadius = 5;
    self.vBackground.layer.masksToBounds = YES;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
