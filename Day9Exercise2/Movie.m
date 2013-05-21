//
//  Movie.m
//  Day9Exercise2
//
//  Created by Raul Huerta on 26/04/2013.
//  Copyright (c) 2013 Unbounded Solutions. All rights reserved.
//

#import "Movie.h"

@implementation Movie

@synthesize title;
@synthesize year;
@synthesize cast;

-(id)init
{
    self = [super init];
    return self;
}

-(id)initWithTitle: (NSString*)newTitle
                  year:(NSString*)newYear
                  cast: (NSString*)newCast
{
    self = [self init];
    self.title = newTitle;
    self.year = newYear;
    self.cast = newCast;
    
    return self;
}

-(void)editTitle: (NSString*)newTitle
              year:(NSString*)newYear
              cast: (NSString*)newCast
{
    self.title = newTitle;
    self.year = newYear;
    self.cast = newCast;
    
}

@end
