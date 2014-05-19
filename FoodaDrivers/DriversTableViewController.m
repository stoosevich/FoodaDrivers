//
//  DriversTableViewController.m
//  
//
//  Created by Steve Toosevich on 5/17/14.
//
//

#import "DriversTableViewController.h"
#import "Parse/Parse.h"

@interface DriversTableViewController ()

@end

@implementation DriversTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //query for users other than current user
    PFQuery* userQuery = [PFUser query];
    [userQuery whereKey:@"objectId" notEqualTo:[[PFUser currentUser] objectId]];
    [userQuery addAscendingOrder:@"username"];
    [userQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.usersArray = objects;
            [self.tableView reloadData];
        }
        NSLog(@"users %@",self.usersArray);
    }];
     self.clearsSelectionOnViewWillAppear = NO;
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.usersArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"driversReuseCellID" forIndexPath:indexPath];
    
    PFObject *user = [self.usersArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:[user objectForKey:@"username"]];

    return cell;
}

    // allow edits of tableview cells
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

    // allow rearranging of the tableview cells
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}





@end
