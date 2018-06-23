//
//  ProductsController.m
//  ARFurniture
//
//  Created by ThanhSon on 6/17/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "ProductsController.h"
#import "ProductsCollectionViewCell.h"


@interface ProductsController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) IBOutlet BaseClv *clvContent;

@end


@implementation ProductsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.clvContent registerNib:[UINib nibWithNibName:@"ProductsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ProductsCollectionViewCell"];
    [self.clvContent addPullRefreshAtVC:self toReloadAction:@selector(reloadData)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadData {
    [self.clvContent hideIndicator];    	
}


#pragma mark - CollectionView

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    float width = collectionView.frame.size.width/ 2  - 15;
//    float height = collectionView.frame.size.width/3;
    return CGSizeMake(width, width);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
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
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductsCollectionViewCell" forIndexPath:indexPath];
    cell.imgIcon.image = [UIImage imageNamed:SF(@"imageInspiration%ld",indexPath.row)];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}

@end
