//
//  FoodCategory.h
//  Calorie Controller
//
//  Created by Hasnat Hoque on 26/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Food : NSObject

@property int id;
@property (nonatomic,strong) NSString *name;
@property int calories;
@property (nonatomic,strong) NSString *category;
@end
