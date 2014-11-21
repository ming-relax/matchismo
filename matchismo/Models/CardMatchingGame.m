//
//  CardMatchingGame.m
//  matchismo
//
//  Created by HU Ming on 16/11/14.
//  Copyright (c) 2014 HU Ming. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSUInteger score;

@property (nonatomic, strong) NSMutableArray *cards; // of cards
@end

@implementation CardMatchingGame

+ (NSArray *)validMatchMode {
    return @[@0, @2, @3];
}

- (void)setMatchMode:(NSUInteger)matchMode {
    if ([[CardMatchingGame validMatchMode] containsObject:@(matchMode)])
        _matchMode = matchMode;
}

- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {

    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        self.matchMode = 2;
        self.lastResult = [[GameResult alloc] init];
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENLATY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)matchCards:(Card *)card otherCards:(NSArray *)otherCards {
    int matchScore = [card match:otherCards];
    if (matchScore) {
        self.score += matchScore * MATCH_BONUS;
        for (Card *otherCard in otherCards) {
            otherCard.matched = YES;
        }
        card.matched = YES;
    } else {
        self.score -= MISMATCH_PENLATY;
        for (Card *otherCard in otherCards) {
            otherCard.chosen = NO;
        }
    }
    self.lastResult.score = matchScore;
    self.lastResult.cards = [otherCards arrayByAddingObject:card];
    self.lastResult.currentCard = card;
}

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // the current card is not chosen currently
            // the second card is chosen
            // the third card is chosen
            // the second card and the thrid card should be different
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    if (self.matchMode == 2) {
                        [self matchCards:card otherCards:@[otherCard]];
                        break;
                    } else if (self.matchMode == 3) {
                        for (Card *thirdCard in self.cards) {
                            if (otherCard != thirdCard && thirdCard.isChosen && !thirdCard.isMatched) {
                                [self matchCards:card otherCards:@[otherCard, thirdCard]];
                                break;
                            }
                        }
                    }
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}
@end
