//
//  ViewController.m
//  3DTouchExample
//
//  Created by Shell.Chu on 2015/11/18.
//  Copyright © 2015年 Shell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIViewControllerPreviewingDelegate>
@property (strong, nonatomic) IBOutlet UIView *touchView;
@property (strong, nonatomic) IBOutlet UILabel *touchLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    if ( self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        [self registerForPreviewingWithDelegate:self sourceView:self.touchView];
    }
}

//MARK: button action
- (IBAction)addShortcutItem:(id)sender
{
    NSArray <UIApplicationShortcutItem *> *existingShortcutItems = [[UIApplication sharedApplication] shortcutItems];
    NSMutableArray <UIApplicationShortcutItem *> *updatedShortcutItems = [existingShortcutItems mutableCopy];
    
    UIApplicationShortcutItem *aMutableShortcutItem = [[UIApplicationShortcutItem alloc] initWithType:@"type.new"
                                                                                              localizedTitle:@"New Title"
                                                                                           localizedSubtitle:@"New Subtitle"
                                                                                                        icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd]
                                                                                                    userInfo:nil];
    [updatedShortcutItems addObject:aMutableShortcutItem];
    [[UIApplication sharedApplication] setShortcutItems: updatedShortcutItems];
}


//MARK: touch action
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.touchView.backgroundColor = [UIColor colorWithRed:1
                                                     green:touch.force/touch.maximumPossibleForce
                                                      blue:0.5
                                                     alpha:1];
    [self.touchLabel setText:[NSString stringWithFormat:@"%.2f %%", (touch.force/touch.maximumPossibleForce)*100 ]];
}
@end
