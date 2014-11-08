///Users/eliakauffman/Documents/WhatsCookingMerged/MidtermStoryboard.xcodeproj
//  FridgeTableViewController.h
//  MidtermStoryboard
//
//  Created by Calvin Nisbet on 2014-11-04.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import <UIKit/UIKit.h>

enum SelectedOrExcluded {
    selected = 1,
    excluded = 2
};

@protocol ReturnFromIngredientViewControllerDelegate <NSObject>

@required

- (void)setSelectedIngredients:(NSArray *)ingredients;
- (void)setExcludedIngredients:(NSArray *)ingredients;

@end

@interface FridgeTableViewController : UITableViewController

@property (nonatomic, weak) id <ReturnFromIngredientViewControllerDelegate> delegate;
@property (nonatomic, assign) enum SelectedOrExcluded selectedOrExcluded;

@end
