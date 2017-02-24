//
//  NQMainViewController.m
//  YMDemo
//
//  Created by djk on 17/2/23.
//  Copyright © 2017年 NQ. All rights reserved.
//

#import "NQMainViewController.h"
#import "MBProgressHUD.h"
#import "UIImageView+WebCache.h"
#import "YMTool.h"

@interface NQMainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *wxLogBtn;
@property (weak, nonatomic) IBOutlet UIImageView *userIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@end

@implementation NQMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//点击微信登录
- (IBAction)wxLogBtnClick:(UIButton *)sender {
    [[YMTool sharedYMTool] ym_wxLoginResult:^(UMSocialUserInfoResponse *resp) {
        if (resp.uid) {
            [self showInfoWith:@"登录成功!"];
            //设置头像,名字
            [self.userIconImageView sd_setImageWithURL:[NSURL URLWithString:resp.iconurl]];
            self.userNameLabel.text = resp.name;
        }else{
            [self showInfoWith:@"登录失败!"];
        }
    }];
}

//点击微信分享
- (IBAction)wxShareBtnClick:(UIButton *)sender {
    [[YMTool sharedYMTool] ym_WXShare];
}

//显示状态弹框
- (void)showInfoWith:(NSString *)status{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = status;
    hud.yOffset = 50.f;
    [hud hideAnimated:YES afterDelay:3.0];
}


@end
