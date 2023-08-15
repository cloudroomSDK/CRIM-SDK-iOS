//
//  CRIMManager+Group.h
//  CRIMSDK
//
//  Created by tom on 2023/2/16.
//

#import "CRIMManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRIMManager (Group)

/*
 * 创建群
 *
 */
- (void)createGrp:(CRIMGroupCreateInfo *)groupBaseInfo
          onSuccess:(nullable CRIMGroupInfoCallback)onSuccess
          onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 申请加入群组
 *
 * @param gid    群组ID
 * @param reqMsg 进群申请消息
 * @param joinSource 进群方式
 */
- (void)joinGrp:(NSString *)groupID
           reqMsg:(NSString * _Nullable)reqMsg
       joinSource:(CRIMJoinType)joinSource
        onSuccess:(CRIMSuccessCallback)onSuccess
        onFailure:(CRIMFailureCallback)onFailure;

/*
 * 退群
 *
 */
- (void)quitGrp:(NSString *)groupID
        onSuccess:(nullable CRIMSuccessCallback)onSuccess
        onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 获取已加入的群列表
 *
 */
- (void)getJoinedGrpListWithOnSuccess:(nullable CRIMGroupsInfoCallback)onSuccess
                                onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 批量获取群资料
 *
 * @param gids 群ID集合
 */
- (void)getSpecifiedGrpsInfo:(NSArray <NSString *> *)groupsID
                     onSuccess:(nullable CRIMGroupsInfoCallback)onSuccess
                     onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 设置或更新群资料
 *
 */
- (void)setGrpInfo:(CRIMGroupInfo *)groupInfo
           onSuccess:(nullable CRIMSuccessCallback)onSuccess
           onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 获取群成员
 *
 * @param groupId 群组ID
 * @param filter  过滤成员，0不过滤，1群的创建者，2管理员；默认值0
 * @param offset  起始偏移
 * @param count   成员个数
 */
- (void)getGrpMemberList:(NSString *)groupID
                    filter:(CRIMGroupMemberFilter)filter
                    offset:(NSInteger)offset
                     count:(NSInteger)count
                 onSuccess:(nullable CRIMGroupMembersInfoCallback)onSuccess
                 onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 获取指定群成员列表
 *
 * @param groupId 群组ID
 * @param uidList 群成员ID
 * 
 **/
- (void)getSpecifiedGrpMembersInfo:(NSString *)groupID
                             usersID:(NSArray <NSString *> *)usersID
                           onSuccess:(nullable CRIMGroupMembersInfoCallback)onSuccess
                           onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 踢出群
 *
 * @param groupId 群组ID
 * @param reason  说明
 * @param uidList 被要踢出群的用户id列表
 */
- (void)kickGrpMember:(NSString *)groupID
                 reason:(NSString * _Nullable)reason
                usersID:(NSArray <NSString *> *)usersID
              onSuccess:(nullable CRIMSimpleResultsCallback)onSuccess
              onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 转让群主，只有群主能操作
 *
 * @param groupId  群组ID
 * @param uid  新群主用户ID
 */
- (void)transferGrpOwner:(NSString *)groupID
                  newOwner:(NSString *)userID
                 onSuccess:(nullable CRIMSuccessCallback)onSuccess
                 onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 邀请某些人进群，群里所有成员可以操作
 *
 * @param groupId 群组ID
 * @param uids 被邀请用户id列表
 * @param reason  邀请说明
 */
- (void)inviteUserToGrp:(NSString *)groupID
                   reason:(NSString *)reason
                  usersID:(NSArray <NSString *> *)usersID
                onSuccess:(nullable CRIMSimpleResultsCallback)onSuccess
                onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 作为群主或者管理员，获取收到的群成员申请进群列表。
 *
 */
- (void)getGrpReqListAsRecipientWithOnSuccess:(nullable CRIMGroupsApplicationCallback)onSuccess
                                              onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 发出的入群申请
 *
 */
- (void)getGrpReqListAsApplicantWithOnSuccess:(nullable CRIMGroupsApplicationCallback)onSuccess
                                              onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 管理员或者群主同意某人进入某群
 *
 * @param groupId   群ID
 * @param fromUserID 申请进群的用户ID
 * @param handleMsg   处理的消息
 */
