//
//  Dog.m
//  tableViewTest
//
//  Created by ws on 16/4/5.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (instancetype)initWithName:(NSString *)name sons:(NSArray *)sons{
    
    NSMutableArray *tmpArr = [NSMutableArray array];
    for (NSString *str in sons) {
        Dog *d = [[Dog alloc] init];
        d.name = str;
        d.level = 2;
        d.isOpen = NO;
        [tmpArr addObject:d];
    }
    
    Dog *d = [[Dog alloc] init];
    d.name = name;
    d.sons = tmpArr;
    d.level = 1;
    d.isOpen = NO;
    return d;
}

@end
