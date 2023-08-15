//
//  CRIMManager+Conversation.m
//  CRIMSDK
//
//  Created by tom on 2023/2/16.
//

#import "CRIMManager+Conversation.h"
#import "CallbackProxy.h"

@implementation CRIMManager (Conversation)

- (void)getAllConversationListWithOnSuccess:(CRIMConversationsInfoCallback)onSuccess
                                  onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMConversationInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetAllConversationList(callback, [self operationId]);
}

- (void)getConversationListSplitWithOffset:(NSInteger)offset
                                     count:(NSInteger)count
                                 onSuccess:(CRIMConversationsInfoCallback)onSuccess
                                 onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMConversationInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetConversationListSplit(callback, [self operationId], offset, count);
}

- (void)getOneConversationWithSessionType:(CRIMConversationType)sessionType
                                 sourceID:(NSString *)sourceID
                                onSuccess:(CRIMConversationInfoCallback)onSuccess
                                onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMConversationInfo mj_objectWithKeyValues:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetOneConversation(callback, [self operationId], (int32_t)sessionType, sourceID);
}

- (void)getMultipleConversation:(NSArray<NSString *> *)ids
                      onSuccess:(CRIMConversationsInfoCallback)onSuccess
                      onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMConversationInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetMultipleConversation(callback, [self operationId], ids.mj_JSONString);
}

- (void)deleteConversationAndDeleteAllMsg:(NSString *)conversationID
                                onSuccess:(nullable CRIMSuccessCallback)onSuccess
                                onFailure:(nullable CRIMFailureCallback)onFailure {
    
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkDeleteConversationAndDeleteAllMsg(callback, [self operationId], conversationID);
}

- (void)clearConversationAndDeleteAllMsg:(NSString *)conversationID
                               onSuccess:(CRIMSuccessCallback)onSuccess
                               onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkClearConversationAndDeleteAllMsg(callback, [self operationId], conversationID);
}

- (void)deleteAllConversationFromLocalWithOnSuccess:(CRIMSuccessCallback)onSuccess
                                          onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkDeleteAllConversationFromLocal(callback, [self operationId]);
}

- (void)setConversationDraft:(NSString *)conversationID
                   draftText:(NSString *)draftText
                   onSuccess:(CRIMSuccessCallback)onSuccess
                   onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkSetConversationDraft(callback, [self operationId], conversationID, draftText);
}

- (void)pinConversation:(NSString *)conversationID
               isPinned:(BOOL)isPinned
              onSuccess:(CRIMSuccessCallback)onSuccess
              onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkPinConversation(callback, [self operationId], conversationID, isPinned);
}

- (void)getTotalUnreadMsgCountWithOnSuccess:(CRIMNumberCallback)onSuccess
                                  onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess(data.integerValue);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetTotalUnreadMsgCount(callback, [self operationId]);
}

- (void)getConversationRecvMsgOpt:(NSArray<NSString *> *)conversationIDs
                            onSuccess:(CRIMConversationNotDisturbInfoCallback)onSuccess
                            onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMConversationNotDisturbInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetConversationRecvMsgOpt(callback, [self operationId], conversationIDs.mj_JSONString);
}

- (void)setConversationRecvMsgOpt:(NSString *)conversationID
                               status:(CRIMReceiveMessageOpt)status
                            onSuccess:(CRIMSuccessCallback)onSuccess
                            onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkSetConversationRecvMsgOpt(callback, [self operationId], conversationID, status);
}

- (void)setConversationPrivateChat:(NSString *)conversationID
                            isPrivate:(BOOL)isPrivate
                            onSuccess:(CRIMSuccessCallback)onSuccess
                            onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkSetConversationPrivateChat(callback, [self operationId], conversationID, isPrivate);
}

- (void)setConversationBurnDuration:(NSString *)conversationID
                              duration:(NSInteger)burnDuration
                             onSuccess:(CRIMSuccessCallback)onSuccess
                             onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkSetConversationBurnDuration(callback, [self operationId], conversationID, (int32_t)burnDuration);
}

- (void)resetConversationGrpAtType:(NSString *)conversationID
                           onSuccess:(CRIMSuccessCallback)onSuccess
                           onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkResetConversationGrpAtType(callback, [self operationId], conversationID);
}

- (void)hideConversation:(NSString *)conversationID
               onSuccess:(CRIMSuccessCallback)onSuccess
               onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkHideConversation(callback, [self operationId], conversationID);
}

- (void)markConversationMsgAsRead:(NSString *)conversationID
                            onSuccess:(nullable CRIMSuccessCallback)onSuccess
                            onFailure:(nullable CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];

    Crim_sdkMarkConversationMsgAsRead(callback, [self operationId], conversationID);
}
@end
