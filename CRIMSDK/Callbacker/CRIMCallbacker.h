//
//  CRIMCallbacker.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>

#import "CRIMDefine.h"
#import "CRIMUserInfo.h"
#import "CRIMFullUserInfo.h"
#import "CRIMFriendApplication.h"
#import "CRIMGroupApplicationInfo.h"
#import "CRIMGroupInfo.h"
#import "CRIMGroupMemberInfo.h"
#import "CRIMConversationInfo.h"
#import "CRIMMessageInfo.h"
#import "CRIMSearchParam.h"
#import "CRIMSearchResultInfo.h"
#import "CRIMSimpleResultInfo.h"
#import "CRIMSimpleRequstInfo.h"
#import "CRIMDepartmentInfo.h"

@import CRIMSDKCore;

NS_ASSUME_NONNULL_BEGIN


typedef void (^CRIMSimpleResultCallback)(CRIMSimpleResultInfo * _Nullable result);
typedef void (^CRIMSimpleResultsCallback)(NSArray <CRIMSimpleResultInfo *> * _Nullable results);

typedef void (^CRIMUserInfoCallback)(CRIMUserInfo * _Nullable userInfo);
typedef void (^CRIMUsersInfoCallback)(NSArray <CRIMUserInfo *> * _Nullable usersInfo);
typedef void (^CRIMUsersCallback)(NSArray <CRIMFullUserInfo *> * _Nullable userInfos);
typedef void (^CRIMFullUserInfoCallback)(CRIMFullUserInfo * _Nullable userInfo);
typedef void (^CRIMFullUsersInfoCallback)(NSArray <CRIMFullUserInfo *> * _Nullable userInfos);
typedef void (^CRIMBlacksInfoCallback)(NSArray <CRIMBlackInfo *> * _Nullable blackInfos);

typedef void (^CRIMFriendApplicationCallback)(CRIMFriendApplication * _Nullable friendApplication);
typedef void (^CRIMFriendApplicationsCallback)(NSArray <CRIMFriendApplication *> * _Nullable friendApplications);

typedef void (^CRIMFriendInfoCallback)(CRIMFriendInfo * _Nullable friendInfo);
typedef void (^CRIMFriendsInfoCallback)(NSArray<CRIMFriendInfo *> * _Nullable friendInfo);
typedef void (^CRIMBlackInfoCallback)(CRIMBlackInfo * _Nullable blackInfo);
typedef void (^CRIMBlacksInfoCallback)(NSArray<CRIMBlackInfo *> * _Nullable blackInfo);
typedef void (^CRIMSearchUsersInfoCallback)(NSArray<CRIMSearchFriendsInfo *> * _Nullable usersInfo);

typedef void (^CRIMGroupApplicationCallback)(CRIMGroupApplicationInfo * _Nullable groupApplication);
typedef void (^CRIMGroupsApplicationCallback)(NSArray <CRIMGroupApplicationInfo *> * _Nullable groupsInfo);
typedef void (^CRIMGroupInfoCallback)(CRIMGroupInfo * _Nullable groupInfo);
typedef void (^CRIMGroupsInfoCallback)(NSArray <CRIMGroupInfo *> * _Nullable groupsInfo);
typedef void (^CRIMGroupMemberInfoCallback)(CRIMGroupMemberInfo * _Nullable groupMemberInfo);
typedef void (^CRIMGroupMembersInfoCallback)(NSArray <CRIMGroupMemberInfo *> * _Nullable groupMembersInfo);

typedef void (^CRIMConversationsInfoCallback)(NSArray <CRIMConversationInfo *> * _Nullable conversations);
typedef void (^CRIMConversationInfoCallback)(CRIMConversationInfo * _Nullable conversation);
typedef void (^CRIMConversationNotDisturbInfoCallback)(NSArray <CRIMConversationNotDisturbInfo *> * _Nullable conversations);

typedef void (^CRIMMessageInfoCallback)(CRIMMessageInfo * _Nullable message);
typedef void (^CRIMMessagesInfoCallback)(NSArray <CRIMMessageInfo *> * _Nullable messages);
typedef void (^CRIMMessageSearchCallback)(CRIMSearchResultInfo * _Nullable result);

typedef void (^CRIMReceiptCallback)(NSArray <CRIMReceiptInfo *> * _Nullable msgReceiptList);
typedef void (^CRIMRevokedCallback)(CRIMMessageRevokedInfo * _Nullable msgRovoked);

