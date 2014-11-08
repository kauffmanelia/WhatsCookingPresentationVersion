//
//  RecipeGenieViewController.m
//  MidtermStoryboard
//
//  Created by Elia Kauffman on 2014-11-04.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import "RecipeGenieViewController.h"
#import "URLForAPICall.h"
#import "RecipeList.h"
#import "RecipeCollectionViewController.h"
#import "CoursePickerViewController.h"

@interface RecipeGenieViewController ()

@end

@implementation RecipeGenieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"SearchRecipeSegue"]) {
        URLForAPICall * url = [[URLForAPICall alloc] initWithSelectedIngredients:self.selectedIngredients andBannedIngredients:self.excludedIngredients andCourse:self.course andHas15MinuteLimit:self.TimeLimitSwitch.isOn];
        self.recipeList = [[RecipeList alloc] initDictionaryWithURL:url];
        RecipeCollectionViewController * destinationController = segue.destinationViewController;
        destinationController.recipeList = self.recipeList;
    } else if([segue.identifier isEqualToString:@"SelectCourseSegue"]){
        CoursePickerViewController * destinationController = segue.destinationViewController;
        destinationController.delegate = self;
    } else if([segue.identifier isEqualToString:@"PickSelectedIngredientsSegue"]) {
        FridgeTableViewController * destinationController = segue.destinationViewController;
        destinationController.delegate = self;
        destinationController.selectedOrExcluded = selected;
    } else if([segue.identifier isEqualToString:@"PickExcludedIngredientsSegue"]) {
        FridgeTableViewController * destinationController = segue.destinationViewController;
        destinationController.delegate = self;
        destinationController.selectedOrExcluded = excluded;
    }
}


@end











