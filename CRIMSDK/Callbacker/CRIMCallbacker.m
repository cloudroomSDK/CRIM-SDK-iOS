//
//  CRIMCallbacker.m
//  CRIMSDK
//
//  Created by x on 2021/2/11.
//

#import "CRIMCallbacker.h"
#import "CRIMGCDMulticastDelegate.h"

@interface CRIMCallbacker ()
@property (nonatomic, strong) CRIMGCDMulticastDelegate <CRIMSDKListener> *sdkListeners;
@property (nonatomic, strong) CRIMGCDMulticastDelegate <CRIMFriendshipListener> *friendshipListeners;
@property (nonatomic, strong) CRIMGCDMulticastDelegate <CRIMGroupListener> *grpListeners;
@property (nonatomic, strong) CRIMGCDMulticastDelegate <CRIMConversationListener> *conversationListeners;
@property (nonatomic, strong) CRIMGCDMulticastDelegate <CRIMAdvancedMsgListener> *advancedMsgListeners;
@property (nonatomic, strong) CRIMGCDMulticastDelegate <CRIMCustomBusinessListener> *customBusinessListeners;

@end

@implementation CRIMCallbacker

+ (instancetype)callbacker {
    return [CRIMCallbacker new];
}

- (void)setListener {
    Crim_sdkSetConnListener(self);
    Crim_sdkSetUserListener(self);
    Crim_sdkSetFriendListener(self);
    Crim_sdkSetGrpListener(self);
    Crim_sdkSetConversationListener(self);
    Crim_sdkSetAdvancedMsgListener(self);
    Crim_sdkSetCustomBusinessListener(self);
}

- (void)dispatchMainThread:(void (NS_NOESCAPE ^)(void))todo {
    if ([NSThread isMainThread]) {
        todo();
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            todo();
        });
    }
}

#pragma mark -
#pragma mark - Listeners getter

- (CRIMGCDMulticastDelegate<CRIMSDKListener> *)sdkListeners {
    if (_sdkListeners == nil) {
        _sdkListeners = (CRIMGCDMulticastDelegate <CRIMSDKListener> *)[[CRIMGCDMulticastDelegate alloc] init];
    }
    return _sdkListeners;
}

- (CRIMGCDMulticastDelegate<CRIMFriendshipListener> *)friendshipListeners {
    if (_friendshipListeners == nil) {
        _friendshipListeners = (CRIMGCDMulticastDelegate <CRIMFriendshipListener> *)[[CRIMGCDMulticastDelegate alloc] init];
    }
    return _friendshipListeners;
}

- (CRIMGCDMulticastDelegate<CRIMGroupListener> *)grpListeners {
    if (_grpListeners == nil) {
        _grpListeners = (CRIMGCDMulticastDelegate <CRIMGroupListener> *)[[CRIMGCDMulticastDelegate alloc] init];
    }
    return _grpListeners;
}

- (CRIMGCDMulticastDelegate<CRIMConversationListener> *)conversationListeners {
    if (_conversationListeners == nil) {
        _conversationListeners = (CRIMGCDMulticastDelegate <CRIMConversationListener> *)[[CRIMGCDMulticastDelegate alloc] init];
    }
    return _conversationListeners;
}

- (CRIMGCDMulticastDelegate<CRIMAdvancedMsgListener> *)advancedMsgListeners {
    if (_advancedMsgListeners == nil) {
        _advancedMsgListeners = (CRIMGCDMulticastDelegate <CRIMAdvancedMsgListener> *)[[CRIMGCDMulticastDelegate alloc] init];
    }
    return _advancedMsgListeners;
}

- (CRIMGCDMulticastDelegate<CRIMCustomBusinessListener> *)customBusinessListeners {
    if (_customBusinessListeners == nil) {
        _customBusinessListeners = (CRIMGCDMulticastDelegate <CRIMCustomBusinessListener> *)[[CRIMGCDMulticastDelegate alloc] init];
    }
    return _customBusinessListeners;
}

#pragma mark -
#pragma mark - Add/Remove listener

