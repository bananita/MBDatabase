//
//  NSManagedObjectContext+MBSaveContextAndParent.m
//  MBDatabase
//
//  Created by Michał Banasiak on 10/15/13.
//  Copyright (c) 2013 SO MANY APPS. All rights reserved.
//

#import "NSManagedObjectContext+MBSaveContextAndParent.h"

@implementation NSManagedObjectContext (MBSaveContextAndParent)

- (void)saveContextAndParentWithError:(NSError *__autoreleasing *)contextError
                          parentError:(NSError *__autoreleasing *)parentError;
{
    [self save:contextError];
    
    [self.parentContext performBlockAndWait:^{
        [self.parentContext save:parentError];
    }];
}

@end
