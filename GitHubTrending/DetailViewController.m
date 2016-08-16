//
//  DetailViewController.m
//  GitHubTrending
//
//  Created by Andres Diez on 2016-08-15.
//  Copyright © 2016 Andres Diez. All rights reserved.
//

#import "DetailViewController.h"



typedef NSString* (^MyBlock)(NSString*,NSString*) ;
@interface DetailViewController (){
    MyBlock mine;
}
@property (nonatomic, copy) MyBlock mine;

@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *languageLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

- (NSString*) joinwe:(NSString*) strA :(NSString*) strB;
- (void) load;

@end


@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self load];
    
    self.idLabel.text = self.mine(@"Id: ",self.detail[@"id"]);
    self.NameLabel.text = self.mine(@"Name: ",self.detail[@"name"]);
    self.scoreLabel.text = self.mine(@"Score: ",self.detail[@"score"]);
    self.languageLabel.text = self.mine(@"Language: ",self.detail[@"language"]);
    self.sizeLabel.text = self.mine(@"Size: ",self.detail[@"size"]);
    self.descriptionLabel.text = self.mine(@"Description: ",self.detail[@"description"]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSString*) joinwe:(NSString*)strA :(NSString*)strB{
    return [NSString stringWithFormat:@"%@ %@", strA, strB];
}

-(void) load{
    __weak typeof(self) weakSelf = self;
    self.mine = ^(NSString* strA,NSString* strB){ return [weakSelf joinwe:strA:strB]; };
}

@synthesize mine;


@end
