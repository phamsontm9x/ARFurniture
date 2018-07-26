//
//  DetailProductSectionCell.h
//  ARFurniture
//
//  Created by ThanhSon on 7/20/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "BaseCell.h"

@interface DetailProductSectionCell : BaseCell

@property (nonatomic, weak) IBOutlet UIView  *lineViewOverview;
@property (nonatomic, weak) IBOutlet UIView  *lineViewDetail;

@property (nonatomic, weak) IBOutlet UILabel  *lblOverview;
@property (nonatomic, weak) IBOutlet UILabel  *lblDetail;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint  *constraintLeading;

@property (nonatomic) NSInteger indexSegment;

- (void)setUISection:(NSInteger)index;

@end
