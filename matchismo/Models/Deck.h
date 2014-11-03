//
//  Deck.h
//  matchismo
//
//  Created by HU Ming on 2/11/14.
//  Copyright (c) 2014 HU Ming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
