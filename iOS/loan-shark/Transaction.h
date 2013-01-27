//
//  Transaction.h
//  loan-shark
//
//  Created by Jon Andersen on 1/27/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Transaction : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * amount;
@property (nonatomic, retain) NSString * name;

@end
