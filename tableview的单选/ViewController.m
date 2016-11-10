//
//  ViewController.m
//  tableview的单选
//
//  Created by Zhangguodong on 16/11/10.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/**
 * 选择的下表
 */
@property(nonatomic,assign)NSInteger index;

/**
 * tableview
 */
@property(nonatomic,strong)UITableView *tableview;

/**
 * 数据
 */
@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = 10;
    [self tableview];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.str = self.dataArr[indexPath.row];
    if (self.index == indexPath.row) {
        [cell setSelected:YES];
    }    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.index = indexPath.row;
    [self.tableview reloadData];
}



#pragma mark - tabelview
- (UITableView *)tableview {
    if (_tableview == nil) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [_tableview registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableview];
    }
    return _tableview;
}
#pragma mark - 数据
- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
        for (NSInteger i = 0; i < 100; i ++) {
            [_dataArr addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _dataArr;
}
@end