typedef void (^CRIMGetAdvancedHistoryMessageListCallback)(CRIMGetAdvancedHistoryMessageListInfo * _Nullable result);

/// IMSDK 主核心回调
@protocol CRIMSDKListener <NSObject>
@optional
/*
 *  SDK 正在连接到服务器
 */
- (void)onConnecting;

/*
 * SDK 已经成功连接到服务器
 */
- (void)onConnectSuccess;

/*
 * SDK 连接服务器失败
 */
- (void)onConnectFailed:(NSInteger)code err:(NSString*)err;

/*
 * 当前用户被踢下线，此时可以 UI 提示用户
 */
- (void)onKickedOffline;

/*
 * 在线时票据过期：此时您需要生成新的 UserToken 并再次重新登录。
 */
- (void)onUserTokenExpired;

@end

/// 资料关系链回调
@protocol CRIMFriendshipListener <NSObject>
@optional

/*
 *  好友申请新增通知
 */
- (void)onFriendApplicationAdded:(CRIMFriendApplication *)application;

/*
 *  好友申请被拒绝
 */
- (void)onFriendApplicationRejected:(CRIMFriendApplication *)application;

/*
 *  好友申请被接受
 */
- (void)onFriendApplicationAccepted:(CRIMFriendApplication *)application;

/*
 *  好友申请被删除
 */
- (void)onFriendApplicationDeleted:(CRIMFriendApplication *)application;

/*
 *  好友新增通知
 */
- (void)onFriendAdded:(CRIMFriendInfo *)info;

/*
 *  好友删除通知
 */
- (void)onFriendDeleted:(CRIMFriendInfo *)info;

/*
 *  好友资料变更通知
 */
- (void)onFriendInfoChanged:(CRIMFriendInfo *)info;

/*
 *  黑名单新增通知
 */
- (void)onBlackAdded:(CRIMBlackInfo *)info;

/*
 *  黑名单删除通知
 */
- (void)onBlackDeleted:(CRIMBlackInfo *)info;

@end

/// IMSDK 群组事件回调
@protocol CRIMGroupListener <NSObject>
@optional

/*
 *  有新成员加入群
 */
- (void)onGroupMemberAdded:(CRIMGroupMemberInfo *)memberInfo;

/*
 *  有成员离开群
 */
- (void)onGroupMemberDeleted:(CRIMGroupMemberInfo *)memberInfo;

/*
 *  某成员信息发生变更
 */
- (void)onGroupMemberInfoChanged:(CRIMGroupMemberInfo *)changeInfo;

/*
 *  例如有邀请进群， UI列表会展示新的item
 */
- (void)onJoinedGroupAdded:(CRIMGroupInfo *)groupInfo;

/*
 *  例如群里被踢， UI列表会删除这个的item
 */
- (void)onJoinedGroupDeleted:(CRIMGroupInfo *)groupInfo;

/*
 *  某个已加入的群的信息被修改了
 */
- (void)onGroupInfoChanged:(CRIMGroupInfo *)changeInfo;

/*
 *  群申请被接受
 */
- (void)onGroupApplicationAccepted:(CRIMGroupApplicationInfo *)groupApplication;

/*
 *  有人申请加群
 */
- (void)onGroupApplicationAdded:(CRIMGroupApplicationInfo *)groupApplication;

/*
 *  群申请有删除
 */
- (void)onGroupApplicationDeleted:(CRIMGroupApplicationInfo *)groupApplication;

/*
 *  群申请有拒绝
 */
- (void)onGroupApplicationRejected:(CRIMGroupApplicationInfo *)groupApplication;

/**
 群解散
 */
- (void)onGroupDismissed:(CRIMGroupInfo *)changeInfo;

@end

@protocol CRIMConversationListener <NSObject>
@optional

/*
 * 同步服务器会话开始
 */
- (void)onSyncServerStart;

/*
 * 同步服务器会话完成
 */
- (void)onSyncServerFinish;

/*
 * 同步服务器会话失败
 */
- (void)onSyncServerFailed;

/*
 * 有新的会话
 */
- (void)onNewConversation:(NSArray <CRIMConversationInfo *> *)conversations;

/*
 * 某些会话的关键信息发生变化（
 */
- (void)onConversationChanged:(NSArray <CRIMConversationInfo *> *)conversations;

/*
 * 会话未读总数变更通知
 */
