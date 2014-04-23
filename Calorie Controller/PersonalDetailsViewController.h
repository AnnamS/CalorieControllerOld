//
//  PersonalDetailsViewController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 24/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Meal.h"
#import "Food.h"
#import "ExerciseCategoryWorkout.h"
#import "ExerciseCategory.h"

@interface PersonalDetailsViewController : UIViewController

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic,strong) NSURL *modelURL;

@end
