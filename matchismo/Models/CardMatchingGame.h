//
//  CardMatchingGame.h
//  matchismo
//
//  Created by HU Ming on 16/11/14.
//  Copyright (c) 2014 HU Ming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
#import "GameResult.h"

@interface CardMatchingGame : NSObject

//designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSUInteger score;
@property (nonatomic) NSUInteger matchMode;
@property (nonatomic, strong) GameResult *lastResult;

@end
