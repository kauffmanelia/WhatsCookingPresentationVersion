//
//  IngredientList.m
//  MidtermStoryboard
//
//  Created by Elia Kauffman on 2014-11-07.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import "IngredientList.h"

#define listKey       @"ingredientList"

@implementation IngredientList

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    self.ingredientList = [aDecoder decodeObjectForKey:listKey];
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.ingredientList forKey:listKey];
}

-(void)saveToFile {
    NSString *docsDir;
    NSArray *dirPaths;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"foo.png"]];
    [self.ingredientList writeToFile:databasePath atomically:YES];
}

@end
