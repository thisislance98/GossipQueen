//
//  Message.m
//  Gossip Queen
//
//  Created by Noah Harris on 2/18/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import "Message.h"

@implementation Message

@synthesize text, lineArray, userName, category, dateSent;

#pragma mark - NSCoding

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.text forKey:@"text"];
    [aCoder encodeObject:self.lineArray forKey:@"lineArray"];
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.dateSent forKey:@"dateSent"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init])) {
        self.text = [aDecoder decodeObjectForKey:@"text"];
        self.lineArray = [aDecoder decodeObjectForKey:@"lineArray"];
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.category = [aDecoder decodeObjectForKey:@"category"];
        self.dateSent = [aDecoder decodeObjectForKey:@"dateSent"];
    }
    return self;
}

@end
