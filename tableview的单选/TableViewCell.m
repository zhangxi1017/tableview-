//
//  TableViewCell.m
//  tableview的单选
//
//  Created by Zhangguodong on 16/11/10.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *accessImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellSelected@2x.png"]];
        accessImageView.frame = CGRectMake(0, 0, 15, 15);
        self.accessoryView = accessImageView;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    self.accessoryView.hidden = !self.selected;
}

- (void)setStr:(NSString *)str {
    _str = str;
    self.textLabel.text = str;
}
@end
