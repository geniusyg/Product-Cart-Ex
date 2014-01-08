//
//  CartDelegate.h
//  ProductCartEx
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CartDelegate <NSObject>
- (void)addItem:(id)sender;
- (void)plusItem:(id)sender;
- (void)minusItem:(id)sender;
@end
