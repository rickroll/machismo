//
//  PlayingCard.h
//  Marchismo
//
//  Created by Rick Anderson on 4/24/13.
//  Copyright (c) 2013 NativeX. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
