//
//  FoodCategory.h
//  Calorie Controller
//
//  Created by Hasnat Hoque on 26/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FoodCategoryMeal.h"

@interface FoodCategory : NSObject

@property (nonatomic,strong) NSMutableDictionary *foodCategories;

-(void)addMeal:(FoodCategoryMeal *)meal toCategory:(NSString *)category;
-(NSMutableDictionary *) returnFoodCategories;
@end
