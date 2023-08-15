//
//  CRIMCallbacker+Closure.m
//  CRIMSDK
//
//  Created by tom on 2023/3/3.
//

#import "CRIMCallbacker+Closure.h"

@implementation CRIMCallbacker (Closure)

- (void)setConnListenerWithonConnecting:(CRIMVoidCallback)onConnecting
                       onConnectFailure:(CRIMFailureCallback)onConnectFailure
                       onConnectSuccess:(CRIMVoidCallback)onConnectSuccess
                        onKickedOffline:(CRIMVoidCallback)onKickedOffline
                     onUserTokenExpired:(CRIMVoidCallback)onUserTokenExpired {
    self.connecting = onConnecting;
    self.connectFailure = onConnectFailure;
    self.connectSuccess = onConnectSuccess;
    self.kickedOffline = onKickedOffline;
    self.userTokenExpired = onUserTokenExpired;
}

- (void)setConversationListenerWithOnSyncServerStart:(CRIMVoidCallback)onSyncServerStart
                                  onSyncServerFinish:(CRIMVoidCallback)onSyncServerFinish
                                  onSyncServerFailed:(CRIMVoidCallback)onSyncServerFailed
                               onConversationChanged:(CRIMConversationsInfoCallback)onConversationChanged
                                   onNewConversation:(CRIMConversationsInfoCallback)onNewConversation
                    onTotalUnreadMessageCountChanged:(CRIMNumberCallback)onTotalUnreadMessageCountChanged {
    self.syncServerStart = onSyncServerStart;
    self.syncServerFinish = onSyncServerFinish;
    self.syncServerFailed = onSyncServerFailed;
    self.onConversationChanged = onConversationChanged;
    self.onNewConversation = onNewConversation;
    self.onTotalUnreadMessageCountChanged = onTotalUnreadMessageCountChanged;
}

- (void)setFriendListenerWithOnBlackAdded:(CRIMBlackInfoCallback)onBlackAdded
                           onBlackDeleted:(CRIMBlackInfoCallback)onBlackDeleted
              onFriendApplicationAccepted:(CRIMFriendApplicationCallback)onFriendApplicationAccepted
                 onFriendApplicationAdded:(CRIMFriendApplicationCallback)onFriendApplicationAdded
               onFriendApplicationDeleted:(CRIMFriendApplicationCallback)onFriendApplicationDeleted
              onFriendApplicationRejected:(CRIMFriendApplicationCallback)onFriendApplicationRejected
                      onFriendInfoChanged:(CRIMFriendInfoCallback)onFriendInfoChanged
                            onFriendAdded:(CRIMFriendInfoCallback)onFriendAdded
                          onFriendDeleted:(CRIMFriendInfoCallback)onFriendDeleted {
    self.onBlackAdded = onBlackAdded;
    self.onBlackDeleted = onBlackDeleted;
    self.onFriendApplicationAccepted = onFriendApplicationAccepted;
    self.onFriendApplicationAdded = onFriendApplicationAdded;
    self.onFriendApplicationDeleted = onFriendApplicationDeleted;
    self.onFriendApplicationRejected = onFriendApplicationRejected;
    self.onFriendInfoChanged = onFriendInfoChanged;
    self.onFriendAdded = onFriendAdded;
    self.onFriendDeleted = onFriendDeleted;
}

- (void)setGroupListenerWithOnGroupInfoChanged:(CRIMGroupInfoCallback)onGroupInfoChanged
                            onJoinedGroupAdded:(CRIMGroupInfoCallback)onJoinedGroupAdded
                          onJoinedGroupDeleted:(CRIMGroupInfoCallback)onJoinedGroupDeleted
                            onGroupMemberAdded:(CRIMGroupMemberInfoCallback)onGroupMemberAdded
                          onGroupMemberDeleted:(CRIMGroupMemberInfoCallback)onGroupMemberDeleted
                      onGroupMemberInfoChanged:(CRIMGroupMemberInfoCallback)onGroupMemberInfoChanged
                       onGroupApplicationAdded:(CRIMGroupApplicationCallback)onGroupApplicationAdded
                     onGroupApplicationDeleted:(CRIMGroupApplicationCallback)onGroupApplicationDeleted
                    onGroupApplicationAccepted:(CRIMGroupApplicationCallback)onGroupApplicationAccepted
                    onGroupApplicationRejected:(CRIMGroupApplicationCallback)onGroupApplicationRejected
                              onGroupDismissed:(CRIMGroupInfoCallback)onGroupDismissed {
    self.onGroupInfoChanged = onGroupInfoChanged;
    self.onJoinedGroupAdded = onJoinedGroupAdded;
    self.onJoinedGroupDeleted = onJoinedGroupDeleted;
    self.onGroupMemberAdded = onGroupMemberAdded;
    self.onGroupMemberInfoChanged = onGroupMemberInfoChanged;
    self.onGroupApplicationAdded = onGroupApplicationAdded;
    self.onGroupApplicationDeleted = onGroupApplicationDeleted;
    self.onGroupApplicationAccepted = onGroupApplicationAccepted;
    self.onGroupApplicationRejected = onGroupApplicationRejected;
    self.onGroupDismissed = onGroupDismissed;
}

- (void)setAdvancedMsgListenerWithOnRecvMessageRevoked:(CRIMRevokedCallback)onRecvMessageRevoked
                                  onRecvC2CReadReceipt:(CRIMReceiptCallback)onRecvC2CReadReceipt
                                onRecvGroupReadReceipt:(CRIMReceiptCallback)onRecvGroupReadReceipt
                                      onRecvNewMessage:(CRIMMessageInfoCallback)onRecvNewMessage {
    
    self.onRecvMessageRevoked = onRecvMessageRevoked;
    self.onRecvC2CReadReceipt = onRecvC2CReadReceipt;
    self.onRecvGroupReadReceipt = onRecvGroupReadReceipt;
    self.onRecvNewMessage = onRecvNewMessage;
}

- (void)setSelfUserInfoUpdateListener:(CRIMUserInfoCallback)onUserInfoUpdate {
    self.onSelfInfoUpdated = onUserInfoUpdate;
}

- (void)setRecvCustomBusinessMessageListener:(CRIMObjectCallback)onRecvCustomBusinessMessage {
    self.onRecvCustomBusinessMessage = onRecvCustomBusinessMessage;
}

@end
