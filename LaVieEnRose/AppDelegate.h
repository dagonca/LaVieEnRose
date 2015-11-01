//
//  AppDelegate.h
//  LaVieEnRose
//
//  Created by Dani Gonzalez castillo on 12/11/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@property (nonatomic,retain) NSMutableArray *globalArray;
@property (nonatomic,retain) NSMutableArray *globalArray1;
@property (nonatomic,retain) NSMutableArray *globalArray2;
@property (nonatomic,retain) NSMutableArray *globalArray3;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

