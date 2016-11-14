//
//  DataSaveManager.h
//  Day2UP
//
//  Created by ramborange on 2016/11/9.
//  Copyright © 2016年 Rambos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataSaveManager : NSObject<NSFetchedResultsControllerDelegate>
{
    NSFetchedResultsController *_result;
    NSManagedObjectContext *_context;
}
+ (DataSaveManager *)shareDataSaveManager;

@property (nonatomic, strong) NSFetchedResultsController *result;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end
