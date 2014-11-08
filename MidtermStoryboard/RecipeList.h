//
//  RecipeDictionary.h
//  WhatsCookingIngredientPicker
//
//  Created by Elia Kauffman on 2014-11-04.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import <Foundation/Foundation.h>

@class URLForAPICall;

@interface RecipeList : NSObject

@property (nonatomic, strong) NSMutableArray * recipes;

- (instancetype)initDictionaryWithURL:(URLForAPICall *)url;

@end
