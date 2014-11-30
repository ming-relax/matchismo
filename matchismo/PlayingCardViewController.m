//
//  PlayingCardViewController.m
//  matchismo
//
//  Created by HU Ming on 27/11/14.
//  Copyright (c) 2014 HU Ming. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"


@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

@end
