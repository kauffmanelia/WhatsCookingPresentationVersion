//
//  NewNavigationControllerViewController.m
//  MidtermStoryboard
//
//  Created by Calvin Nisbet on 2014-11-04.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import "NewNavigationControllerViewController.h"

@interface NewNavigationControllerViewController ()

@end

@implementation NewNavigationControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.tintColor = [UIColor blackColor];
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbg.png"] forBarMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor yellowColor]];
    
      
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
