//
//  CRIMManager+Friend.m
//  CRIMSDK
//
//  Created by tom on 2023/2/16.
//

#import "CRIMManager+Friend.h"
#import "CallbackProxy.h"

@implementation CRIMManager (Friend)

- (void)addFriend:(NSString *)userID
       reqMessage:(NSString *)reqMessage
        onSuccess:(CRIMSuccessCallback)onSuccess
        onFailure:(CRIMFailureCallback)onFailure {
    
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    NSDictionary *param = @{@"toUserID": userID, @"reqMsg": reqMessage ?: @""};
    Crim_sdkAddFriend(callback, [self operationId], param.mj_JSONString);
}

- (void)getFriendReqListAsRecipientWithOnSuccess:(CRIMFriendApplicationsCallback)onSuccess
                                    onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMFriendApplication mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    
    Crim_sdkGetFriendReqListAsRecipient(callback, [self operationId]);
}

- (void)getFriendReqListAsApplicantWithOnSuccess:(CRIMFriendApplicationsCallback)onSuccess
                                        onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMFriendApplication mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetFriendReqListAsApplicant(callback, [self operationId]);
}

- (void)acceptFriendReq:(NSString *)userID
                      handleMsg:(NSString *)msg
                      onSuccess:(CRIMSuccessCallback)onSuccess
                      onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    NSDictionary *param = @{@"toUserID": userID, @"handleMsg": msg ?: @""};
    Crim_sdkAcceptFriendReq(callback, [self operationId], param.mj_JSONString);
}

- (void)refuseFriendReq:(NSString *)userID
                      handleMsg:(NSString *)msg
                      onSuccess:(CRIMSuccessCallback)onSuccess
                      onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    NSDictionary *param = @{@"toUserID": userID, @"handleMsg": msg ?: @""};
    Crim_sdkRefuseFriendReq(callback, [self operationId], param.mj_JSONString);
}

- (void)addToBlackList:(NSString *)userID
             onSuccess:(CRIMSuccessCallback)onSuccess
             onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkAddBlack(callback, [self operationId], userID);
}

- (void)getBlackListWithOnSuccess:(CRIMBlacksInfoCallback)onSuccess
                        onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMBlackInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetBlackList(callback, [self operationId]);
}

- (void)removeFromBlackList:(NSString *)userID
                  onSuccess:(CRIMSuccessCallback)onSuccess
                  onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkRemoveBlack(callback, [self operationId], userID);
}

- (void)getSpecifiedFriendsInfo:(NSArray<NSString *> *)usersID
                      onSuccess:(CRIMFullUsersInfoCallback)onSuccess
                      onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMFullUserInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetSpecifiedFriendsInfo(callback, [self operationId], usersID.mj_JSONString);
}

- (void)getFriendListWithOnSuccess:(CRIMFullUsersInfoCallback)onSuccess
                         onFailure:(CRIMFailureCallback)onFailure {
    
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMFullUserInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetFriendList(callback, [self operationId]);
}

- (void)checkFriend:(NSArray<NSString *> *)usersID
          onSuccess:(CRIMSimpleResultsCallback)onSuccess
          onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMSimpleResultInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkCheckFriend(callback, [self operationId], usersID.mj_JSONString);
}

- (void)setFriendRemark:(NSString *)userID
                 remark:(NSString *)remark
              onSuccess:(CRIMSuccessCallback)onSuccess
              onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    NSDictionary *param = @{@"toUserID": userID, @"remark": remark ?: @""};
    Crim_sdkSetFriendRemark(callback, [self operationId], param.mj_JSONString);
}

- (void)deleteFriend:(NSString *)friendUserID
           onSuccess:(CRIMSuccessCallback)onSuccess onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkDeleteFriend(callback, [self operationId], friendUserID);
}

- (void)searchFriends:(CRIMSearchFriendsParam *)searchParam
            onSuccess:(nullable CRIMSearchUsersInfoCallback)onSuccess
            onFailure:(nullable CRIMFailureCallback)onFailure {
    
    assert(searchParam.isSearchRemark || searchParam.isSearchNickname || searchParam.isSearchUserID);
    
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMSearchFriendsInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkSearchFriends(callback, [self operationId], searchParam.mj_JSONString);
}
@end
