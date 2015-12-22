//
//  ViewController.m
//  Demo
//
//  Created by 123 on 15/12/19.
//  Copyright © 2015年 haibin. All rights reserved.
//

#import "ViewController.h"

#import "UINavigationBar+BackgroundColor.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate> {
    UIImageView *imageView;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *superView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *color = [UIColor redColor];
    [self.navigationController.navigationBar H_setBackgroundColor:[color colorWithAlphaComponent:0]];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc]init];

    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.backIndicatorImage = [[UIImage alloc] init];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor orangeColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    _superView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    imageView= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 300)];
    imageView.image = [UIImage imageNamed:@"image"];
  //  [_superView addSubview:imageView];
   // [self.tableView addSubview:imageView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat contentOffSet = scrollView.contentOffset.y;
    [self abbbb:contentOffSet];

    UIColor *color = [UIColor redColor];
    
    if (contentOffSet > 0) {
        CGFloat alpha = 1 - (64 - contentOffSet)/64;
//        
//        self.navigationController.navigationBar.backgroundColor = [color colorWithAlphaComponent:alpha];
       [self.navigationController.navigationBar H_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
      
    } else {
//        self.navigationController.navigationBar.backgroundColor = [color colorWithAlphaComponent:0];
        [self.navigationController.navigationBar H_setBackgroundColor:[color colorWithAlphaComponent:0]];
        self.navigationController.navigationBar.shadowImage = [[UIImage alloc]init];
        //self.navigationController.navigationBar.translucent = NO;

    }
    [self abbbb:contentOffSet];

}

- (void)abbbb:(CGFloat)yOffset{
    CGFloat xOffset = (yOffset + 300) / 2;
    
    if (yOffset < - 300) {
        CGRect f = imageView.frame;
        
        f.origin.y = yOffset;
        
        f.size.height = -yOffset;
        
        f.origin.x = xOffset;
        
        f.size.width = self.view.frame.size.width+ fabs(xOffset) * 2;
        
        imageView.frame = f;
    }
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 10;
//}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section  {
//    return [NSString stringWithFormat:@"%ld",(long)section];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

//- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
//    NSLog(@"%ld",section);
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return section == 0? 0 : 20;
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
   // cell.contentView.backgroundColor = [UIColor cyanColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
