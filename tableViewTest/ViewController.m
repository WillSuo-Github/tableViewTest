//
//  ViewController.m
//  tableViewTest
//
//  Created by ws on 16/3/29.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic, strong) NSMutableArray *sourceArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.sourceArr.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
static NSString *ID = @"CELL";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    Dog *dog = self.sourceArr[indexPath.row];
    if (dog.level == 1) {
        cell.textLabel.text = dog.name;
        cell.detailTextLabel.text = @"";
    }else{
        cell.textLabel.text = @"";
        cell.detailTextLabel.text = dog.name;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Dog *dog = self.sourceArr[indexPath.row];
    if (dog.level == 1) {
        
        if (dog.isOpen) {
            
            NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(indexPath.row + 1, dog.sons.count)];

            [self.sourceArr removeObjectsAtIndexes:set];
            
            for (Dog *tmp in self.sourceArr) {
                NSLog(@"%@",tmp.name);
            }
            
            NSMutableArray *tmpArr = [NSMutableArray array];
            for (int i = 0; i < dog.sons.count; ++i) {
                NSIndexPath *index = [NSIndexPath indexPathForRow:indexPath.row + i + 1 inSection:0];
                [tmpArr addObject:index];
            }

            [tableView deleteRowsAtIndexPaths:tmpArr withRowAnimation:UITableViewRowAnimationAutomatic];
            
        }else{
            
            NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(indexPath.row + 1, dog.sons.count)];
            [self.sourceArr insertObjects:dog.sons atIndexes:set];
            
            for (Dog *tmp in self.sourceArr) {
                NSLog(@"%@",tmp.name);
            }
            
            NSMutableArray *tmpArr = [NSMutableArray array];
            for (int i = 0; i < dog.sons.count; ++i) {
                NSIndexPath *index = [NSIndexPath indexPathForRow:indexPath.row + i + 1 inSection:0];
                [tmpArr addObject:index];
            }
            
            [tableView insertRowsAtIndexPaths:tmpArr withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
        dog.isOpen = !dog.isOpen;
    }
    
}



- (NSMutableArray *)sourceArr{
    
    if (_sourceArr == nil) {
        
        Dog *dog1 = [[Dog alloc] initWithName:@"二哈" sons:@[@"二哈1",@"二哈2",@"二哈3"]];
        Dog *dog2 = [[Dog alloc] initWithName:@"萨摩" sons:@[@"萨摩1",@"萨摩2",@"萨摩3",@"萨摩4",@"萨摩5",@"萨摩6"]];
        Dog *dog3 = [[Dog alloc] initWithName:@"泰迪" sons:@[@"泰迪1",@"泰迪2"]];
        
        _sourceArr = [NSMutableArray arrayWithArray:@[dog1,dog2,dog3]];
        
    }
    return _sourceArr;
}
@end
