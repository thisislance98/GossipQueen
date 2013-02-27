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

@synthesize messageArray;




- (id)initWithCoder:(NSCoder *)aDecoder //this is necessary for the loading the messages
{
    if ((self = [super initWithCoder:aDecoder])) {
        
        messageArray = [[NSMutableArray alloc] init];
        sendingMessage = [[Message alloc] init];
        [self loadMessages];
        
        
        
        
        //Test code
        //sampleMessage = [[Message alloc] init];
        //sampleMessage.text = @"THIS IS CRAZY";
        
        //[messageArray addObject:sampleMessage];
        
        [self saveMessages];

        NSLog(@"Documents folder is %@", [self documentsDirectory]);
        NSLog(@"Data file path is %@", [self dataFilePath]);
        NSLog(@"message count is %i", [messageArray count]);

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//this is part of the navigation logic
//this prevents the history screen from accidentally thinking it's choosing a message for the map screen later on
-(void)viewWillDisappear:(BOOL)animated
{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"getMessage"];
}

//##############################################
//THIS IS HOW DATA IS BEING PASSED TO THE DETAIL VIEW

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"detail"]){
        GossipQueenDetailViewController *controller = (GossipQueenDetailViewController *)segue.destinationViewController;
        controller.message = sendingMessage;
    }
}




#pragma mark - Data access

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
    
    Message *temp = [messageArray objectAtIndex:indexPath.row]; //indexes into the master message array
    
    header.text = temp.text;
    date.text = @"test";
    
    
    return cell;
        
        
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //This logic makes it so you can access the history screen from either map (choose message) or tab with the proper actions taken
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"getMessage"])
    {
        [[NSUserDefaults standardUserDefaults] setInteger:indexPath.row forKey:@"chosenString"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"getMessage"];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } else {
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        sendingMessage = [messageArray objectAtIndex:indexPath.row]; //set sending message to the proper message
        
        [self performSegueWithIdentifier:@"detail" sender:self];
    }
}

@end
