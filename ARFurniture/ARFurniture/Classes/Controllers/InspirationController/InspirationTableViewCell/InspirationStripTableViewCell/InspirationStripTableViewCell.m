//
//  InspirationStripTableViewCell.m
//  ARFurniture
//
//  Created by ThanhSon on 6/23/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "InspirationStripTableViewCell.h"
#import "ProductsCollectionViewCell.h"
#import "define.h"



@interface InspirationStripTableViewCell () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) IBOutlet UICollectionView *clvContent;

@end


@implementation InspirationStripTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.clvContent registerNib:[UINib nibWithNibName:@"ProductsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ProductsCollectionViewCell"];
    [_clvContent reloadData];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - CollectionView

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    float width = collectionView.frame.size.height - 20;
    
    return CGSizeMake(width, width);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (_dataSourceCell && [_dataSourceCell respondsToSelector:@selector(inspirationStripCell:numberOfRowInSection:)]) {
        return [_dataSourceCell inspirationStripCell:self numberOfRowInSection:0];
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductsCollectionViewCell" forIndexPath:indexPath];
    cell.imgIcon.image = [UIImage imageNamed:SF(@"imageInspiration%ld",indexPath.row % 10)];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_delegateCell && [_delegateCell respondsToSelector:@selector(inspirationStripCellSelected:)]) {
        [_delegateCell inspirationStripCellSelected:self];
    }
}

@end
