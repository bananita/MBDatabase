//
//  MBDatabase.m
//  MBDatabase
//
//  Created by Michał Banasiak on 10/14/13.
//  Copyright (c) 2013 SO MANY APPS. All rights reserved.
//

#import "MBDatabase.h"
#import "MBCoreDataStack.h"
#import "MBCurrentContextProvider.h"

@interface MBDatabase ()
{
    MBCoreDataStack* coreDataStack;
    MBCurrentContextProvider* currentContextProvider;
}
@end

@implementation MBDatabase

- (id)initWithDataModelName:(NSString*)aDataModelName
{
    NSAssert([NSThread isMainThread], @"You have to create a database on the main thread");
    
    self = [super init];
    
    if (!self)
        return nil;
    
    coreDataStack = [[MBCoreDataStack alloc] initWithDataModelName:aDataModelName];
    
    currentContextProvider = [[MBCurrentContextProvider alloc] initWithDefaultManagedObjectContext:[coreDataStack managedObjectContext]];
    
    return self;
}

- (id)context
{
    return [currentContextProvider contextForCurrentThread];
}

@end
