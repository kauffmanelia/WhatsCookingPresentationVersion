//
//  StringSearchViewController.h
//  MidtermStoryboard
//
//  Created by Elia Kauffman on 2014-11-06.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StringSearchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *searchField;

- (IBAction)searchButtonPressed:(id)sender;

@end
