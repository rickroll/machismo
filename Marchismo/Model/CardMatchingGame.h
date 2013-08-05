//
//  CardMatchingGame.h
//  Marchismo
//
//  Created by Rick Anderson on 5/13/13.
//  Copyright (c) 2013 NativeX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (id)initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (readonly, nonatomic) int score;
@property (readwrite, nonatomic) NSString *flipResult;

@end
