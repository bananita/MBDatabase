//
//  MBCoreDataStack.h
//  MBDatabase
//
//  Created by Michał Banasiak on 10/14/13.
//  Copyright (c) 2013 SO MANY APPS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBCoreDataStack : NSObject

- (id)initWithDataModelName:(NSString*)aDataModelName;

- (NSManagedObjectContext *)managedObjectContext;
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;

@end
