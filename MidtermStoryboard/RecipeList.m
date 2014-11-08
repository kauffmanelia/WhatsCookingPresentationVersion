//
//  RecipeDictionary.m
//  WhatsCookingIngredientPicker
//
//  Created by Elia Kauffman on 2014-11-04.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import "RecipeList.h"
#import "URLForAPICall.h"

@implementation RecipeList

- (instancetype)initDictionaryWithURL:(URLForAPICall *)url{
    self = [super init];
    if (self) {
        self.recipes = [[NSMutableArray alloc] init];
        NSData * jsonData = [NSData dataWithContentsOfURL:url.url];
        NSError * error = nil;
        NSDictionary * dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        for(NSDictionary * currentRecipe in dataDictionary[@"matches"]){
            [self.recipes addObject:currentRecipe];
        }
        
    }
    return self;
}

@end
