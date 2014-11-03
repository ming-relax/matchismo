//
//  Card.m
//  matchismo
//
//  Created by HU Ming on 31/10/14.
//  Copyright (c) 2014 HU Ming. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
