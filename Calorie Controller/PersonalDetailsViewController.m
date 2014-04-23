//
//  PersonalDetailsViewController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 24/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "PersonalDetailsViewController.h"

@interface PersonalDetailsViewController ()

@end

@implementation PersonalDetailsViewController

@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize modelURL = _modelURL;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad

{
     NSLog(@"loaded");
    [super viewDidLoad];
    [self addFoodToCoreData];
    // Do any additional setup after loading the view.
}

-(void)addFoodToCoreData
{
    //Food
    //-ID
    //-Name
    //-Calories
    //-Category
    
    Food *food = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
    [food setId:1];
    [food setName:@"Omelette"];
    [food setCalories:50];
    [food setCategory:@"breakfast"];
    
    
    
    NSError *error;
    if(![self.managedObjectContext save:&error])
    {
        NSLog(@"Error");
        //This is a serious error saying the record
        //could not be saved. Advise the user to
        //try again or restart the application.
    }
    
    [self fetchRecords];
}

-(void) fetchRecords{
    
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Name" inManagedObjectContext:self.managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lName" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    NSLog(@"%@",mutableFetchResults);
}

//-(void)setUpFoodCategories
//{
//    self.foodCategories = [[FoodCategory alloc] init];
//    
//    //   ************* Breakfast *************
//    FoodCategoryMeal *mealOne = [[FoodCategoryMeal alloc] init];
//    mealOne.name = @"Omelette";
//    mealOne.calories = @"50";
//    [self.foodCategories addMeal:mealOne toCategory:@"Breakfast"];
//
//    FoodCategoryMeal *mealTwo = [[FoodCategoryMeal alloc] init];
//    mealTwo.name = @"2 Slices Toast";
//    mealTwo.calories = @"20";
//    [self.foodCategories addMeal:mealTwo toCategory:@"Breakfast"];
//    
//    FoodCategoryMeal *mealThree = [[FoodCategoryMeal alloc] init];
//    mealThree.name = @"Coco Pops";
//    mealThree.calories = @"30";
//    [self.foodCategories addMeal:mealThree toCategory:@"Breakfast"];
//    
//    //   ************* Lunch *************
//    FoodCategoryMeal *mealFour = [[FoodCategoryMeal alloc] init];
//    mealFour.name = @"Ceaser Salad";
//    mealFour.calories = @"75";
//    [self.foodCategories addMeal:mealFour toCategory:@"Lunch"];
//    
//    FoodCategoryMeal *mealFive = [[FoodCategoryMeal alloc] init];
//    mealFive.name = @"Turkey Sandwich";
//    mealFive.calories = @"120";
//    [self.foodCategories addMeal:mealFive toCategory:@"Lunch"];
//    
//    FoodCategoryMeal *mealSix = [[FoodCategoryMeal alloc] init];
//    mealSix.name = @"Lamb Wrap";
//    mealSix.calories = @"150";
//    [self.foodCategories addMeal:mealSix toCategory:@"Lunch"];
//    
//    //   ************* Dinner *************
//    
//    FoodCategoryMeal *mealSeven = [[FoodCategoryMeal alloc] init];
//    mealSeven.name = @"Shepards Pie";
//    mealSeven.calories = @"300";
//    [self.foodCategories addMeal:mealSeven toCategory:@"Dinner"];
//    
//    FoodCategoryMeal *mealEight = [[FoodCategoryMeal alloc] init];
//    mealEight.name = @"Fish and Chips";
//    mealEight.calories = @"500";
//    [self.foodCategories addMeal:mealEight toCategory:@"Dinner"];
//    
//    FoodCategoryMeal *mealNine = [[FoodCategoryMeal alloc] init];
//    mealNine.name = @"Lasagne";
//    mealNine.calories = @"200";
//    [self.foodCategories addMeal:mealNine toCategory:@"Dinner"];
//    
//    
//      //   ************* Drinks *************
//    
//    FoodCategoryMeal *mealTen = [[FoodCategoryMeal alloc] init];
//    mealTen.name = @"Coke";
//    mealTen.calories = @"75";
//    [self.foodCategories addMeal:mealTen toCategory:@"Drinks"];
//    
//    FoodCategoryMeal *mealEleven = [[FoodCategoryMeal alloc] init];
//    mealEleven.name = @"Orange Juice";
//    mealEleven.calories = @"25";
//    [self.foodCategories addMeal:mealEleven toCategory:@"Drinks"];
//    
//    FoodCategoryMeal *mealTwelve = [[FoodCategoryMeal alloc] init];
//    mealTwelve.name = @"Apple Juice";
//    mealTwelve.calories = @"25";
//    [self.foodCategories addMeal:mealTwelve toCategory:@"Drinks"];
//    
//    //   ************* Snacks *************
//    
//    FoodCategoryMeal *mealThirteen = [[FoodCategoryMeal alloc] init];
//    mealThirteen.name = @"Crisp: Salt and Vinegar";
//    mealThirteen.calories = @"100";
//    [self.foodCategories addMeal:mealThirteen toCategory:@"Snacks"];
//    
//    FoodCategoryMeal *mealFourteen = [[FoodCategoryMeal alloc] init];
//    mealFourteen.name = @"Apple";
//    mealFourteen.calories = @"10";
//    [self.foodCategories addMeal:mealFourteen toCategory:@"Snacks"];
//
//    FoodCategoryMeal *mealFifteen = [[FoodCategoryMeal alloc] init];
//    mealFifteen.name = @"Milk Chocolate";
//    mealFifteen.calories = @"10";
//    [self.foodCategories addMeal:mealFifteen toCategory:@"Snacks"];
//
//    
//    //   ************* Show Food Categories *************
//    
//    [self.foodCategories returnFoodCategories];
//}
//
//-(void)setUpExerciseCategories
//{
//    self.exerciseCategories = [[ExerciseCategory alloc] init];
//    
//    //   ************* Walking *************
//    ExerciseCategoryWorkout *workoutOne = [[ExerciseCategoryWorkout alloc] init];
//    workoutOne.units = @"Distance";
//    workoutOne.calories = @"100";
//    [self.exerciseCategories addExercise:workoutOne withName:@"Walking"];
//    
//    //   ************* Running *************
//    ExerciseCategoryWorkout *workoutTwo = [[ExerciseCategoryWorkout alloc] init];
//    workoutTwo.units = @"Distance";
//    workoutTwo.calories = @"50";
//    [self.exerciseCategories addExercise:workoutTwo withName:@"Running"];
//    
//    //   ************* Cycling *************
//    ExerciseCategoryWorkout *workoutThree = [[ExerciseCategoryWorkout alloc] init];
//    workoutThree.units = @"Distance";
//    workoutThree.calories = @"75";
//    [self.exerciseCategories addExercise:workoutThree withName:@"Cycling"];
//
//    //   ************* Cycling *************
//    ExerciseCategoryWorkout *workoutFour = [[ExerciseCategoryWorkout alloc] init];
//    workoutFour.units = @"Distance";
//    workoutFour.calories = @"400";
//    [self.exerciseCategories addExercise:workoutFour withName:@"Swimming"];
//    
//    //   ************* Show Exercise Categories *************
//    [self.exerciseCategories returnExerciseCategories];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Core Data

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

// Returns the managed object context
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Name" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"SimpleCoreData.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
