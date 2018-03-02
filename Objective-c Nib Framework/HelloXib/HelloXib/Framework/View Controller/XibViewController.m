//
//  XibViewController.m
//  HelloXib
//
//  Created by Uran on 2018/2/12.
//  Copyright © 2018年 Uran. All rights reserved.
//

#import "XibViewController.h"
#import "HelloView.h"
#import "CusTableViewCell.h"
#import "TopViewControllerManager.h"

#import "define.h"

#define cellID @"Cell"
@interface XibViewController()

@property (weak, nonatomic) IBOutlet UIView *backView;
//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic,strong) HelloView * helloView;
@property (nonatomic,strong) UIViewController * topVC;
@property (nonatomic,strong) TopViewControllerManager * topVCManager;
@end

@implementation XibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor greenColor];
    
    self.backView.backgroundColor = [UIColor blueColor];
    _topVCManager = [TopViewControllerManager sharedInstance];
    
    // 取得 Bundle
    NSBundle * bundle = BundleSelf;
    // 從 bundle 中找出 image
    UIImage *img = [UIImage imageNamed:@"jobs.png" inBundle:bundle compatibleWithTraitCollection:nil];
    self.imageView.image = img;
    
    
    
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    
    // 使用 Bundle 管理 Xib
//    UINib * cusCellNib = [UINib nibWithNibName:@"CusTableViewCell" bundle:bundle];
//    [self.tableView registerNib:cusCellNib forCellReuseIdentifier:cellID];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _helloView = [[HelloView alloc] initWithFrame:CGRectMake(0, 0, _backView.frame.size.width, _backView.frame.size.height)];
    [self.backView addSubview:_helloView];
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    _helloView.frame = CGRectMake(0, 0, _backView.frame.size.width, _backView.frame.size.height);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public Function
+(void)showXibViewController{
    // 使用 Bundle 管理 Xib，判斷 path 是 nil 還是 不是nil 決定要 mainBundle 還是 self bundle
    NSBundle * bundle = BundleSelf;
    
    XibViewController * xibVC = [[XibViewController alloc] initWithNibName:@"XibViewController" bundle:bundle];
//    XibViewController * xibVC = [[XibViewController alloc] initWithNibName:@"XibViewController" bundle:nil];
    
    UIViewController * topVC = [TopViewControllerManager topViewController];
    if (topVC.navigationController != nil) {
        [topVC.navigationController pushViewController:xibVC animated:YES];
    }else{
        [topVC presentViewController:xibVC animated:YES completion:nil];
    }
}
#pragma mark - private Function

#pragma mark - Table View Delegate DataSource，現無法解決如何製成 Framework
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 20;
//}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
//    NSString * text = [NSString stringWithFormat:@"第%ld列",(long)indexPath.row];
//    CusTableViewCell * cusCell = (CusTableViewCell*)cell;
//    if (cusCell == nil) {
//        NSLog(@"cusCell is nil");
//        cell.textLabel.text = text;
//        return cell;
//    }
//    NSLog(@"cusCell is not nil");
////    cusCell.showLabel.text = text;
//    cusCell.backgroundColor = [UIColor purpleColor];
//    return cusCell;
//}

#pragma mark : Touch Delegate
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.topVC = [_topVCManager topViewController];
    if (self.topVC.navigationController != nil) {
        [self.topVC.navigationController popViewControllerAnimated:YES];
    }else{
        [self.topVC dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
