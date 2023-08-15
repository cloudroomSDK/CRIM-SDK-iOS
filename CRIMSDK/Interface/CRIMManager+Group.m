//
//  CRIMManager+Group.m
//  CRIMSDK
//
//  Created by tom on 2023/2/16.
//

#import "CRIMManager+Group.h"
#import "CallbackProxy.h"

@implementation CRIMManager (Group)

- (void)createGrp:(CRIMGroupCreateInfo *)groupCreateInfo
          onSuccess:(CRIMGroupInfoCallback)onSuccess
          onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMGroupInfo mj_objectWithKeyValues:data]);
        }
    } onFailure:onFailure];
        
    Crim_sdkCreateGrp(callback, [self operationId], groupCreateInfo.mj_JSONString);
}

- (void)joinGrp:(NSString *)groupID
           reqMsg:(NSString *)reqMsg
       joinSource:(CRIMJoinType)joinSource
        onSuccess:(CRIMSuccessCallback)onSuccess
        onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkJoinGrp(callback, [self operationId], groupID, reqMsg ?: @"", joinSource);
}

- (void)quitGrp:(NSString *)groupID
        onSuccess:(CRIMSuccessCallback)onSuccess
        onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkQuitGrp(callback, [self operationId], groupID);
}


- (void)getJoinedGrpListWithOnSuccess:(CRIMGroupsInfoCallback)onSuccess
                              onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMGroupInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetJoinedGrpList(callback, [self operationId]);
}

- (void)getSpecifiedGrpsInfo:(NSArray <NSString *> *)groupsID
                     onSuccess:(nullable CRIMGroupsInfoCallback)onSuccess
                     onFailure:(nullable CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMGroupInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetSpecifiedGrpsInfo(callback, [self operationId], groupsID.mj_JSONString);
}

- (void)setGrpInfo:(CRIMGroupInfo *)info
           onSuccess:(CRIMSuccessCallback)onSuccess
           onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkSetGrpInfo(callback, [self operationId], info.mj_JSONString);
}

- (void)getGrpMemberList:(NSString *)groupID
                    filter:(CRIMGroupMemberFilter)filter
                    offset:(NSInteger)offset
                     count:(NSInteger)count
                 onSuccess:(CRIMGroupMembersInfoCallback)onSuccess
                 onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMGroupMemberInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetGrpMemberList(callback, [self operationId], groupID, (int32_t)filter, (int32_t)offset, (int32_t)count);
}

- (void)getSpecifiedGrpMembersInfo:(NSString *)groupID
                             usersID:(NSArray <NSString *> *)usersID
                           onSuccess:(nullable CRIMGroupMembersInfoCallback)onSuccess
                           onFailure:(nullable CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMGroupMemberInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    
    Crim_sdkGetSpecifiedGrpMembersInfo(callback, [self operationId], groupID, usersID.mj_JSONString);
}

- (void)kickGrpMember:(NSString *)groupID
                 reason:(NSString *)reason
                usersID:(NSArray <NSString *> *)usersID
              onSuccess:(CRIMSimpleResultsCallback)onSuccess
              onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMSimpleResultInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    
    Crim_sdkKickGrpMember(callback, [self operationId], groupID, reason ?: @"", usersID.mj_JSONString);
}

- (void)transferGrpOwner:(NSString *)groupID
                  newOwner:(NSString *)userID
                 onSuccess:(CRIMSuccessCallback)onSuccess
                 onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkTransferGrpOwner(callback, [self operationId], groupID, userID);
}

- (void)inviteUserToGrp:(NSString *)groupID
                   reason:(NSString *)reason
                  usersID:(NSArray <NSString *> *)usersID
                onSuccess:(CRIMSimpleResultsCallback)onSuccess
                onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMSimpleResultInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkInviteUserToGrp(callback, [self operationId], groupID, reason ?: @"", usersID.mj_JSONString);
}

- (void)getGrpReqListAsRecipientWithOnSuccess:(CRIMGroupsApplicationCallback)onSuccess
                                              onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMGroupApplicationInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetGrpReqListAsRecipient(callback, [self operationId]);
}

- (void)getGrpReqListAsApplicantWithOnSuccess:(CRIMGroupsApplicationCallback)onSuccess
                                              onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMGroupApplicationInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetGrpReqListAsApplicant(callback, [self operationId]);
}

- (void)acceptGrpReq:(NSString *)groupID
                    fromUserId:(NSString *)fromUserID
                     handleMsg:(NSString *)handleMsg
                     onSuccess:(CRIMSuccessCallback)onSuccess
                     onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkAcceptGrpReq(callback, [self operationId], groupID, fromUserID, handleMsg ?: @"");
}

