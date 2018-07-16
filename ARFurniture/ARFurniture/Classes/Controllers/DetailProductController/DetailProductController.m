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



@interface DetailProductController () <TYCyclePagerViewDataSource, TYCyclePagerViewDelegate>

@property (nonatomic, weak) IBOutlet TYCyclePagerView *pagerView;
@property (nonatomic, strong) TYPageControl *pageControl;
@property (nonatomic, strong) NSArray *datas;

@end



@implementation DetailProductController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


@end
