//
//  Message.m
//  Gossip Queen
//
//  Created by Noah Harris on 2/18/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import "Message.h"

@implementation Message

@synthesize text, lineArray, userName;






#pragma mark - NSCoding

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.text forKey:@"text"];
    [aCoder encodeObject:self.lineArray forKey:@"lineArray"];
    [aCoder encodeObject:self.userName forKey:@"userName"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init])) {
        self.text = [aDecoder decodeObjectForKey:@"text"];
        self.lineArray = [aDecoder decodeObjectForKey:@"lineArray"];
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
    }
    return self;
}

@end
