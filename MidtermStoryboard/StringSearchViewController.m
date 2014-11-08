//
//  StringSearchViewController.m
//  MidtermStoryboard
//
//  Created by Elia Kauffman on 2014-11-06.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import "StringSearchViewController.h"
#import "RecipeCollectionViewController.h"
#import "URLForAPICall.h"
#import "RecipeList.h"

@interface StringSearchViewController ()

@property (nonatomic, strong) RecipeList * recipeList;

@end

@implementation StringSearchViewController

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
    if([segue.identifier isEqualToString:@"SearchRecipeWithStringSegue"]){
        RecipeCollectionViewController * destinationController = segue.destinationViewController;
        URLForAPICall * url = [[URLForAPICall alloc] initWithSearchWords:self.searchField.text];
        self.recipeList = [[RecipeList alloc] initDictionaryWithURL:url];
        destinationController.recipeList = self.recipeList;
    }
}


- (IBAction)searchButtonPressed:(id)sender {
    
}

@end
