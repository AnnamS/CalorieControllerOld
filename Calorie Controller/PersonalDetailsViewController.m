//
//  PersonalDetailsViewController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 24/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "PersonalDetailsViewController.h"
#import "CalculatorAppDelegate.h"

@interface PersonalDetailsViewController ()
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@end

@implementation PersonalDetailsViewController
@synthesize managedObjectContext;
@synthesize managedObjectModel;
@synthesize persistentStoreCoordinator;

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
    
    CalculatorAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    managedObjectContext = [appDelegate managedObjectContext];
    managedObjectModel = [appDelegate managedObjectModel];
    
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

    [food setName:@"Omelette"];
    [food setCalories:@"50"];
    [food setCategory:@"breakfast"];
    [food setId:@"1"];
    
    
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
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Food" inManagedObjectContext:managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
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
