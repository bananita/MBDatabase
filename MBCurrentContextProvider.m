//
//  MBCurrentContextProvider.m
//  MBDatabase
//
//  Created by Michał Banasiak on 10/14/13.
//  Copyright (c) 2013 SO MANY APPS. All rights reserved.
//

#import "MBCurrentContextProvider.h"

static const NSString* kManagedObjectContextForThread;

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
        NSManagedObjectContext *threadContext;
        
        NSMutableDictionary* threadDictionary = [[NSThread currentThread] threadDictionary];
        threadContext = threadDictionary[kManagedObjectContextForThread];
        
        if (!threadContext)
        {
            threadContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
            threadContext.parentContext = defaultManagedObjectContext;
            
            threadDictionary[kManagedObjectContextForThread] = threadContext;
        }
        
		return threadContext;
	}
}

@end
