//
//  InspirationStripTableViewCell.h
//  ARFurniture
//
//  Created by ThanhSon on 6/23/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "BaseCell.h"



@class InspirationStripTableViewCell;


@protocol InspirationStripCellDelegate <NSObject>

@optional
- (void)inspirationStripCellSelected:(InspirationStripTableViewCell*)cell;
@end



@protocol InspirationStripCellDataSource <NSObject>

@optional
- (NSInteger)inspirationStripCell:(InspirationStripTableViewCell*)cell numberOfRowInSection:(NSInteger)section;
- (NSArray *)inspirationStripCell:(InspirationStripTableViewCell*)cell dataOfRowInSection:(NSInteger)section;
@end



@interface InspirationStripTableViewCell : BaseCell

@property (nonatomic, weak) id<InspirationStripCellDelegate> delegateCell;
@property (nonatomic, weak) id<InspirationStripCellDataSource> dataSourceCell;

@end
