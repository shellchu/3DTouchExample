//
//  TableViewController.m
//  3DTouchExample
//
//  Created by Shell.Chu on 2015/11/20.
//  Copyright © 2015年 Shell. All rights reserved.
//

#import "TableViewController.h"
#import "PreviewViewController.h"
@interface TableViewController () <UIViewControllerPreviewingDelegate>


@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    }
    // Configure the cell...
    [cell.textLabel setText:[NSString stringWithFormat:@"section %ld row %ld",(long)indexPath.section,(long)indexPath.row]];
    return cell;
}

//MARK: Peek and pop

//peek
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell* )[previewingContext sourceView]];
    NSInteger row = indexPath.row;
//    NSLog(@"red %f",1.0/(row+1));
    PreviewViewController *previewController = [[PreviewViewController alloc] init];
    [previewController.view setBackgroundColor:[UIColor colorWithRed:1.0/(row+1) green:0.5 blue:0.7 alpha:1]];
    return previewController;
}

//pop
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}


@end
