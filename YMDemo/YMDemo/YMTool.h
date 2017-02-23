//
//  YMTool.h
//  YMDemo
//
//  Created by djk on 17/2/23.
//  Copyright © 2017年 NQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UShareUI/UShareUI.h>


@interface YMTool : NSObject
+ (instancetype)sharedYMTool;

//授权微信登录并获取用户信息
- (void)ym_wxLoginResult:(void(^)(UMSocialUserInfoResponse *resp))loginResult;
//微信分享
- (void)ym_WXShare;

@end
