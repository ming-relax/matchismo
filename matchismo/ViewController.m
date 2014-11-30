//
//  ViewController.m
//  matchismo
//
//  Created by HU Ming on 31/10/14.
//  Copyright (c) 2014 HU Ming. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModelControl;

@property (weak, nonatomic) IBOutlet UILabel *lastResult;


@end


@implementation ViewController


- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

- (Deck *)createDeck {
    return nil;
}


- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    self.gameModelControl.enabled = NO;
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", (int)self.game.score];
    }
    
    if (self.game.lastResult.score) {
        self.lastResult.text = @"matched";
        NSString *sentence = @"";
        for (Card *card in self.game.lastResult.cards) {
            [sentence stringByAppendingString:card.contents];
        }
        self.lastResult.text = [NSString stringWithFormat:@"%@ matched", sentence];
    } else if (self.game.lastResult.cards.count > 1) {
        NSString *sentence = @"";
        for (Card *card in self.game.lastResult.cards) {
            [sentence stringByAppendingString:card.contents];
        }
        self.lastResult.text = [NSString stringWithFormat:@"%@ mismatch", sentence];
        
    } else {
        self.lastResult.text = [NSString stringWithFormat:@"Clicked %@", self.game.lastResult.currentCard.contents];
    }
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront": @"cardback"];
}

- (IBAction)reDeal:(UIButton *)sender {
    self.game = nil;
    [self updateUI];
    self.gameModelControl.enabled = YES;
}

- (IBAction)changeMode:(UISegmentedControl *)sender {
    NSLog(@"index: %d", (int)sender.selectedSegmentIndex);
    if (sender.selectedSegmentIndex == 0) {
        self.game.matchMode = 2;
    } else if (sender.selectedSegmentIndex == 1) {
        self.game.matchMode = 3;
    }
    NSLog(@"matchMode: %d", (int)self.game.matchMode);
}


@end
