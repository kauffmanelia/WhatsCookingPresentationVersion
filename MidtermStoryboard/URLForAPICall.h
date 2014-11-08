//
//  URLForAPICall.h
//  WhatsCookingIngredientPicker
//
//  Created by Elia Kauffman on 2014-11-03.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import <Foundation/Foundation.h>

//enum Course {
//    // Main Dishes, Desserts, Side Dishes, Lunch and Snacks, Appetizers, Salads, Breakfast and Brunch, Soups
//    MainDishes = 1,
//    Desserts = 2,
//    SideDishes = 3,
//    LunchAndSnacks = 4,
//    Appetizers = 5,
//    Salads = 6,
//    BreakfastAndBrunch = 7,
//    Soups = 8,
//    none = 0
//};

@interface URLForAPICall : NSObject

@property (nonatomic, strong) NSURL * url;

- (instancetype)initWithSelectedIngredients:(NSArray *)ingredients andBannedIngredients:(NSArray *)bannedIngredients andCourse:(enum Course)course andHas15MinuteLimit:(BOOL)has15MinuteLimit;

- (instancetype)initWithSearchWords:(NSString *)words;

@end
