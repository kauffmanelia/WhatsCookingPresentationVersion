//
//  CollectionViewCell.h
//  WhatsCookingIngredientPicker
//
//  Created by Elia Kauffman on 2014-11-04.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *recipeName;

@end
