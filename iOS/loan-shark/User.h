//
//  User.h
//  loan-shark
//
//  Created by Jon Andersen on 1/27/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstname;
@property (nonatomic, retain) NSString * lastname;

@end
