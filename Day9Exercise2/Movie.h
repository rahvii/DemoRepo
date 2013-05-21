//
//  Movie.h
//  Day9Exercise2
//
//  Created by Raul Huerta on 26/04/2013.
//  Copyright (c) 2013 Unbounded Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *year;
@property (strong, nonatomic) NSString *cast;

-(id)initWithTitle: (NSString*)newTitle
              year:(NSString*)newYear
              cast: (NSString*)newCast;

-(void)editTitle: (NSString*)newTitle
            year:(NSString*)newYear
            cast: (NSString*)newCast;


@end
