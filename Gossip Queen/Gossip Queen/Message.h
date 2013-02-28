//
//  Message.h
//  Gossip Queen
//
//  Created by Noah Harris on 2/18/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject <NSCoding>

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSMutableArray *lineArray;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSDate *dateSent;


@end
