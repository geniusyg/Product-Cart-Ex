//
//  ViewController.m
//  ProductCartEx
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "ProductCell.h"
#import "CartDelegate.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CartDelegate> {
	NSArray *data;
	NSMutableArray *cart;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController

- (void)addItem:(id)sender {
	UITableViewCell *cell = (UITableViewCell *)sender;
	NSIndexPath *indexPath = [self.table indexPathForCell:cell];
	Product *item = data[indexPath.row];
	
	[cart addObject:item];
	
	NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
	[self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return (0 == section) ? [data count] : [cart count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return (0 == section) ? @"상품목록" : @"장바구니";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if(0 == indexPath.section) {
		ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
		
		Product *item = data[indexPath.row];
		[cell setProductInfo:item];
		
		cell.delegate = self;
		
		return cell;
	} else {
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
		
		Product *item = cart[indexPath.row];
		cell.textLabel.text = item.name;
		return cell;
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	data = @[[Product product:@"Ball1" price:@"100" image:@"ball1.png"],
			 [Product product:@"Ball2" price:@"200" image:@"ball2.png"],
			 [Product product:@"Ball3" price:@"300" image:@"ball3.png"],
			 [Product product:@"IU" price:@"1000" image:@"002.jpg"]
			 ];
	
	cart = [[NSMutableArray alloc] init];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end






















