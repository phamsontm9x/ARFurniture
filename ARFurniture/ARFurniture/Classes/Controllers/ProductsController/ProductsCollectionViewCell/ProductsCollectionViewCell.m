//
//  ProductsCollectionViewCell.m
//  ARFurniture
//
//  Created by ThanhSon on 6/21/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "ProductsCollectionViewCell.h"

@implementation ProductsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.vBackground.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.vBackground.layer.borderWidth = 1;
    self.vBackground.layer.cornerRadius = 5;
    self.vBackground.layer.masksToBounds = YES;
}

@end
