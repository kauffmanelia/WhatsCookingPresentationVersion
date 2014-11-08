//
//  ViewController.h
//  WhatsCookingIngredientPicker
//
//  Created by Elia Kauffman on 2014-11-03.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import <UIKit/UIKit.h>

enum Course {
    // Main Dishes, Desserts, Side Dishes, Lunch and Snacks, Appetizers, Salads, Breakfast and Brunch, Soups
    MainDishes = 1,
    Desserts = 2,
    SideDishes = 3,
    LunchAndSnacks = 4,
    Appetizers = 5,
    Salads = 6,
    BreakfastAndBrunch = 7,
    Soups = 8,
    none = 0
};

@protocol ParentViewControllerDelegate <NSObject>

@required

- (void)setCourse:(enum Course)course;

@end

@class CourseList;

@interface CoursePickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *IngredientPicker;
@property (nonatomic, strong) CourseList * courseList;
@property (nonatomic, strong) NSMutableArray * pickedIngredients;
@property (nonatomic, weak) id <ParentViewControllerDelegate> delegate;

//- (IBAction)addIngredientButtonPressed:(id)sender;

@end

