//
//  SetCardViewController.m
//  matchismo
//
//  Created by HU Ming on 27/11/14.
//  Copyright (c) 2014 HU Ming. All rights reserved.
//

#import "SetCardViewController.h"
#import "PlayingCardDeck.h"

@interface SetCardViewController ()

@end

@implementation SetCardViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
