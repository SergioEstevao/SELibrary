//
//  SEDemoIndexViewController.m
//  SELibrary
//
//  Created by Sérgio Estêvão on 13/09/2013.
//
//

#import "SEDemoIndexViewController.h"

@interface SEDemoIndexViewController ()

@property (nonatomic, strong) id<UITableViewDataSource> dataSource;
@end

@implementation SEDemoIndexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) loadView {

    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth + UIViewAutoresizingFlexibleHeight;
    self.view.autoresizesSubviews = YES;
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
	// Do any additional setup after loading the view.
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.dataSource = [[SEArrayDataSource alloc]
                       initWithSections:@[@"Section 1", @"Section 2"] 
                       items:@[@[@"Option 1", @"Option 2"], @[@"Option 3", @"Option 4"]] cellIdentifier:@"Cell" configureCellBlock:^(UITableViewCell *cell, id item) {
        cell.textLabel.text = [item description];        
    }];
    tableView.dataSource = self.dataSource;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth + UIViewAutoresizingFlexibleHeight;

    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
