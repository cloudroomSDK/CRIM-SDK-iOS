//
//  CRIMManager+Friend.h
//  CRIMSDK
//
//  Created by tom on 2023/2/16.
//

#import "CRIMManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRIMManager (Friend)

/*
 * 添加朋友
 *
 * @param userID    对方userID
 * @param reqMessage 请求消息
 */
- (void)addFriend:(NSString *)userID
       reqMessage:(NSString * _Nullable)reqMessage
        onSuccess:(nullable CRIMSuccessCallback)onSuccess
        onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 获取收到的好友申请，既哪些人申请加我为好友
 */
- (void)getFriendReqListAsRecipientWithOnSuccess:(nullable CRIMFriendApplicationsCallback)onSuccess
                                    onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 发出的好友申请
 */
- (void)getFriendReqListAsApplicantWithOnSuccess:(nullable CRIMFriendApplicationsCallback)onSuccess
                                        onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 同意某人的好友申请
 * @param userID 用户id
 */
- (void)acceptFriendReq:(NSString *)userID
                      handleMsg:(NSString *)msg
              onSuccess:(nullable CRIMSuccessCallback)onSuccess
              onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 拒绝好友申请
 *
 * @param userID  用户ID
 */
- (void)refuseFriendReq:(NSString *)userID
                      handleMsg:(NSString *)msg
              onSuccess:(nullable CRIMSuccessCallback)onSuccess
              onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 加入黑名单
 *
 * @param userID  用户ID
 */
- (void)addToBlackList:(NSString *)userID
             onSuccess:(nullable CRIMSuccessCallback)onSuccess
             onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 黑名单
 *
 */
- (void)getBlackListWithOnSuccess:(nullable CRIMBlacksInfoCallback)onSuccess
                        onFailure:(nullable CRIMFailureCallback)onFailure;
/*
 * 移除黑名单
 *
 * @param userID  用户ID
 */
- (void)removeFromBlackList:(NSString *)userID
                  onSuccess:(nullable CRIMSuccessCallback)onSuccess
                  onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 获取指定好友列表的相关信息
 *
 * @param usersID 用户id列表
 */
- (void)getSpecifiedFriendsInfo:(NSArray <NSString *> *)usersID
                      onSuccess:(nullable CRIMFullUsersInfoCallback)onSuccess
                      onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 获取所有好友的相关信息
 */
- (void)getFriendListWithOnSuccess:(nullable CRIMFullUsersInfoCallback)onSuccess
                         onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 检查是否好友关系，即是否在登录用户的好友列表中。注意：好友是双向关系。
 * result为1表示好友（并且不是黑名单）
 *
 * @param uidList userID列表
*/
- (void)checkFriend:(NSArray <NSString *> *)usersID
          onSuccess:(nullable CRIMSimpleResultsCallback)onSuccess
          onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 设置好友备注
 *
 * @param uid 用户id
 * @param remark 备注信息
 */
- (void)setFriendRemark:(NSString *)uid
                 remark:(NSString * _Nullable)remark
              onSuccess:(nullable CRIMSuccessCallback)onSuccess
              onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 删除好友，好友是双向关系，此函数仅仅删除自己的好友
 *
 * @param friendUserID  好友ID
 */
- (void)deleteFriend:(NSString *)friendUserID
           onSuccess:(nullable CRIMSuccessCallback)onSuccess
           onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 *  本地搜索好友
 */
- (void)searchFriends:(CRIMSearchFriendsParam *)searchParam
            onSuccess:(nullable CRIMSearchUsersInfoCallback)onSuccess
            onFailure:(nullable CRIMFailureCallback)onFailure;
@end

NS_ASSUME_NONNULL_END
