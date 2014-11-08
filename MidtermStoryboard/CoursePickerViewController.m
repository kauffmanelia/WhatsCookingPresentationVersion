//
//  ViewController.m
//  WhatsCookingIngredientPicker
//
//  Created by Elia Kauffman on 2014-11-03.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import "CoursePickerViewController.h"
#import "Ingredient.h"
#import "CourseList.h"
#import "URLForAPICall.h"
#import "RecipeList.h"
#import "RecipeCollectionViewController.h"

@interface CoursePickerViewController ()

@property (nonatomic, strong) RecipeList * recipeList;

//- (IBAction)BuildURLButtonPressed:(id)sender;

@end

@implementation CoursePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.courseList = [[CourseList alloc] init];
    self.IngredientPicker.delegate = self;
    self.IngredientPicker.dataSource = self;
    self.pickedIngredients = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.courseList.count;
}

-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString * currentString = [self.courseList.courseList objectAtIndex:row];
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:currentString attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.45 green:0.78 blue:0.66 alpha:1]}];
    return attString;
}

//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    return [self.courseList.courseList objectAtIndex:row];
//}


//- (IBAction)addIngredientButtonPressed:(id)sender {
//    [self.pickedIngredients addObject:[self.ingredientList.ingredientList objectAtIndex:[self.IngredientPicker selectedRowInComponent:0]]];
////    for(Ingredient * currentIngredient in self.pickedIngredients){
////        NSLog(@"%@", currentIngredient.name);
////    }
//}


//- (IBAction)BuildURLButtonPressed:(id)sender {
//    URLForAPICall * url = [[URLForAPICall alloc] initWithSelectedIngredients:self.pickedIngredients andBannedIngredients:nil andCourse:none andHas15MinuteLimit:YES];
////    NSData * data = [NSData dataWithContentsOfURL:url.url];
////    
////    NSError * error = nil;
////    
////    NSDictionary * dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
////    NSLog(@"%@", dataDictionary);
//    
//    self.recipeList = [[RecipeList alloc] initDictionaryWithURL:url];
//    NSLog(@"%@", self.recipeList.recipes);
//    [self performSegueWithIdentifier:@"SegueToCollectionView" sender:self];
//}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if([segue.identifier isEqualToString:@"SegueToCollectionView"]){
//        RecipeCollectionViewController * nextController = segue.destinationViewController;
//        nextController.recipeList = self.recipeList;
//    } else if([segue.identifier isEqualToString:@"ReturnToSearch"]){
////        [segue.destinationViewController setCourse:[self.IngredientPicker selectedRowInComponent:0]];
//        #warning Make sure there's a course property of type enum Course on the target view controller
//    }
//}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    enum Course returnCourse = [self.IngredientPicker selectedRowInComponent:0];
    [self.delegate setCourse:returnCourse];
}

@end











