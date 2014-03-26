//
//  FoodCategory.m
//  Calorie Controller
//
//  Created by Hasnat Hoque on 26/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "FoodCategory.h"

@implementation FoodCategory
@synthesize foodCategories = _foodCategories;

-( NSMutableDictionary *) foodCategories
{
    if (!_foodCategories)
    {
        _foodCategories = [[NSMutableDictionary alloc] init];
        NSMutableArray *breakfast = [[NSMutableArray alloc] init];
        NSMutableArray *lunch = [[NSMutableArray alloc] init];
        NSMutableArray *dinner = [[NSMutableArray alloc] init];
        NSMutableArray *snacks = [[NSMutableArray alloc] init];
        NSMutableArray *drinks = [[NSMutableArray alloc] init];
        [_foodCategories setObject:breakfast forKey:@"Breakfast"];
        [_foodCategories setObject:lunch forKey:@"Lunch"];
        [_foodCategories setObject:dinner forKey:@"Dinner"];
        [_foodCategories setObject:snacks forKey:@"Snacks"];
        [_foodCategories setObject:drinks forKey:@"Drinks"];
        
    }
    return _foodCategories;
}

-(void)addMeal:(FoodCategoryMeal *)meal toCategory:(NSString *)category
{
    NSMutableArray *categoryArray = [self.foodCategories objectForKey:category];
    [categoryArray addObject:meal];
}

-(NSMutableDictionary *) returnFoodCategories
{
//    for (int i = 0; i < 3; i++)
//    {
//        NSMutableArray *temp =  [self.foodCategories objectForKey:@"Breakfast"];
//        
//        FoodCategoryMeal *tempMeal = [temp objectAtIndex:i];
//        NSLog(@"%@",tempMeal.name);
//    }
//    
//    for (int i = 0; i < 3; i++)
//    {
//        NSMutableArray *temp =  [self.foodCategories objectForKey:@"Lunch"];
//        
//        FoodCategoryMeal *tempMeal = [temp objectAtIndex:i];
//        NSLog(@"%@",tempMeal.name);
//    }
//    
//    for (int i = 0; i < 3; i++)
//    {
//        NSMutableArray *temp =  [self.foodCategories objectForKey:@"Dinner"];
//        
//        FoodCategoryMeal *tempMeal = [temp objectAtIndex:i];
//        NSLog(@"%@",tempMeal.name);
//    }
//    
//    for (int i = 0; i < 3; i++)
//    {
//        NSMutableArray *temp =  [self.foodCategories objectForKey:@"Drinks"];
//        
//        FoodCategoryMeal *tempMeal = [temp objectAtIndex:i];
//        NSLog(@"%@",tempMeal.name);
//    }
//    
//    for (int i = 0; i < 3; i++)
//    {
//        NSMutableArray *temp =  [self.foodCategories objectForKey:@"Snacks"];
//        
//        FoodCategoryMeal *tempMeal = [temp objectAtIndex:i];
//        NSLog(@"%@",tempMeal.name);
//    }
    return self.foodCategories;
}

@end
