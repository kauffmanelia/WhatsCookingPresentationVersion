//
//  RecipeGenieViewController.h
//  MidtermStoryboard
//
//  Created by Elia Kauffman on 2014-11-04.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoursePickerViewController.h"
#import "FridgeTableViewController.h"

@class RecipeList;

@interface RecipeGenieViewController : UIViewController <ParentViewControllerDelegate, ReturnFromIngredientViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *TimeLimitSwitch;
@property (nonatomic, assign) enum Course course;
@property (nonatomic, strong) RecipeList * recipeList;
@property (nonatomic, strong) NSArray * selectedIngredients;
@property (nonatomic, strong) NSArray * excludedIngredients;

@end
