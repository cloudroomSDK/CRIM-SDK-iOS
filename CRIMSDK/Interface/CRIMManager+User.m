//
//  CRIMManager+User.m
//  CRIMSDK
//
//  Created by tom on 2023/2/16.
//

#import "CRIMManager+User.h"
#import "CallbackProxy.h"

@implementation CRIMManager (User)

- (void)getUsersInfo:(NSArray <NSString *> *)uids
           onSuccess:(CRIMFullUsersInfoCallback)onSuccess
           onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMFullUserInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetUsersInfo(callback, [self operationId], uids.mj_JSONString);
}

- (void)setSelfInfo:(CRIMUserInfo *)userInfo
          onSuccess:(CRIMSuccessCallback)onSuccess
          onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
        
    Crim_sdkSetSelfInfo(callback, [self operationId], userInfo.mj_JSONString);
}

- (void)getSelfInfoWithOnSuccess:(CRIMUserInfoCallback)onSuccess
                       onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMUserInfo mj_objectWithKeyValues:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetSelfUserInfo(callback, [self operationId]);
}

- (void)updateFcmToken:(NSString *)fmcToken
             onSuccess:(CRIMSuccessCallback)onSuccess
             onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
        
    Crim_sdkUpdateFcmToken(callback, [self operationId], fmcToken);
}
@end
