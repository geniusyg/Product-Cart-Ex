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
	NSMutableArray *quan;
	int pindex;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController


- (void)plusItem:(id)sender {
	UITableViewCell *cell = (UITableViewCell *)sender;
	NSIndexPath *indexPath = [self.table indexPathForCell:cell];
	
	if(pindex==-1) {
		pindex = indexPath.row;
	}
	
	NSInteger n = [quan[pindex] integerValue];
	[quan removeObjectAtIndex:pindex];
	n++;
	[quan insertObject:[NSNumber numberWithInt:n] atIndex:pindex];
	
	pindex = -1;
	NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
	[self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)minusItem:(id)sender {
	UITableViewCell *cell = (UITableViewCell *)sender;
	NSIndexPath *indexPath = [self.table indexPathForCell:cell];
	
	NSInteger n = [quan[indexPath.row] integerValue];
	
	
	
	if(n==1) {
		[cart removeObjectAtIndex:indexPath.row];
		[quan removeObjectAtIndex:indexPath.row];
		NSArray *rows = [NSArray arrayWithObject:indexPath];
		[self.table deleteRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationAutomatic];
		return;
	}
	[quan removeObjectAtIndex:indexPath.row];
	n--;
	[quan insertObject:[NSNumber numberWithInt:n] atIndex:indexPath.row];
	
	
	NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
	[self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)addItem:(id)sender {
	UITableViewCell *cell = (UITableViewCell *)sender;
	NSIndexPath *indexPath = [self.table indexPathForCell:cell];
	Product *item = data[indexPath.row];
	int c = 0;
	for(int i=0; i<[cart count]; i++) {
		Product *tmp = cart[i];
		if([item.name isEqualToString:tmp.name]) {
			pindex = i;
			c++;
			break;
		}
	}
	
	if(c==0) {
	
		[cart addObject:item];
		[quan addObject:[NSNumber numberWithInt:1]];
	
		NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
		[self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
	} else {
		[self plusItem:sender];
	}
	
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
		ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
		
		Product *item = cart[indexPath.row];
		[cell setCart:item.name qu:[quan[indexPath.row] intValue]];
		cell.delegate = self;
		
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
	quan =[[NSMutableArray alloc] init];
	pindex = -1;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end






















