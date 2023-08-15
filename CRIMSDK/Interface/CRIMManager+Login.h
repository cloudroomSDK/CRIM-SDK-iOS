//
//  CRIMManager+Login.h
//  CRIMSDK
//
//  Created by tom on 2023/2/16.
//

#import "CRIMManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRIMManager (Login)

#pragma mark -
#pragma mark - Login

/*
 * 登录
 *
 * @param uid   用户ID
 *              uid来自于自身业务服务器
 * @param token 用户token
 *              token需要业务服务器向OpenIM服务端交换获取。
 */
- (void)login:(NSString *)uid
        token:(NSString *)token
    onSuccess:(nullable CRIMSuccessCallback)onSuccess
    onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 * 获取登录状态
 *
 * Logout   = 1
 * Logging = 2
 * Logged  = 3
 */
- (NSInteger)getLoginStatus;

/*
 * 登出
 *
 */
- (void)logoutWithOnSuccess:(nullable CRIMSuccessCallback)onSuccess
                  onFailure:(nullable CRIMFailureCallback)onFailure;

@end

NS_ASSUME_NONNULL_END
