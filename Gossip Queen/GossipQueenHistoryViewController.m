//
//  GossipQueenHistoryViewController.m
//  Gossip Queen
//
//  Created by Noah Harris on 2/16/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import "GossipQueenHistoryViewController.h"
#import "Message.h"

@interface GossipQueenHistoryViewController ()

@end

@implementation GossipQueenHistoryViewController {
}




- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        
        messageArray = [[NSMutableArray alloc] init];
        [self loadMessages];
        
        
        
        
        //Test code
        //sampleMessage = [[Message alloc] init];
        //sampleMessage.text = @"This is a sample Message";
        
        //[messageArray addObject:sampleMessage];
        
        [self saveMessages];

        NSLog(@"Documents folder is %@", [self documentsDirectory]);
        NSLog(@"Data file path is %@", [self dataFilePath]);

    }
    return self;
}




//data access methods
- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

- (NSString *)dataFilePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"messages.plist"];
}

-(void)saveMessages
{
    NSMutableData *data = [[NSMutableData alloc] init];
    //initialize archiver with the NSMutableData
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //encode the messages array into the data object
    [archiver encodeObject:messageArray forKey:@"messageArray"];
    [archiver finishEncoding];
    //writes to file by calling the filepath function
    [data writeToFile:[self dataFilePath] atomically:YES];
}

-(void)loadMessages
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        messageArray = [unarchiver decodeObjectForKey:@"messageArray"];
        [unarchiver finishDecoding];
    }
}
 







- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSLog(@"History");
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryCell"];
    
    
    UILabel *header = (UILabel *)[cell viewWithTag:1000];
    UILabel *date = (UILabel *)[cell viewWithTag:2000];
    
    Message *test = [messageArray objectAtIndex:0];
    
    if (indexPath.row == 0) {
        header.text = test.text;
        date.text = @"12/12/12";
    } else if (indexPath.row == 1) {
        header.text = @"Another message";
        date.text = @"66/66/66";
    }
    
    
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

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
     //[self.navigationController pushViewController:detailViewController animated:YES];
}

@end
