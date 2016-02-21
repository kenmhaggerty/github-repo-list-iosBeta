//
//  FISReposTableViewController.m
//  
//
//  Created by Joe Burgess on 5/5/14.
//
//

#import "FISReposTableViewController.h"
#import "FISReposDataStore.h"

@interface FISReposTableViewController ()
@property (nonatomic, strong) NSArray *repositories;
@end

@implementation FISReposTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.accessibilityIdentifier = @"Repo Table View";
    self.tableView.accessibilityLabel=@"Repo Table View";
    
    [[FISReposDataStore sharedDataStore] getRepositoriesWithCompletion:^(BOOL success) {
        
        if (!success) return;
        
        [self setRepositories:[[FISReposDataStore sharedDataStore] repositories]];
        [self.tableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.repositories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    FISGithubRepository *repo = self.repositories[indexPath.row];
    [cell.textLabel setText:repo.fullName];
    
    return cell;
}

@end
