//
//  NSManagedObjectContext+MBSaveContextAndParent.h
//  MBDatabase
//
//  Created by Michał Banasiak on 10/15/13.
//  Copyright (c) 2013 SO MANY APPS. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (MBSaveContextAndParent)

- (void)saveContextAndParentWithError:(NSError *__autoreleasing *)contextError
                          parentError:(NSError *__autoreleasing *)parentError;

@end
