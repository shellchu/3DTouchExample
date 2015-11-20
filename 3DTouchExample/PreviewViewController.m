//
//  PreviewViewController.m
//  3DTouchExample
//
//  Created by Shell.Chu on 2015/11/20.
//  Copyright © 2015年 Shell. All rights reserved.
//

#import "PreviewViewController.h"

@interface PreviewViewController ()

@end

@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//action sheet
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Action 1"
                                                          style:UIPreviewActionStyleDefault
                                                        handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                                                            NSLog(@"Action 1 selected");
                                                        }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Action 2"
                                                          style:UIPreviewActionStyleDestructive
                                                        handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                                                            NSLog(@"Action 2 selected");
                                                        }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"Action 3"
                                                          style:UIPreviewActionStyleSelected
                                                        handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                                                            NSLog(@"Action 3 selected");
                                                        }];
    NSArray* actions =@[action1,action2,action3];
    UIPreviewActionGroup *group1 = [UIPreviewActionGroup actionGroupWithTitle:@"Group 1"
                                                                        style:UIPreviewActionStyleDefault actions:actions];
    UIPreviewActionGroup *group2 = [UIPreviewActionGroup actionGroupWithTitle:@"Group 2"
                                                                        style:UIPreviewActionStyleDefault actions:actions];
    NSArray *returnArray = @[action1,group1,group2];
    
    return returnArray;
    
}
@end
