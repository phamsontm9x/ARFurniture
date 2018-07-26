//
//  DetailProductController.m
//  ARFurniture
//
//  Created by ThanhSon on 6/30/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "DetailProductController.h"
#import "DetailProductCell.h"
#import "TYCyclePagerView.h"
#import "TYPageControl.h"
#import "ARViewController.h"
#import "DetailProductSectionCell.h"
#import "DetailProductOverviewCell.h"
#import "InspirationStripTableViewCell.h"

typedef enum : NSUInteger {
    ProductSegmentOverview = 0,
    ProductSegmentDetail,
} ProductSegment;

@interface DetailProductController () <TYCyclePagerViewDataSource, TYCyclePagerViewDelegate, UITableViewDelegate, UITableViewDataSource, BaseCellDelegate, InspirationStripCellDelegate, InspirationStripCellDataSource>

@property (nonatomic, weak) IBOutlet TYCyclePagerView *pagerView;
@property (nonatomic, weak) IBOutlet UIView *viewHeaderTbv;
@property (nonatomic, weak) IBOutlet UITableView *tbvContent;
@property (nonatomic, weak) IBOutlet UILabel *lblPrice;
@property (nonatomic, weak) IBOutlet UIView *lblDesc;

@property (nonatomic, strong) TYPageControl *pageControl;
@property (nonatomic, strong) NSArray *datas;
@property (nonatomic, strong) NSArray *datasOverview;
@property (nonatomic, strong) NSArray *datasDetail;

@property (nonatomic) NSInteger indexSegment;
@property (nonatomic) NSInteger totalCell;

@end



@implementation DetailProductController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configTbv];
    [self configPageView];
    [self configPageControl];
    [self setNavagation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)setNavagation {
    [self.navigationItem setTitle:@"Candle Lamp"];

}

- (void)configTbv {
    _totalCell = 5;
    [self.tbvContent registerNib:[UINib nibWithNibName:@"InspirationStripTableViewCell" bundle:nil] forCellReuseIdentifier:@"InspirationStripTableViewCell"];
    self.tbvContent.estimatedRowHeight = 40;
    [self fakeData];
}

- (void)fakeData {
    _datasOverview = @[@[@"Dimension",@""],
              @[@"Width",@"22'"],
              @[@"Height",@"19'"],
              @[@"Depth",@"19'"]];
    
    _datasDetail = @[@[@"Color",@""],
                       @[@"Style",@"M,XL,Z,K"],
                       @[@"More Information",@""],
                     @[@"There is this constant need inside of most of us to make our homes look like no other, make it unique and match it There is this constant need inside of most of us to make our homes look like no other, make it unique and match it There is this constant need inside of most of us to make our homes look like no other, make it unique and match it There is this constant need inside of most of us to make our homes look like no other, make it unique and match it ",@""]];
}


#pragma mark ConfigPageView

- (void)configPageView {

    _pagerView.isInfiniteLoop = YES;
    _pagerView.autoScrollInterval = 2.0;
    _pagerView.dataSource = self;
    _pagerView.delegate = self;
    _pagerView.layoutTypePage = 2;
    [_pagerView registerNib:[UINib nibWithNibName:@"DetailProductCell" bundle:nil] forCellWithReuseIdentifier:@"DetailProductCell"];
}


#pragma mark PageControl

- (void)configPageControl {
    
    _datas = @[@"0",@"1",@"2",@"3",@"4"];
    
    _pageControl = [[TYPageControl alloc]init];
    _pageControl.numberOfPages = _datas.count;
    
    _pageControl.frame = CGRectMake(0, CGRectGetHeight(_pagerView.frame) - 40, CGRectGetWidth(_pagerView.frame), 26);
    
    _pageControl.currentPageIndicatorTintColor = MAINCOLOR;
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    _pageControl.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    _pageControl.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //    [pageControl addTarget:self action:@selector(pageControlValueChangeAction:) forControlEvents:UIControlEventValueChanged];
    [_pagerView addSubview:_pageControl];
    [_pagerView reloadData];
    self.tbvContent.tableHeaderView = _viewHeaderTbv;
}

#pragma mark - TYCyclePagerViewDataSource

- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return _datas.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    DetailProductCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"DetailProductCell" forIndex:index];
    cell.imgIcon.image = [UIImage imageNamed:SF(@"imageInspiration%ld",index)];
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(CGRectGetWidth(pageView.frame)*0.9, CGRectGetHeight(pageView.frame)*0.9);
    layout.itemSpacing = 5;
    layout.minimumAlpha = 0.8;
    layout.itemHorizontalCenter = YES;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    _pageControl.currentPage = toIndex;
    //[_pageControl setCurrentPage:newIndex animate:YES];
    NSLog(@"%ld ->  %ld",fromIndex,toIndex);
}

- (IBAction)openArkit:(id)sender {
    ARViewController *vc = VCFromSB(ARViewController, SB_Products);
    [self presentViewController:vc animated:YES completion:nil];
}


#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _totalCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == _totalCell - 1) {
        return 180;
    }
    
    if (_indexSegment == ProductSegmentDetail && indexPath.row == _totalCell - 2) {
        return UITableViewAutomaticDimension;
    }
    
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DetailProductSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailProductSectionCell"];
    cell.delegate = self;
    [cell setUISection:_indexSegment];
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == _totalCell -1) {
        
        InspirationStripTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InspirationStripTableViewCell"];
        cell.delegateCell = self;
        cell.dataSourceCell = self;
        cell.lblTitle.text = @"Similar Products";
        
        return cell;
        
    } else {

        DetailProductOverviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailProductOverviewCell"];
        cell.delegate = self;
        
        if (_indexSegment == ProductSegmentOverview) {
            cell.lblTitle.text = _datasOverview[indexPath.row][0];
            cell.lblSubTitle.text = _datasOverview[indexPath.row][1];
            
        } else {
            cell.lblTitle.text = _datasDetail[indexPath.row][0];
            cell.lblSubTitle.text = _datasDetail[indexPath.row][1];
            
            if (indexPath.row == _totalCell -2) {
                cell = [tableView dequeueReusableCellWithIdentifier:@"DetailProductOverviewDesCell"];
                cell.lblTitle.text = _datasDetail[indexPath.row][0];
            }
        }
        
        return cell;
    }
}


#pragma mark - BaseCellDelegate

- (void)baseTableCellSelected:(DetailProductSectionCell *)cell {
    _indexSegment = cell.indexSegment;
    [self.tbvContent reloadData];
}


#pragma mark - InspirationStripTableViewCell

- (NSInteger)inspirationStripCell:(InspirationStripTableViewCell *)cell numberOfRowInSection:(NSInteger)section {
    return 10;
}

- (NSArray *)inspirationStripCell:(InspirationStripTableViewCell *)cell dataOfRowInSection:(NSInteger)section {
    return nil;
}

- (void)inspirationStripCellSelected:(InspirationStripTableViewCell *)cell {
    DetailProductController *vc = VCFromSB(DetailProductController, SB_Products);
    [self.navigationController pushViewController:vc animated:YES];
}

@end
