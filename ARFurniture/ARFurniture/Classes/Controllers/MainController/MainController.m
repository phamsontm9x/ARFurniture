//
//  MainController.m
//  ARFurniture
//
//  Created by ThanhSon on 6/17/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "MainController.h"
#import "InspirationController.h"
#import "ExpertsController.h"
#import "ProductsController.h"



@interface MainController () <CAPSPageMenuDelegate>

@property (nonatomic) CAPSPageMenu *pagemenu;
@property (nonatomic, strong) ProductsController *productsController;
@property (nonatomic, strong) ExpertsController *expertController;
@property (nonatomic, strong) InspirationController *inspirationController;


@end



@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    [self initUINavigation];
    [self initPageMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    return YES;
}

- (void)initUINavigation {
    self.title = @"ZIMPLY";
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    
    UIImage *image = [[UIImage imageNamed:@"ic_cartsmall"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    UIButton *cButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cButton.contentMode = UIViewContentModeScaleAspectFit;
    [cButton setImage:image forState:UIControlStateNormal];
    [cButton addTarget:self action:@selector(selectedCart:) forControlEvents:UIControlEventTouchUpInside];
    if (@available(iOS 9, *)) {
        [cButton.widthAnchor constraintEqualToConstant: 32].active = YES;
        [cButton.heightAnchor constraintEqualToConstant: 32].active = YES;
    }
    
    UIBarButtonItem *barCart = [[UIBarButtonItem alloc] initWithCustomView:cButton];
    
    self.navigationItem.rightBarButtonItem = barCart;
}

- (void)initPageMenu {
    NSMutableArray *controllerArray = [NSMutableArray array];
    
    _productsController = VCFromSB(ProductsController, SB_Products);
    _expertController = VCFromSB(ExpertsController, SB_Experts);
    _inspirationController = VCFromSB(InspirationController, SB_Inspirations);
    
    _productsController.title = @"PRODUCTS";
    _expertController.title = @"EXPERTS";
    _inspirationController.title = @"INSPIRATIONS";
    
    [controllerArray addObject:_productsController];
    [controllerArray addObject:_expertController];
    [controllerArray addObject:_inspirationController];
    
    // Initialize page menu with controller array, frame, and optional parameters
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor colorWithRed:110.0/255.0 green:198.0/255.0 blue:197.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionViewBackgroundColor: [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionSelectionIndicatorColor: [UIColor colorWithRed:71.0/255.0 green:78.0/255.0 blue:86.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionBottomMenuHairlineColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.4],
                                 CAPSPageMenuOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue" size:15.0],
                                 CAPSPageMenuOptionMenuHeight: @(40.0),
                                 CAPSPageMenuOptionMenuItemWidth: @(self.view.frame.size.width/3 - 20),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES)
                                 };
    
    _pagemenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) options:parameters];
    
    
    // Lastly add page menu as subview of base view controller view
    // or use pageMenu controller in you view hierachy as desired
    [self.view addSubview:_pagemenu.view];
}


#pragma mark - Action Navigation

- (IBAction)selectedSearch:(id)sender {

}
- (IBAction)selectedCart:(id)sender {

}


@end
