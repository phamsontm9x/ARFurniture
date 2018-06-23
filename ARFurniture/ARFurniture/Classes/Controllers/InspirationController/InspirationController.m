//
//  InspirationController.m
//  ARFurniture
//
//  Created by ThanhSon on 6/23/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "InspirationController.h"
#import "InspirationTableViewCell.h"

@implementation InspirationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUITableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadData {
    [self hideIndicator];
}

- (void)initUITableView {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"InspirationTableViewCell" bundle:nil] forCellReuseIdentifier:@"InspirationTableViewCell"];
    [self addPullRefreshAtVC:self toReloadAction:@selector(reloadData)];
    
    // Add headerTableView
    CGRect frameTBV = self.tableView.frame;
    UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frameTBV.size.width, 15)];
    viewHeader.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = viewHeader;
}


#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InspirationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InspirationTableViewCell"];
    cell.imgIcon.image = [UIImage imageNamed:SF(@"imageInspiration%ld",indexPath.row)];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
