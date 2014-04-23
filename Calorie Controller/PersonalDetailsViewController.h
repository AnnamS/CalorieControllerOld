//
//  PersonalDetailsViewController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 24/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodCategoryMeal.h"
#import "FoodCategory.h"
#import "ExerciseCategoryWorkout.h"
#import "ExerciseCategory.h"

@interface PersonalDetailsViewController : UIViewController
@property (nonatomic,strong) FoodCategory *foodCategories;
@property (nonatomic,strong) ExerciseCategory *exerciseCategories;
@end
