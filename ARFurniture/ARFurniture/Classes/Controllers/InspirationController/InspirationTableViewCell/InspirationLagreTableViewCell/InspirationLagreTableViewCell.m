//
//  InspirationLagreTableViewCell.m
//  ARFurniture
//
//  Created by ThanhSon on 7/22/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "InspirationLagreTableViewCell.h"

@implementation InspirationLagreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.vBackground.layer.cornerRadius = 5;
    self.vBackground.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
