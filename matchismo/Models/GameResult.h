//
//  GameResult.h
//  matchismo
//
//  Created by HU Ming on 20/11/14.
//  Copyright (c) 2014 HU Ming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface GameResult : NSObject

@property (nonatomic) NSUInteger score;
@property (nonatomic, strong) NSArray *cards;
@property (nonatomic, strong) Card *currentCard;

@end
