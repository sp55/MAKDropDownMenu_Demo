//
//  ViewController.m
//  MAKDropDownMenu_Demo
//
//  Created by admin on 2016/10/10.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"
#import "MAKDropDownMenu.h"//下拉控件


@interface ViewController ()<MAKDropDownMenuDelegate>
@property (strong, nonatomic) MAKDropDownMenu *menu;
@property(nonatomic)BOOL isUp;
@property(strong,nonatomic)UIButton *navBtn;
@property(strong,nonatomic)UIImageView *rowImg;//箭头

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView];
}
#pragma mark - initTitleView
-(void)initTitleView
{
    self.isUp = NO;
    
    
    self.navBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    self.navBtn.frame = CGRectMake(0, 0, 140, 30);
    [self.navBtn setTitle:@"我提交的" forState:UIControlStateNormal];

    [self.navBtn addTarget:self action:@selector(menuButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = self.navBtn;
    
    self.rowImg = [[UIImageView alloc] initWithFrame:CGRectMake(108, 12, 15, 8)];
    self.rowImg.image = [UIImage imageNamed: @"mycase_nav_triangle_down"];
    [self.navBtn addSubview:self.rowImg];
    
    self.menu = [[MAKDropDownMenu alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-70, CGRectGetMaxY(self.navigationController.navigationBar.frame)+1, 140, 44*3)];
    self.menu.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.menu.tintColor = [UIColor lightGrayColor];
    self.menu.titles = @[@"我提交的", @"我收到的",@"我上传的"];
    self.menu.separatorHeight = 1 / [UIScreen mainScreen].scale;
    self.menu.layer.masksToBounds = YES;
    self.menu.layer.cornerRadius = 5;
    //    self.menu.buttonsInsets = UIEdgeInsetsMake(1 / [UIScreen mainScreen].scale, 0, 0, 0);
    self.menu.delegate = self;
    [self.navigationController.view addSubview:self.menu];
    
}
-(void)menuButtonDidClick:(UIButton *)btn
{
    self.isUp = !self.isUp;
    self.rowImg.image = [UIImage imageNamed:self.isUp?@"mycase_nav_triangle_up": @"mycase_nav_triangle_down"];
    
    if (self.menu.isOpen) {
        [self closeMenu];
    } else {
        [self openMenu];
    }
}
- (void)closeMenu {
    [self.menu closeAnimated:YES];
}
- (void)openMenu {
    [self.menu openAnimated:YES];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.menu removeFromSuperview];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.view addSubview:self.menu];
}
#pragma mark - MAKDropDownMenuDelegate
- (void)dropDownMenu:(MAKDropDownMenu *)menu itemDidSelect:(NSUInteger)itemIndex {
    
    self.isUp = !self.isUp;
    self.rowImg.image = [UIImage imageNamed:self.isUp?@"mycase_nav_triangle_up": @"mycase_nav_triangle_down"];
    
    switch (itemIndex) {
        case 0:
            [self.navBtn setTitle:@"我提交的" forState:UIControlStateNormal];
            break;
        case 1:
            [self.navBtn setTitle:@"我收到的" forState:UIControlStateNormal];
            break;
        case 2:
            [self.navBtn setTitle:@"我上传的" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    [self closeMenu];
    

}

- (void)dropDownMenuDidTapOutsideOfItem:(MAKDropDownMenu *)menu {
    [self closeMenu];
}


//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    [self closeMenu];
//}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self closeMenu];
//}

@end
