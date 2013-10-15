//
//  MBMasterViewController.h
//  MBDatabase
//
//  Created by Michał Banasiak on 10/14/13.
//  Copyright (c) 2013 SO MANY APPS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

#import "MBDatabase.h"

@interface MBMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) MBDatabase* database;

@end