- (void)addIMSDKListener:(id<CRIMSDKListener>)listener {
    [self.sdkListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeIMSDKListener:(id<CRIMSDKListener>)listener {
    [self.sdkListeners removeDelegate:listener];
}

- (void)addFriendListener:(id<CRIMFriendshipListener>)listener {
    [self.friendshipListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeFriendListener:(id<CRIMFriendshipListener>)listener {
    [self.friendshipListeners removeDelegate:listener];
}

- (void)addGroupListener:(id<CRIMGroupListener>)listener {
    [self.grpListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeGroupListener:(id<CRIMGroupListener>)listener {
    [self.grpListeners removeDelegate:listener];
}

- (void)addConversationListener:(id<CRIMConversationListener>)listener {
    [self.conversationListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeConversationListener:(id<CRIMConversationListener>)listener {
    [self.conversationListeners removeDelegate:listener];
}

- (void)addAdvancedMsgListener:(id<CRIMAdvancedMsgListener>)listener {
    [self.advancedMsgListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeAdvancedMsgListener:(id<CRIMAdvancedMsgListener>)listener {
    [self.advancedMsgListeners removeDelegate:listener];
}

- (void)addCustomBusinessListener:(id<CRIMCustomBusinessListener>)listener {
    [self.customBusinessListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeCustomBusinessListener:(id<CRIMCustomBusinessListener>)listener {
    [self.customBusinessListeners removeDelegate:listener];
}

#pragma mark -
#pragma mark - Connection

- (void)onConnectFailed:(int32_t)errCode errMsg:(NSString * _Nullable)errMsg {
    
    [self dispatchMainThread:^{
        if (self.connectFailure) {
            self.connectFailure(errCode, errMsg);
        }
        
        [self.sdkListeners onConnectFailed:errCode err:errMsg];
    }];
}

- (void)onConnectSuccess {
    [self dispatchMainThread:^{
        if (self.connectSuccess) {
            self.connectSuccess();
        }
        
        [self.sdkListeners onConnectSuccess];
    }];
}

- (void)onConnecting {
    [self dispatchMainThread:^{
        if (self.connecting) {
            self.connecting();
        }

        [self.sdkListeners onConnecting];
    }];
}

- (void)onKickedOffline {
    [self dispatchMainThread:^{
        if (self.kickedOffline) {
            self.kickedOffline();
        }
        
        [self.sdkListeners onKickedOffline];
    }];
}

- (void)onUserTokenExpired {
    [self dispatchMainThread:^{
        if (self.userTokenExpired) {
            self.userTokenExpired();
        }

        [self.sdkListeners onUserTokenExpired];
    }];
}

#pragma mark -
#pragma mark - User

- (void)onSelfInfoUpdated:(NSString * _Nullable)userInfo {
    
    [self dispatchMainThread:^{
        if (self.onSelfInfoUpdated) {
            self.onSelfInfoUpdated([CRIMUserInfo mj_objectWithKeyValues:userInfo]);
        }
    }];
}

#pragma mark -
#pragma mark - Friend

- (void)onFriendReqAdded:(NSString * _Nullable)friendApplication {
    CRIMFriendApplication *info = [CRIMFriendApplication mj_objectWithKeyValues:friendApplication];
    
    [self dispatchMainThread:^{
        if (self.onFriendApplicationAdded) {
            self.onFriendApplicationAdded(info);
        }
        [self.friendshipListeners onFriendApplicationAdded:info];
    }];
}

- (void)onFriendReqRejected:(NSString * _Nullable)friendApplication {
    CRIMFriendApplication *info = [CRIMFriendApplication mj_objectWithKeyValues:friendApplication];
    
    [self dispatchMainThread:^{
        if (self.onFriendApplicationRejected) {
            self.onFriendApplicationRejected(info);
        }
        [self.friendshipListeners onFriendApplicationRejected:info];
    }];
}

- (void)onFriendReqAccepted:(NSString * _Nullable)friendApplication {
    CRIMFriendApplication *info = [CRIMFriendApplication mj_objectWithKeyValues:friendApplication];
    
    [self dispatchMainThread:^{
        if (self.onFriendApplicationAccepted) {
            self.onFriendApplicationAccepted(info);
        }
        [self.friendshipListeners onFriendApplicationAccepted:info];
    }];
}

- (void)onFriendReqDeleted:(NSString * _Nullable)friendApplication {
    CRIMFriendApplication *info = [CRIMFriendApplication mj_objectWithKeyValues:friendApplication];

    [self dispatchMainThread:^{
        if (self.onFriendApplicationDeleted) {
            self.onFriendApplicationDeleted(info);
        }
        [self.friendshipListeners onFriendApplicationDeleted:info];
    }];
}

- (void)onFriendAdded:(NSString * _Nullable)friendInfo {
    CRIMFriendInfo *info = [CRIMFriendInfo mj_objectWithKeyValues:friendInfo];
    
    [self dispatchMainThread:^{
        if (self.onFriendAdded) {
            self.onFriendAdded(info);
        }
        [self.friendshipListeners onFriendAdded:info];
    }];
}

- (void)onFriendDeleted:(NSString * _Nullable)friendInfo {
    CRIMFriendInfo *info = [CRIMFriendInfo mj_objectWithKeyValues:friendInfo];
    
    [self dispatchMainThread:^{
        if (self.onFriendDeleted) {
            self.onFriendDeleted(info);
        }
        [self.friendshipListeners onFriendDeleted:info];
    }];
}

- (void)onFriendInfoChanged:(NSString * _Nullable)friendInfo {
    CRIMFriendInfo *info = [CRIMFriendInfo mj_objectWithKeyValues:friendInfo];
    
    [self dispatchMainThread:^{
        if (self.onFriendInfoChanged) {
            self.onFriendInfoChanged(info);
        }
        [self.friendshipListeners onFriendInfoChanged:info];
    }];
}

- (void)onBlackAdded:(NSString* _Nullable)blackInfo {
    CRIMBlackInfo *info = [CRIMBlackInfo mj_objectWithKeyValues:blackInfo];
    
    [self dispatchMainThread:^{
        if (self.onBlackAdded) {
            self.onBlackAdded(info);
        }
        [self.friendshipListeners onBlackAdded:info];
    }];
}

- (void)onBlackDeleted:(NSString * _Nullable)blackInfo {
    CRIMBlackInfo *info = [CRIMBlackInfo mj_objectWithKeyValues:blackInfo];
    
    [self dispatchMainThread:^{
        if (self.onBlackDeleted) {
            self.onBlackDeleted(info);
        }
        [self.friendshipListeners onBlackDeleted:info];
    }];
}

#pragma mark -
#pragma mark - Group

- (void)onGrpMemberAdded:(NSString * _Nullable)groupMemberInfo {
    CRIMGroupMemberInfo *info = [CRIMGroupMemberInfo mj_objectWithKeyValues:groupMemberInfo];
    
    [self dispatchMainThread:^{
        if (self.onGroupMemberAdded) {
            self.onGroupMemberAdded(info);
        }
        [self.grpListeners onGroupMemberAdded:info];
    }];
}

- (void)onGrpMemberDeleted:(NSString * _Nullable)groupMemberInfo {
    CRIMGroupMemberInfo *info = [CRIMGroupMemberInfo mj_objectWithKeyValues:groupMemberInfo];
    
    [self dispatchMainThread:^{
        if (self.onGroupMemberDeleted) {
            self.onGroupMemberDeleted(info);
        }
        
        [self.grpListeners onGroupMemberDeleted:info];
    }];
}

- (void)onGrpMemberInfoChanged:(NSString * _Nullable)groupMemberInfo {
    CRIMGroupMemberInfo *info = [CRIMGroupMemberInfo mj_objectWithKeyValues:groupMemberInfo];
    
    [self dispatchMainThread:^{
        if (self.onGroupMemberInfoChanged) {
            self.onGroupMemberInfoChanged(info);
        }
        
        [self.grpListeners onGroupMemberInfoChanged:info];
    }];
}

- (void)onGrpInfoChanged:(NSString * _Nullable)groupInfo {
    CRIMGroupInfo *info = [CRIMGroupInfo mj_objectWithKeyValues:groupInfo];

    [self dispatchMainThread:^{
        if (self.onGroupInfoChanged) {
            self.onGroupInfoChanged(info);
        }

        [self.grpListeners onGroupInfoChanged:info];
    }];
}

- (void)onJoinedGrpAdded:(NSString * _Nullable)groupInfo {
    CRIMGroupInfo *info = [CRIMGroupInfo mj_objectWithKeyValues:groupInfo];
    
    [self dispatchMainThread:^{
        if (self.onJoinedGroupAdded) {
            self.onJoinedGroupAdded(info);
        }
        
        [self.grpListeners onJoinedGroupAdded:info];
    }];
}

- (void)onJoinedGrpDeleted:(NSString * _Nullable)groupInfo {
    CRIMGroupInfo *info = [CRIMGroupInfo mj_objectWithKeyValues:groupInfo];
    
    [self dispatchMainThread:^{
        if (self.onJoinedGroupDeleted) {
            self.onJoinedGroupDeleted(info);
        }

        [self.grpListeners onJoinedGroupDeleted:info];
    }];
}

- (void)onGrpReqAccepted:(NSString * _Nullable)groupApplication {
    CRIMGroupApplicationInfo *info = [CRIMGroupApplicationInfo mj_objectWithKeyValues:groupApplication];
    
    [self dispatchMainThread:^{
        if (self.onGroupApplicationAccepted) {
            self.onGroupApplicationAccepted(info);
        }
        
        [self.grpListeners onGroupApplicationAccepted:info];
    }];
}

- (void)onGrpReqAdded:(NSString * _Nullable)groupApplication {
    CRIMGroupApplicationInfo *info = [CRIMGroupApplicationInfo mj_objectWithKeyValues:groupApplication];
    
    [self dispatchMainThread:^{
        if (self.onGroupApplicationAdded) {
            self.onGroupApplicationAdded(info);
        }

        [self.grpListeners onGroupApplicationAdded:info];
    }];
}

- (void)onGrpReqDeleted:(NSString * _Nullable)groupApplication {
    CRIMGroupApplicationInfo *info = [CRIMGroupApplicationInfo mj_objectWithKeyValues:groupApplication];
    
    [self dispatchMainThread:^{
        if (self.onGroupApplicationDeleted) {
            self.onGroupApplicationDeleted(info);
        }

        [self.grpListeners onGroupApplicationDeleted:info];
    }];
}

- (void)onGrpReqRejected:(NSString * _Nullable)groupApplication {
    CRIMGroupApplicationInfo *info = [CRIMGroupApplicationInfo mj_objectWithKeyValues:groupApplication];
    
    [self dispatchMainThread:^{
        if (self.onGroupApplicationRejected) {
            self.onGroupApplicationRejected(info);
        }
        
        [self.grpListeners onGroupApplicationRejected:info];
    }];
}

- (void)onGrpDismissed:(NSString *)groupInfo {
    CRIMGroupInfo *info = [CRIMGroupInfo mj_objectWithKeyValues:groupInfo];
    
    [self dispatchMainThread:^{
        if (self.onGroupDismissed) {
            self.onGroupDismissed(info);
        }

        [self.grpListeners onGroupDismissed:info];
    }];
}

#pragma mark -
#pragma mark - Message

- (void)onMsgDeleted:(NSString *)message {
    CRIMMessageInfo *msg = [CRIMMessageInfo mj_objectWithKeyValues:message];

    [self dispatchMainThread:^{
        if (self.onMessageDeleted) {
            self.onMessageDeleted(msg);
        }
        
        [self.advancedMsgListeners onMsgDeleted:msg];
    }];
}

- (void)onNewRecvMsgRevoked:(NSString *)messageRevoked {
    
    CRIMMessageRevokedInfo *revoked = [CRIMMessageRevokedInfo mj_objectWithKeyValues:messageRevoked];
    
    [self dispatchMainThread:^{
        if (self.onRecvMessageRevoked) {
            self.onRecvMessageRevoked(revoked);
        }
        
        [self.advancedMsgListeners onRecvMessageRevoked:revoked];
    }];
}

- (void)onRecv1v1ReadReceipt:(NSString * _Nullable)msgReceiptList {
    NSArray *receipts = [CRIMReceiptInfo mj_objectArrayWithKeyValuesArray:msgReceiptList];
    
    [self dispatchMainThread:^{
        if (self.onRecvC2CReadReceipt) {
            self.onRecvC2CReadReceipt(receipts);
        }

        [self.advancedMsgListeners onRecvC2CReadReceipt:receipts];
    }];
}

- (void)onRecvGrpReadReceipt:(NSString* _Nullable)groupMsgReceiptList {
    NSArray *receipts = [CRIMReceiptInfo mj_objectArrayWithKeyValuesArray:groupMsgReceiptList];
    
    [self dispatchMainThread:^{
        if (self.onRecvGroupReadReceipt) {
            self.onRecvGroupReadReceipt(receipts);
        }
        
        [self.advancedMsgListeners onRecvGroupReadReceipt:receipts];
    }];
}

- (void)onRecvMsgExtensionsAdded:(NSString* _Nullable)msgID reactionExtensionList:(NSString* _Nullable)reactionExtensionList {
    
}

- (void)onRecvMsgExtensionsChanged:(NSString* _Nullable)msgID reactionExtensionList:(NSString* _Nullable)reactionExtensionList {
    
}

- (void)onRecvMsgExtensionsDeleted:(NSString* _Nullable)msgID reactionExtensionKeyList:(NSString* _Nullable)reactionExtensionKeyList {
    
}

- (void)onRecvNewMsg:(NSString * _Nullable)message {
    CRIMMessageInfo *msg = [CRIMMessageInfo mj_objectWithKeyValues:message];
    
    [self dispatchMainThread:^{
        if (self.onRecvNewMessage) {
            self.onRecvNewMessage(msg);
        }
        
        [self.advancedMsgListeners onRecvNewMessage:msg];
    }];
}

- (void)onRecvOfflineNewMsg:(NSString* _Nullable)message {
    
}

#pragma mark -
#pragma mark - Conversation

- (void)onConversationChanged:(NSString * _Nullable)conversationList {
    
    NSArray *tConversations = [CRIMConversationInfo mj_objectArrayWithKeyValuesArray:conversationList];
    
    [self dispatchMainThread:^{
        if (self.onConversationChanged) {
            self.onConversationChanged(tConversations);
        }

        [self.conversationListeners onConversationChanged:tConversations];
    }];
}

- (void)onNewConversation:(NSString * _Nullable)conversationList {
    
    NSArray *tConversations = [CRIMConversationInfo mj_objectArrayWithKeyValuesArray:conversationList];
    
    [self dispatchMainThread:^{
        if (self.onNewConversation) {
            self.onNewConversation(tConversations);
        }
        
        [self.conversationListeners onNewConversation:tConversations];
    }];
}

- (void)onSyncServerFailed {
    [self dispatchMainThread:^{
        if (self.syncServerFailed) {
            self.syncServerFailed();
        }
        
        [self.conversationListeners onSyncServerFailed];
    }];
}

- (void)onSyncServerFinish {
    [self dispatchMainThread:^{
        if (self.syncServerFinish) {
            self.syncServerFinish();
        }

        [self.conversationListeners onSyncServerFinish];
    }];
}

- (void)onSyncServerStart {
    [self dispatchMainThread:^{
        if (self.syncServerStart) {
            self.syncServerStart();
        }
        
        [self.conversationListeners onSyncServerStart];
    }];
}

- (void)onTotalUnreadMsgCountChanged:(int32_t)totalUnreadCount {
    [self dispatchMainThread:^{
        if (self.onTotalUnreadMessageCountChanged) {
            self.onTotalUnreadMessageCountChanged(totalUnreadCount);
        }
        
        [self.conversationListeners onTotalUnreadMessageCountChanged:totalUnreadCount];
    }];
}

#pragma mark -
#pragma mark - CustomBusiness

- (void)onRecvCustomBusinessMsg:(NSString *)businessMessage {
    NSDictionary *output = businessMessage.mj_JSONObject;
    
    [self dispatchMainThread:^{
        if (self.onRecvCustomBusinessMessage) {
            self.onRecvCustomBusinessMessage(output);
        }

        [self.customBusinessListeners onRecvCustomBusinessMessage:output];
    }];
}

@end
