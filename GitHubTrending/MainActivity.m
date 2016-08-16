//
//  MainActivity.m
//  GitHubTrending
//
//  Created by Andres Diez on 2016-08-15.
//  Copyright © 2016 Andres Diez. All rights reserved.
//

#import "MainActivity.h"
#import "Model.h"
#import "DetailViewController.h"


@interface MainActivity ()
@property(nonatomic, strong) Model *data;
@end


@implementation MainActivity

- (void)viewDidLoad {
    self.data=[[Model alloc] init];
    if (!self.data.isLoaded) { [self.data loadModel:^(){
            [self.tableView reloadData];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data getLength];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cello" forIndexPath:indexPath];
    cell.textLabel.text =  [self.data row:indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showdetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showdetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *dcv=[segue destinationViewController];
        dcv.detail = [self.data detail:indexPath.row];
    }
}

@end
