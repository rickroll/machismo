//
//  CardMatchingGame.m
//  Marchismo
//
//  Created by Rick Anderson on 5/13/13.
//  Copyright (c) 2013 NativeX. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@property (readwrite, nonatomic) int score;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    
    return self;
}


- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    } else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}


@end




//#import "CardMatchingGame.h"
//
//@interface CardMatchingGame()
//@property (readwrite, nonatomic) int score;
//@property (strong, nonatomic) NSMutableArray *cards; // of Card
//@end
//@implementation CardMatchingGame
//- (NSMutableArray *)cards
//{
//    if (!_cards) _cards = [[NSMutableArray alloc] init];
//    return _cards;
//}
//
//#define MATCH_BONUS 4
//#define MISMATCH_PENALTY 2
//#define FLIP_COST 1
//
//- (void)flipCardAtIndex:(NSUInteger)index
//{
//    Card *card = [self cardAtIndex:index];
//    
//    if (card && !card.isUnplayable) {
//        if (!card.isFaceUp) {
//            for (Card *otherCard in self.cards) {
//                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
//                    int matchScore = [card match:@[otherCard]];
//                    if (matchScore) {
//                        card.unplayable = YES;
//                        otherCard.unplayable = YES;
//                        self.score += matchScore * MATCH_BONUS;
//                    } else {
//                        otherCard.faceUp = NO;
//                        self.score -= MISMATCH_PENALTY;
//                    }
//                    break;
//                }
//            }
//            self.score -= FLIP_COST;
//        }
//        card.faceUp = !card.isFaceUp;
//    }
//}
//
//- (Card *)cardAtIndex:(NSUInteger)index
//{
//    return (index < [self.cards count]) ? self.cards[index] : nil;
//}
//
//- (id)initWithCardCount:(NSUInteger)count
//              usingDeck:(Deck *)deck
//{
//    self = [super init];
//    
//    if (self) {
//        for (int i = 0; i < count; i++) {
//            Card *card = [deck drawRandomCard];
//            if (card) {
//                self.cards[i] = card;
//            } else {
//                self = nil;
//                break;
//            }
//        }
//    }
//}
//@end






