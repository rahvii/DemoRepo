//
//  TableViewController.m
//  Day9Exercise2
//
//  Created by Raul Huerta on 26/04/2013.
//  Copyright (c) 2013 Unbounded Solutions. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

@synthesize movieArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    Movie *defaultMovie = [[Movie alloc]initWithTitle:@"The Godfather" year:@"1972" cast:@"Marlon Brando, Al Pacino"];
    
    self.movieArray = [[NSMutableArray alloc]initWithObjects:defaultMovie, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.movieArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    Movie * movie = [[Movie alloc]init];
    movie = [self.movieArray objectAtIndex:indexPath.row];
    cell.textLabel.text = movie.title;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [movieArray removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    ViewController * destVC = (ViewController*)segue.destinationViewController;
    
    destVC.delegate = self;
    
    if ([segue.identifier isEqualToString:@"AddMovie"])
    {
        destVC.editMode = NO;
    }
    if ([segue.identifier isEqualToString:@"EditMovie"])
    {
        destVC.editMode = YES;
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        destVC.editedMovieIndex = indexPath.row;
        destVC.movieEdited = [self.movieArray objectAtIndex:indexPath.row];
        
    }
}

#pragma mark - ViewControllerDelegate methods

-(void)saveMovie:(ViewController *)controller movieToSave:(Movie *)movie
{
    if([self validateYear:movie.year])
    {
        [movieArray addObject:movie];
        [self.tableView reloadData];
        [controller.navigationController popViewControllerAnimated:YES];
    }else
    {
        [self showAlert];
    }
}

-(void)editMovie:(ViewController *)controller movieToEdit:(Movie *)movie indexOfTheMovie:(int)index
{
    if ([self validateYear:movie.year])
    {
        [movieArray replaceObjectAtIndex:index withObject:movie];
        [self.tableView reloadData];
        [controller.navigationController popViewControllerAnimated:YES];
    }else
    {
        [self showAlert];
    }
}

-(BOOL)validateYear:(NSString*)year
{
    int yearInt = [year intValue];
    NSString * yearIntToString = [NSString stringWithFormat:@"%i",yearInt];
    
    NSLog(@"str: %@ int:%i int2str:%@",year, yearInt, yearIntToString);
    
    if ([year isEqualToString:yearIntToString])
    {
        return YES;
    }else
    {
        return NO;
    }
}

-(void)showAlert
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Year is not Valid" message:@"The year typed on the form is not a valid number, please correct this problem before continuing." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}
@end