- (void)refuseGrpReq:(NSString *)groupID
                    fromUserId:(NSString *)fromUserID
                     handleMsg:(NSString *)handleMsg
                     onSuccess:(CRIMSuccessCallback)onSuccess
                     onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkRefuseGrpReq(callback, [self operationId], groupID, fromUserID, handleMsg ?: @"");
}

- (void)dismissGrp:(NSString *)groupID
           onSuccess:(CRIMSuccessCallback)onSuccess
           onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkDismissGrp(callback, [self operationId], groupID);
}

- (void)changeGrpMemberMute:(NSString *)groupID
                       userID:(NSString *)userID
                 mutedSeconds:(NSInteger)mutedSeconds
                    onSuccess:(CRIMSuccessCallback)onSuccess
                    onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkChangeGrpMemberMute(callback, [self operationId], groupID, userID, mutedSeconds);
}

- (void)changeGrpMute:(NSString *)groupID
                 isMute:(BOOL)isMute
              onSuccess:(nullable CRIMSuccessCallback)onSuccess
              onFailure:(nullable CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkChangeGrpMute(callback, [self operationId], groupID, isMute);
}

- (void)searchGrps:(CRIMSearchGroupParam *)searchParam
           onSuccess:(CRIMGroupsInfoCallback)onSuccess
           onFailure:(CRIMFailureCallback)onFailure {
    
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMGroupInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkSearchGrps(callback, [self operationId], searchParam.mj_JSONString);
}

- (void)setGrpMemberNickname:(NSString *)groupID
                        userID:(NSString *)userID
                 groupNickname:(NSString *)groupNickname
                     onSuccess:(CRIMSuccessCallback)onSuccess
                     onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkSetGrpMemberNickname(callback, [self operationId], groupID, userID, groupNickname ?: @"");
}

- (void)setGrpMemberRoleLevel:(NSString *)groupID
                         userID:(NSString *)userID
                      roleLevel:(CRIMGroupMemberRole)roleLevel
                      onSuccess:(CRIMSuccessCallback)onSuccess
                      onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkSetGrpMemberRoleLevel(callback, [self operationId], groupID, userID, roleLevel);
}

- (void)getGrpMemberListByJoinTimeFilter:(NSString *)groupID
                                    offset:(NSInteger)offset
                                     count:(NSInteger)count
                             joinTimeBegin:(NSInteger)joinTimeBegin
                               joinTimeEnd:(NSInteger)joinTimeEnd
                          filterUserIDList:(NSArray <NSString *> *)filterUserIDList
                                 onSuccess:(CRIMGroupMembersInfoCallback)onSuccess
                                 onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMGroupMemberInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetGrpMemberListByJoinTimeFilter(callback, [self operationId], groupID, (int32_t)offset, (int32_t)count, joinTimeBegin, joinTimeEnd, filterUserIDList.mj_JSONString);
}

- (void)setGrpVerification:(NSString *)groupID
            needVerification:(CRIMGroupVerificationType)needVerification
                   onSuccess:(CRIMSuccessCallback)onSuccess
                   onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkSetGrpVerification(callback, [self operationId], groupID, (int32_t)needVerification);
}

- (void)getGrpMemberOwnerAndAdmin:(NSString *)groupID
                          onSuccess:(CRIMGroupMembersInfoCallback)onSuccess
                          onFailure:(CRIMFailureCallback)onFailure {
    
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMGroupMemberInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetGrpMemberOwnerAndAdmin(callback, [self operationId], groupID);
}

- (void)setGrpApplyMemberFriend:(NSString *)groupID
                             rule:(int32_t)rule
                        onSuccess:(nullable CRIMSuccessCallback)onSuccess
                        onFailure:(nullable CRIMFailureCallback)onFailure {
    
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkSetGrpApplyMemberFriend(callback, [self operationId], groupID, rule);
}

- (void)setGrpLookMemberInfo:(NSString *)groupID
                          rule:(int32_t)rule
                     onSuccess:(nullable CRIMSuccessCallback)onSuccess
                     onFailure:(nullable CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkSetGrpLookMemberInfo(callback, [self operationId], groupID, rule);
}

- (void)searchGrpMembers:(CRIMSearchParam *)searchParam
                 onSuccess:(CRIMGroupMembersInfoCallback)onSuccess
                 onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMGroupMemberInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkSearchGrpMembers(callback, [self operationId], searchParam.mj_JSONString);
}

@end