- (void)acceptGrpReq:(NSString *)groupID
                    fromUserId:(NSString *)fromUserID
                     handleMsg:(NSString * _Nullable)handleMsg
                     onSuccess:(nullable CRIMSuccessCallback)onSuccess
                     onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 管理员或者群主拒绝某人进入某群
 *
 * @param groupId   群ID
 * @param fromUserID 申请进群的用户ID
 * @param handleMsg   处理的消息
 */
- (void)refuseGrpReq:(NSString *)groupID
                    fromUserId:(NSString *)fromUserID
                     handleMsg:(NSString * _Nullable)handleMsg
                     onSuccess:(nullable CRIMSuccessCallback)onSuccess
                     onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 解散群
 *
 * @param groupId   群ID
 */
- (void)dismissGrp:(NSString *)groupID
           onSuccess:(nullable CRIMSuccessCallback)onSuccess
           onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 *  禁言或取消禁言某群成员 mutedSeconds为0时取消禁言
 */
- (void)changeGrpMemberMute:(NSString *)groupID
                       userID:(NSString *)userID
                 mutedSeconds:(NSInteger)mutedSeconds
           onSuccess:(nullable CRIMSuccessCallback)onSuccess
           onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 *  禁言或取消禁言某群
 */
- (void)changeGrpMute:(NSString *)groupID
                 isMute:(BOOL)isMute
              onSuccess:(nullable CRIMSuccessCallback)onSuccess
              onFailure:(nullable CRIMFailureCallback)onFailure;


/*
 *  搜索群，通过群名称或者群ID
 */
- (void)searchGrps:(CRIMSearchGroupParam *)searchParam
           onSuccess:(nullable CRIMGroupsInfoCallback)onSuccess
           onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 *  设置群成员昵称
 */
- (void)setGrpMemberNickname:(NSString *)groupID
                        userID:(NSString *)userID
                 groupNickname:(NSString * _Nullable)groupNickname
                     onSuccess:(nullable CRIMSuccessCallback)onSuccess
                     onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 *  设置群成员级别
 */
- (void)setGrpMemberRoleLevel:(NSString *)groupID
                         userID:(NSString *)userID
                      roleLevel:(CRIMGroupMemberRole)roleLevel
                      onSuccess:(nullable CRIMSuccessCallback)onSuccess
                      onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 根据加入时间分页获取组成员列表
 @param groupID 群ID
 @param joinTimeBegin 加入开始时间
 @param joinTimeEnd 加入结束时间
 @param offset 开始下标
 @param count 总数
 */
- (void)getGrpMemberListByJoinTimeFilter:(NSString *)groupID
                                    offset:(NSInteger)offset
                                     count:(NSInteger)count
                             joinTimeBegin:(NSInteger)joinTimeBegin
                               joinTimeEnd:(NSInteger)joinTimeEnd
                          filterUserIDList:(NSArray <NSString *> *)filterUserIDList
                                 onSuccess:(nullable CRIMGroupMembersInfoCallback)onSuccess
                                 onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 进群验证设置选项
 @param groupID 群ID
 @param needVerification 进群设置
 */
- (void)setGrpVerification:(NSString *)groupID
            needVerification:(CRIMGroupVerificationType)needVerification
                   onSuccess:(nullable CRIMSuccessCallback)onSuccess
                   onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 获取管理者和拥有者
 @param groupID 群ID
 */
- (void)getGrpMemberOwnerAndAdmin:(NSString *)groupID
                          onSuccess:(nullable CRIMGroupMembersInfoCallback)onSuccess
                          onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 群成员之间是否可添加好友
 @param groupID 群ID
 @param rule 0: 默认可行 1: 不可行
 */
- (void)setGrpApplyMemberFriend:(NSString *)groupID
                             rule:(int32_t)rule
                          onSuccess:(nullable CRIMSuccessCallback)onSuccess
                          onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 查看群成员信息
 @param groupID 群ID
 @param rule 0: 默认可行 1: 不可行
 */
- (void)setGrpLookMemberInfo:(NSString *)groupID
                          rule:(int32_t)rule
                     onSuccess:(nullable CRIMSuccessCallback)onSuccess
                     onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 搜索群成员
 */
- (void)searchGrpMembers:(CRIMSearchGroupMembersParam *)searchParam
                 onSuccess:(nullable CRIMGroupMembersInfoCallback)onSuccess
                 onFailure:(nullable CRIMFailureCallback)onFailure;
@end

NS_ASSUME_NONNULL_END
