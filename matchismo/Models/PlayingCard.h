//
//  PlayingCard.h
//  matchismo
//
//  Created by HU Ming on 3/11/14.
//  Copyright (c) 2014 HU Ming. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end
