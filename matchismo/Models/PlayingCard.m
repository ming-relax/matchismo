//
//  PlayingCard.m
//  matchismo
//
//  Created by HU Ming on 3/11/14.
//  Copyright (c) 2014 HU Ming. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards {
    int score = 0;
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        } else if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
    } else if ([otherCards count] == 2) {
        PlayingCard *secondCard = [otherCards firstObject];
        PlayingCard *thirdCard = [otherCards lastObject];
        
        if (self.rank == secondCard.rank && self.rank == thirdCard.rank) {
            score = 20;
        } else if ([self.suit isEqualToString:secondCard.suit] && [self.suit isEqualToString:thirdCard.suit]) {
            score = 15;
        } else if (self.rank == secondCard.rank ||
                   self.rank == thirdCard.rank ||
                   secondCard.rank == thirdCard.rank) {
            score = 10;
        } else if ([self.suit isEqualToString:secondCard.suit] ||
                   [self.suit isEqualToString:thirdCard.suit] ||
                   [secondCard.suit isEqualToString:thirdCard.suit]) {
            score = 5;
        }
    }
    return score;
}

- (NSString *)contents {
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];

}

@synthesize suit = _suit;


+ (NSArray *)validSuits {
    return @[@"♣️", @"♠️", @"♥️", @"♦️"];
}

+ (NSArray *)rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}


- (NSString *)suit {
    return _suit ? _suit: @"?";
}

+ (NSUInteger)maxRank {
    return [[PlayingCard rankStrings] count] - 1;
}

- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
