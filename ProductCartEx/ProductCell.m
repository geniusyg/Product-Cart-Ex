//
//  ProductCell.m
//  ProductCartEx
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ProductCell.h"

@interface ProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UILabel *cartName;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;



@end

@implementation ProductCell
- (IBAction)plus:(id)sender {
	[self.delegate plusItem:self];
}
- (IBAction)minus:(id)sender {
	[self.delegate minusItem:self];
}

- (void)setProductInfo:(Product *)item {
	self.productName.text = item.name;
	self.productImage.image = [UIImage imageNamed:item.imageName];
	self.productPrice.text = item.price;
	
}

- (void)setCart:(NSString *)name qu:(NSInteger)n {
	self.cartName.text = name;
	self.quantityLabel.text = [NSString stringWithFormat:@"%d",n];
}


- (IBAction)addCart:(id)sender {
	[self.delegate addItem:self];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end






























