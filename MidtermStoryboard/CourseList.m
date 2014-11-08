//
//  IngredientList.m
//  WhatsCookingIngredientPicker
//
//  Created by Elia Kauffman on 2014-11-03.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import "CourseList.h"
#import "Ingredient.h"

@implementation CourseList

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Main Dishes, Desserts, Side Dishes, Lunch and Snacks, Appetizers, Salads, Breakfast and Brunch, Soups
        self.courseList = @[@"", @"Main Dishes", @"Desserts", @"Side Dishes", @"Lunch and Snacks", @"Appetizers", @"Salads", @"Breakfast and Brunch", @"Soups"];
    }
    return self;
}

-(NSInteger)count {
    return self.courseList.count;
}

@end
