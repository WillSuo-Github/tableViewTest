//
//  Dog.h
//  tableViewTest
//
//  Created by ws on 16/4/5.
//  Copyright © 2016年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

/**
 姓名
 */
@property (nonatomic, copy) NSString *name;
/**
 儿子们
 */
@property (nonatomic, copy) NSArray<Dog *> *sons;
/**
 标记是否是第一级的元素
 */
@property (nonatomic, assign) NSInteger level;
/**
 标记是否被打开
 */
@property (nonatomic, assign) BOOL isOpen;

+ (instancetype)creatDogWithName:(NSString *)name sonsNameArr:(NSArray<NSString *> *)sonsNameArr;

@end
