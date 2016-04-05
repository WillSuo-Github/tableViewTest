//
//  Dog.h
//  tableViewTest
//
//  Created by ws on 16/4/5.
//  Copyright © 2016年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *sons;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) BOOL isOpen;

- (instancetype)initWithName:(NSString *)name sons:(NSArray *)sons;

@end