- (void)onTotalUnreadMessageCountChanged:(NSInteger)totalUnreadCount;

@end

/// 高级消息监听器
@protocol CRIMAdvancedMsgListener <NSObject>
@optional

/*
 *  收到新消息
 */
- (void)onRecvNewMessage:(CRIMMessageInfo *)msg;

/*
 *  单聊消息已读回执
 */
- (void)onRecvC2CReadReceipt:(NSArray<CRIMReceiptInfo *> *)receiptList;

/*
 *  群聊消息已读回执
 */
- (void)onRecvGroupReadReceipt:(NSArray<CRIMReceiptInfo *> *)groupMsgReceiptList;

/*
 *  收到消息撤回
 */
- (void)onRecvMessageRevoked:(CRIMMessageRevokedInfo *)messageRevoked;

- (void)onRecvMessageExtensionsAdded:(NSString *)msgID reactionExtensionList:(NSArray<CRIMKeyValue *> *)reactionExtensionList;

- (void)onRecvMessageExtensionsDeleted:(NSString *)msgID reactionExtensionList:(NSArray<NSString *> *)reactionExtensionList;

- (void)onRecvMessageExtensionsChanged:(NSString *)msgID reactionExtensionKeyList:(NSArray<CRIMKeyValue *> *)reactionExtensionKeyList;

- (void)onMsgDeleted:(CRIMMessageInfo *)message;

@end

/// IMSDK 主核心回调
@protocol CRIMCustomBusinessListener <NSObject>
@optional

- (void)onRecvCustomBusinessMessage:(NSDictionary <NSString *, id>* _Nullable)businessMessage;

@end


@interface CRIMCallbacker : NSObject
<
Crim_sdk_callbackOnConnListener,
Crim_sdk_callbackOnAdvancedMsgListener,
Crim_sdk_callbackOnConversationListener,
Crim_sdk_callbackOnFriendshipListener,
Crim_sdk_callbackOnGrpListener,
Crim_sdk_callbackOnUserListener,
Crim_sdk_callbackOnCustomBusinessListener
>

+ (instancetype)callbacker;

- (void)setListener;

/// 链接监听
/// 在InitSDK之前设置，在IM连接状态有变化时回调
@property (nonatomic, nullable, copy) CRIMVoidCallback connecting;
@property (nonatomic, nullable, copy) CRIMFailureCallback connectFailure;
@property (nonatomic, nullable, copy) CRIMVoidCallback connectSuccess;
@property (nonatomic, nullable, copy) CRIMVoidCallback kickedOffline;
@property (nonatomic, nullable, copy) CRIMVoidCallback userTokenExpired;

/**
 *  添加 IM 监听
 */
- (void)addIMSDKListener:(id<CRIMSDKListener>)listener;

/**
 *  移除 IM 监听
 */
- (void)removeIMSDKListener:(id<CRIMSDKListener>)listener;

/// 用户监听
/// 在InitSDK成功后，Login之前设置，本登录用户个人资料有变化时回调
@property (nonatomic, nullable, copy) CRIMUserInfoCallback onSelfInfoUpdated;

/// 好友监听
/// 在InitSDK成功后，Login之前设置，好友相关信息有变化时回调
@property (nonatomic, nullable, copy) CRIMFriendApplicationCallback onFriendApplicationAdded;
@property (nonatomic, nullable, copy) CRIMFriendApplicationCallback onFriendApplicationDeleted;
@property (nonatomic, nullable, copy) CRIMFriendApplicationCallback onFriendApplicationAccepted;
@property (nonatomic, nullable, copy) CRIMFriendApplicationCallback onFriendApplicationRejected;
@property (nonatomic, nullable, copy) CRIMFriendInfoCallback onFriendAdded;
@property (nonatomic, nullable, copy) CRIMFriendInfoCallback onFriendDeleted;
@property (nonatomic, nullable, copy) CRIMFriendInfoCallback onFriendInfoChanged;
@property (nonatomic, nullable, copy) CRIMBlackInfoCallback onBlackAdded;
@property (nonatomic, nullable, copy) CRIMBlackInfoCallback onBlackDeleted;

/**
 *  添加关系链监听器
 */
- (void)addFriendListener:(id<CRIMFriendshipListener>)listener NS_SWIFT_NAME(addFriendListener(listener:));

/**
 *   移除关系链监听器
 */
- (void)removeFriendListener:(id<CRIMFriendshipListener>)listener NS_SWIFT_NAME(removeFriendListener(listener:));

