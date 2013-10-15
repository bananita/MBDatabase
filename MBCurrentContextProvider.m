//
//  MBCurrentContextProvider.m
//  MBDatabase
//
//  Created by Michał Banasiak on 10/14/13.
//  Copyright (c) 2013 SO MANY APPS. All rights reserved.
//

#import "MBCurrentContextProvider.h"

@interface MBCurrentContextProvider ()
{
    NSManagedObjectContext* __weak defaultManagedObjectContext;
}
@end

@implementation MBCurrentContextProvider

- (id)initWithDefaultManagedObjectContext:(NSManagedObjectContext*)aDefaultManagedObjectContext
{
    self = [super init];
    
    if (!self)
        return nil;
    
    defaultManagedObjectContext = aDefaultManagedObjectContext;
    
    return self;
}

- (NSManagedObjectContext*)contextForCurrentThread
{
    if ([NSThread isMainThread])
		return defaultManagedObjectContext;
    
	else
	{
		NSMutableDictionary *threadDict = [[NSThread currentThread] threadDictionary];
		NSManagedObjectContext *threadContext = [threadDict objectForKey:@"thread's managed object context"];
		if (threadContext == nil)
		{
			threadContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
            threadContext.parentContext = defaultManagedObjectContext;
            threadContext.retainsRegisteredObjects = YES;
			[threadDict setObject:threadContext forKey:@"thread's managed object context"];
		}
		return threadContext;
	}
}

- (void)saveContextAndParent
{
//    NSError* error;
//    [self save:&error];
//    
//    [self.parentContext performBlockAndWait:^{
//        [self.parentContext saveContextAndParent];
//    }];
}



@end
