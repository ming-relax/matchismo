//
//  Deck.m
//  matchismo
//
//  Created by HU Ming on 2/11/14.
//  Copyright (c) 2014 HU Ming. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end


@implementation Deck

- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card {
    [self addCard:card atTop:FALSE];
}

- (Card *)drawRandomCard {
    Card *randomCard = nil;
    
    if ([self.cards count]) {
        unsigned int index = arc4random() % [self.cards count];
        
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
        
    }
    return randomCard;
    
}

@end
