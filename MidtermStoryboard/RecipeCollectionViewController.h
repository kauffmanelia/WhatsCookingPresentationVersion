//
//  RecipeCollectionViewController.h
//  WhatsCookingIngredientPicker
//
//  Created by Elia Kauffman on 2014-11-04.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecipeList;

@interface RecipeCollectionViewController : UICollectionViewController

@property (nonatomic, strong) RecipeList * recipeList;

@end
