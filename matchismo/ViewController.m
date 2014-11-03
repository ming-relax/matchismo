//
//  ViewController.m
//  matchismo
//
//  Created by HU Ming on 31/10/14.
//  Copyright (c) 2014 HU Ming. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic) PlayingCardDeck *deck;

@end

@implementation ViewController


- (PlayingCardDeck *)deck {
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat: @"Flips: %d", self.flipCount];
    NSLog(@"flipCount changed to %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {

    if (sender.currentTitle.length) {
        [sender setBackgroundImage:[UIImage imageNamed:@"Frog"] forState:UIControlStateNormal];
        
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"whitebackground"] forState:UIControlStateNormal];
        [sender setTitle:[self.deck drawRandomCard].contents forState:UIControlStateNormal];
    }
    
    self.flipCount++;
}

@end
