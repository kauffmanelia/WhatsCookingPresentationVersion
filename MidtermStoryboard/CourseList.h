//
//  IngredientList.h
//  WhatsCookingIngredientPicker
//
//  Created by Elia Kauffman on 2014-11-03.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CourseList : NSObject

@property (nonatomic, strong) NSArray * courseList;

- (NSInteger)count;

@end
