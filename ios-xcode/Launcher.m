//
//  Launcher.m
//  INSTEAD
//
//  Created by Виктор on 09.03.15.
//
//

#import "Launcher.h"
#import "XMLDictionary.h"

@implementation Launcher
{
    IBOutlet UITableView *myTableView;
    NSDictionary* xmlDict;
    NSArray* namesArray;
    NSArray* urlArray;
}

- (void) viewDidLoad
{
    UIBarButtonItem *closeBtn = [[UIBarButtonItem alloc] initWithTitle:@"Закрыть" style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(close)];
    self.navigationItem.rightBarButtonItem = closeBtn;
    
    NSString* xmlUrl = @"http://instead-games.ru/xml.php";
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:xmlUrl]];
    xmlDict = [NSDictionary dictionaryWithXMLData:data];
    
    namesArray = [xmlDict valueForKeyPath:@"game.title"];
    urlArray = [xmlDict valueForKeyPath:@"game.url"];
}

- (void) close
{
    [self dismissViewControllerAnimated:YES completion:^{ }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return namesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cell_id = @"cell_id";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }

    cell.textLabel.text = namesArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"URL" message:urlArray[indexPath.row] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

@end