/// 群组监听
/// 在InitSDK成功后，Login之前设置，群组相关信息有变化时回调
@property (nonatomic, nullable, copy) CRIMGroupInfoCallback onGroupInfoChanged;
@property (nonatomic, nullable, copy) CRIMGroupInfoCallback onJoinedGroupAdded;
@property (nonatomic, nullable, copy) CRIMGroupInfoCallback onJoinedGroupDeleted;
@property (nonatomic, nullable, copy) CRIMGroupMemberInfoCallback onGroupMemberAdded;
@property (nonatomic, nullable, copy) CRIMGroupMemberInfoCallback onGroupMemberDeleted;
@property (nonatomic, nullable, copy) CRIMGroupMemberInfoCallback onGroupMemberInfoChanged;
@property (nonatomic, nullable, copy) CRIMGroupApplicationCallback onGroupApplicationAdded;
@property (nonatomic, nullable, copy) CRIMGroupApplicationCallback onGroupApplicationDeleted;
@property (nonatomic, nullable, copy) CRIMGroupApplicationCallback onGroupApplicationAccepted;
@property (nonatomic, nullable, copy) CRIMGroupApplicationCallback onGroupApplicationRejected;
@property (nonatomic, nullable, copy) CRIMGroupInfoCallback onGroupDismissed;

/*
 *  设置群组监听器
 */
- (void)addGroupListener:(id<CRIMGroupListener>)listener NS_SWIFT_NAME(addGroupListener(listener:));

/*
 *  设置群组监听器
 */
- (void)removeGroupListener:(id<CRIMGroupListener>)listener NS_SWIFT_NAME(removeGroupListener(listener:));

/// 会话监听
/// 在InitSDK成功后，Login之前设置，会话相关信息有变化时回调
@property (nonatomic, nullable, copy) CRIMVoidCallback syncServerStart;
@property (nonatomic, nullable, copy) CRIMVoidCallback syncServerFinish;
@property (nonatomic, nullable, copy) CRIMVoidCallback syncServerFailed;
@property (nonatomic, nullable, copy) CRIMConversationsInfoCallback onNewConversation;
@property (nonatomic, nullable, copy) CRIMConversationsInfoCallback onConversationChanged;
@property (nonatomic, nullable, copy) CRIMNumberCallback onTotalUnreadMessageCountChanged;

/*
 *  添加会话监听器
 */
- (void)addConversationListener:(id<CRIMConversationListener>)listener NS_SWIFT_NAME(addConversationListener(listener:));

/*
 *  移除会话监听器
 */
- (void)removeConversationListener:(id<CRIMConversationListener>)listener NS_SWIFT_NAME(removeConversationListener(listener:));

/// 消息监听
/// 在InitSDK成功后，Login之前设置，消息相关信息有变化时回调
@property (nonatomic, nullable, copy) CRIMMessageInfoCallback onRecvNewMessage;
@property (nonatomic, nullable, copy) CRIMReceiptCallback onRecvC2CReadReceipt;
@property (nonatomic, nullable, copy) CRIMReceiptCallback onRecvGroupReadReceipt;
@property (nonatomic, nullable, copy) CRIMRevokedCallback onRecvMessageRevoked;
@property (nonatomic, nullable, copy) CRIMMessageInfoCallback onMessageDeleted;
/*
 *  添加高级消息的事件监听器
 */
- (void)addAdvancedMsgListener:(id<CRIMAdvancedMsgListener>)listener NS_SWIFT_NAME(addAdvancedMsgListener(listener:));

/*
 *  移除高级消息的事件监听器
 */
- (void)removeAdvancedMsgListener:(id<CRIMAdvancedMsgListener>)listener NS_SWIFT_NAME(removeAdvancedMsgListener(listener:));

/// 自定义消息监听
@property (nonatomic, nullable, copy) CRIMObjectCallback onRecvCustomBusinessMessage;

/**
 *  添加 IM 监听
 */
- (void)addCustomBusinessListener:(id<CRIMCustomBusinessListener>)listener NS_SWIFT_NAME(addCustomBusinessListener(listener:));

/**
 *  移除 IM 监听
 */
- (void)removeCustomBusinessListener:(id<CRIMCustomBusinessListener>)listener NS_SWIFT_NAME(removeCustomBusinessListener(listener:));

@end

NS_ASSUME_NONNULL_END
