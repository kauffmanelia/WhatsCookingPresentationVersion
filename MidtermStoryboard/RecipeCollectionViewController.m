//
//  RecipeCollectionViewController.m
//  WhatsCookingIngredientPicker
//
//  Created by Elia Kauffman on 2014-11-04.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import "RecipeCollectionViewController.h"
#import "RecipeList.h"
#import "RecipeCollectionViewCell.h"

@interface RecipeCollectionViewController ()

@end

@implementation RecipeCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.recipeList.recipes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RecipeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    NSDictionary * currentRecipe = self.recipeList.recipes[indexPath.item];
    cell.recipeName.text = currentRecipe[@"recipeName"];
    NSArray * urlArray = currentRecipe[@"smallImageUrls"];
    NSURL * theURL = [NSURL URLWithString:urlArray[0]];
    NSData * theImage = [NSData dataWithContentsOfURL:theURL];
    cell.image.image = [UIImage imageWithData:theImage];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.daledietrich.com"]];
    //http://api.yummly.com/v1/api/recipe/recipe-id?_app_id=YOUR_ID&_app_key=YOUR_APP_KEY
    NSDictionary * currentRecipe = self.recipeList.recipes[indexPath.item];
    NSString * recipeID = currentRecipe[@"id"];
    NSURL * targetURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.yummly.com/recipe/%@", recipeID]];
    [[UIApplication sharedApplication] openURL:targetURL];
}

-(UICollectionReusableView *)collectionView: (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"cellFooter" forIndexPath:indexPath];
    return footer;
    
    
}


#pragma mark <UICollectionViewDelegate>



/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
