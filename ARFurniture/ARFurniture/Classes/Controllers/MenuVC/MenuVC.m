//
//  MenuVC.m
//  FinacialManager_iOS
//
//  Created by ThanhSon on 3/17/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "MenuVC.h"


typedef enum : NSUInteger {
    Products = 0,
    Inspiration,
    Experts,
    Decor_Gallery,
    Notifications,
    Settings,
    Rate_Us
} MenuList;

@interface MenuVC () <UITableViewDelegate, UITableViewDataSource, BaseCellDelegate> {

    NSArray *arrMenu;
}

@end

@implementation MenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
}


#pragma mark initListMenu

- (void)initMenu {
    arrMenu = @[@"Products",
                @"Inspiration",
                @"Experts",
                @"Decor Gallery",
                @"Notifications",
                @"Settings",
                @"Rate Us"];
}

#pragma mark Action
- (IBAction)btnLogout:(id)sender {
    
}

#pragma mark - UITableViewCell

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  arrMenu.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BaseCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    
    cell.lblTitle.text = arrMenu[indexPath.row];
    cell.lblTitle.textColor = (indexPath.row == _index) ? MAINCOLOR : [UIColor blackColor];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _index = indexPath.row;
    
    BaseCell *cell = (BaseCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    cell.lblTitle.textColor = MAINCOLOR;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
        BaseCell *cell = (BaseCell*)[tableView cellForRowAtIndexPath:indexPath];
        cell.lblTitle.textColor = [UIColor blackColor];
}

#pragma mark - Action

- (IBAction)onBtnProfilePressed:(UIButton *)btn {

}

@end
