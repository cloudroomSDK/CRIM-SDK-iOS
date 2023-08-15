//
//  CRIMManager+User.h
//  CRIMSDK
//
//  Created by tom on 2023/2/16.
//

#import "CRIMManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRIMManager (User)

/*
 * 根据uid批量查询用户信息
 *
 * @param uids 用户id列表
 */
- (void)getUsersInfo:(NSArray <NSString *> *)uids
           onSuccess:(nullable CRIMFullUsersInfoCallback)onSuccess
           onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 修改当前登录用户信息
 *
 */
- (void)setSelfInfo:(CRIMUserInfo *)userInfo
          onSuccess:(nullable CRIMSuccessCallback)onSuccess
          onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 当前登录用户信息
 *
 */
- (void)getSelfInfoWithOnSuccess:(nullable CRIMUserInfoCallback)onSuccess
                       onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 *   更新FMC token
 */
- (void)updateFcmToken:(NSString *)fmcToken
             onSuccess:(nullable CRIMSuccessCallback)onSuccess
             onFailure:(nullable CRIMFailureCallback)onFailure;
@end

NS_ASSUME_NONNULL_END
