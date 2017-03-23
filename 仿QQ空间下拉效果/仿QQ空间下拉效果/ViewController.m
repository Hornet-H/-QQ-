//
//  ViewController.m
//  仿QQ空间下拉效果
//
//  Created by 黄来峰 on 2017/3/23.
//  Copyright © 2017年 com.gmw.love. All rights reserved.
//


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic )UITableView *customTableView;
@property(strong,nonatomic )UIImageView *imageView;
@property(strong,nonatomic )UIVisualEffectView *effectView;
@property(strong,nonatomic )UIImage *image;
@property(strong,nonatomic )NSArray *dataSOurceArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self instaceSubviews];
}

#pragma mark:instanceSubviews
- (void)instaceSubviews{
    
    self.image = [UIImage imageNamed:@"beautifulGirl"];
    
    self.imageView = ({
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -220, kScreenWidth, 220)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        //        imageView.
        imageView.clipsToBounds = YES;
        imageView.image = self.image;
        imageView;
    });
   
    
    
    
    self.customTableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        tableView.contentInset = UIEdgeInsetsMake(_imageView.bounds.size.height, 0, 0, 0);
        
        [tableView addSubview:self.imageView];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView;
        
    });
    
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    self.effectView = [[UIVisualEffectView alloc]initWithEffect:effect];
    self.effectView.frame = self.imageView.frame;
    self.effectView.alpha = 0;
    [self.customTableView addSubview:self.effectView];
    [self.customTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
    [self.view addSubview:self.customTableView];
}
#pragma UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat off_y = scrollView.contentOffset.y;
    CGRect frame = self.imageView.frame;
    
    self.imageView.frame = CGRectMake(0, off_y, frame.size.width, -off_y);
    self.effectView.frame = CGRectMake(0, off_y, frame.size.width, -off_y);
    NSLog(@"%zd",(off_y + self.imageView.frame.size.height) / kScreenHeight);
    self.effectView.alpha = (self.imageView.frame.size.height) / 200 - 1 ;
}
#pragma mark:UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSOurceArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    
    cell.textLabel.text = self.dataSOurceArr[indexPath.row];
    return cell;
}

- (NSArray *)dataSOurceArr{
    if (!_dataSOurceArr) {
        _dataSOurceArr = @[@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试",@"我的测试"];
    }
    return _dataSOurceArr;
}
#pragma mark:UITableViewDataSource


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
