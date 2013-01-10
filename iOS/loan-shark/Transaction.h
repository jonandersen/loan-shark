//
//  Transaction.h
//  loan-shark
//
//  Created by Jon Andersen on 1/10/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transaction : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int amount;

@end
