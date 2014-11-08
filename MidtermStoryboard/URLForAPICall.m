//
//  URLForAPICall.m
//  WhatsCookingIngredientPicker
//
//  Created by Elia Kauffman on 2014-11-03.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import "URLForAPICall.h"
#import "Ingredient.h"
#import "CoursePickerViewController.h"

@interface URLForAPICall ()

@property (nonatomic, assign) BOOL has15MinuteLimit;
@property (nonatomic, assign) enum Course course;
@property (nonatomic, strong) NSArray * selectedIngredients;
@property (nonatomic, strong) NSArray * bannedIngredients;
@property (nonatomic, strong) NSString * searchTerms;

@end

@implementation URLForAPICall

-(instancetype)initWithSelectedIngredients:(NSArray *)ingredients andBannedIngredients:(NSArray *)bannedIngredients andCourse:(enum Course)course andHas15MinuteLimit:(BOOL)has15MinuteLimit {
    self = [super init];
    if(self) {
        self.selectedIngredients = [ingredients copy];
        self.bannedIngredients = [bannedIngredients copy];
        self.course = course;
        self.has15MinuteLimit = has15MinuteLimit;
        [self buildURL];
    }
    return self;
}

-(void)buildURL {
    NSMutableString * baseURL = [@"http://api.yummly.com/v1/api/recipes?_app_id=527ce221&_app_key=acc3f993c076a4b115b946847c75a705" mutableCopy];
    NSMutableCharacterSet * allowedCharacters = [[NSCharacterSet URLPathAllowedCharacterSet] mutableCopy];
    //    [allowedCharacters formUnionWithCharacterSet:[NSCharacterSet characterSetWithCharactersInString:@"&[]^"]];
    
    for(Ingredient * currentIngredient in self.selectedIngredients){
        [baseURL appendString:[[NSString stringWithFormat:@"&allowedIngredient[]=%@", currentIngredient.name] stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters]];
    }
    for(Ingredient * currentIngredient in self.bannedIngredients){
        [baseURL appendString:[[NSString stringWithFormat:@"&excludedIngredient[]=%@", currentIngredient.name] stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters]];
    }
    // Change courses; the current ones aren't the ones Yummly uses
    
    // Main Dishes, Desserts, Side Dishes, Lunch and Snacks, Appetizers, Salads, Breakfast and Brunch, Soups
    
    switch (self.course) {
        case none:
            break;
        case MainDishes:
            [baseURL appendString:[@"&allowedCourse[]=course^course-Main Dishes" stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters]];
            break;
        case Desserts:
            [baseURL appendString:[@"&allowedCourse[]=course^course-Desserts" stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters]];
            break;
        case SideDishes:
            [baseURL appendString:[@"&allowedCourse[]=course^course-Side Dishes" stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters]];
            break;
        case LunchAndSnacks:
            [baseURL appendString:[@"&allowedCourse[]=course^course-Lunch and Snacks" stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters]];
            break;
        case Appetizers:
            [baseURL appendString:[@"&allowedCourse[]=course^course-Appetizers" stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters]];
            break;
        case Salads:
            [baseURL appendString:[@"&allowedCourse[]=course^course-Salads" stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters]];
            break;
        case BreakfastAndBrunch:
            [baseURL appendString:[@"&allowedCourse[]=course^course-Breakfast and Brunch" stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters]];
            break;
        case Soups:
            [baseURL appendString:[@"&allowedCourse[]=course^course-Soups" stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters]];
            break;
        default:
            break;
    }
    
    if(self.has15MinuteLimit){
        [baseURL appendString:@"&maxTotalTimeInSeconds=900"];
    }
    
    // Add search terms
    if(self.searchTerms){
        [baseURL appendString:[[NSString stringWithFormat:@"&q=%@", self.searchTerms] stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters]];
    }
    
    // Not necessary, but handy
    [baseURL appendString:@"&requirePictures=true"];
    
    [baseURL appendString:@"&maxResult=100&start=0"];
    
    self.url = [[NSURL alloc] initWithString:baseURL];
    //    NSLog(@"%@", baseURL);
}

- (instancetype)initWithSearchWords:(NSString *)words {
    self = [super init];
    if (self) {
        self.searchTerms = [words copy];
        self.selectedIngredients = nil;
        self.bannedIngredients = nil;
        self.course = none;
        self.has15MinuteLimit = NO;
        [self buildURL];
    }
    
    return self;
}

@end










