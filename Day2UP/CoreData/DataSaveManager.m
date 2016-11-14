//
//  DataSaveManager.m
//  Day2UP
//
//  Created by ramborange on 2016/11/9.
//  Copyright © 2016年 Rambos. All rights reserved.
//

#import "DataSaveManager.h"

#define DB_path  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"myDataBase.sqlite"]

@implementation DataSaveManager
@synthesize context;
@synthesize result;

static DataSaveManager *manager = nil;
+ (DataSaveManager *)shareDataSaveManager {
    @synchronized (self) {
        if (manager==nil) {
            manager = [[DataSaveManager alloc] init];
        }
        return manager;
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initCoreData];
    }
    return self;
}

- (void) initCoreData {
    NSURL *url = [NSURL URLWithString:DB_path];
    NSManagedObjectModel *objectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator *persistentSC = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:objectModel];
    NSDictionary *opitionDic = [NSDictionary dictionaryWithObjectsAndKeys:@(YES),NSMigratePersistentStoresAutomaticallyOption,@(YES),NSInferMappingModelAutomaticallyOption, nil];
    NSError *error;
    NSPersistentStore *persistentStore = [persistentSC addPersistentStoreWithType:NSSQLiteStoreType configuration:NULL URL:url options:opitionDic error:&error];
    if (persistentStore!=nil) {
        self.context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [self.context setPersistentStoreCoordinator:persistentSC];
    }else {
        NSLog(@"%@",[error localizedDescription]);
    }
    
}

#pragma mark -business manager
///////////////////














- (void)saveUpdate {
    if (_context) {
        if ([_context hasChanges]) {
            NSError *error;
            if (![self.context save:&error]) {
                NSLog(@"%@",[error localizedDescription]);
            }
        }
    }
}


#pragma mark - NSFetchResultsController Delegate
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
}

@end
