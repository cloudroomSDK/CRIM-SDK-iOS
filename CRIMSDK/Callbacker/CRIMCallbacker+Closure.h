//
//  CRIMCallbacker+Closure.h
//  CRIMSDK
//
//  Created by tom on 2023/3/3.
//

#import "CRIMCallbacker.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRIMCallbacker (Closure)

/*
 * 设置链接状态监听器
 * 如果IM正在连接到服务器，会触发   onConnecting
 * 如果IM连接服务器失败，会触发   onConnectFailure
 * 如果IM已经成功连接到服务器，会触发   onConnectSuccess
 * 如果当前用户被踢下线，会触发   onKickedOffline
 * 如果在线时票据过期，会触发   onUserTokenExpired
 *
 * SDK初始化之前设置，后续会话改变可以根据监听器回调再刷新数据
 */
- (void)setConnListenerWithonConnecting:(CRIMVoidCallback)onConnecting
                       onConnectFailure:(CRIMFailureCallback)onConnectFailure
                       onConnectSuccess:(CRIMVoidCallback)onConnectSuccess
                        onKickedOffline:(CRIMVoidCallback)onKickedOffline
                     onUserTokenExpired:(CRIMVoidCallback)onUserTokenExpired;

/*
 * 设置会话监听器
 * 如果会话改变，会触发   onConversationChanged
 * 如果新增会话，会触发   onNewConversation
 * 如果未读消息数改变，会触发    onTotalUnreadMessageCountChanged
 *
 * 启动app时主动拉取一次会话记录，后续会话改变可以根据监听器回调再刷新数据
 */
- (void)setConversationListenerWithOnSyncServerStart:(CRIMVoidCallback)onSyncServerStart
                                  onSyncServerFinish:(CRIMVoidCallback)onSyncServerFinish
                                  onSyncServerFailed:(CRIMVoidCallback)onSyncServerFailed
                               onConversationChanged:(CRIMConversationsInfoCallback)onConversationChanged
                                   onNewConversation:(CRIMConversationsInfoCallback)onNewConversation
                    onTotalUnreadMessageCountChanged:(CRIMNumberCallback)onTotalUnreadMessageCountChanged;

/*
 * 设置好友关系监听器
 *
 * 好友被拉入黑名单回调   onBlackAdded
 * 好友从黑名单移除回调   onBlackDeleted
 * 发起的好友请求被接受时回调    onFriendApplicationAccepted
 * 我接受别人的发起的好友请求时回调 onFriendApplicationAdded
 * 删除好友请求时回调    onFriendApplicationDeleted
 * 请求被拒绝回调  onFriendApplicationRejected
 * 好友资料发生变化时回调  onFriendInfoChanged
 * 已添加好友回调  onFriendAdded
 * 好友被删除时回调 onFriendDeleted
 **/
- (void)setFriendListenerWithOnBlackAdded:(CRIMBlackInfoCallback)onBlackAdded
                           onBlackDeleted:(CRIMBlackInfoCallback)onBlackDeleted
              onFriendApplicationAccepted:(CRIMFriendApplicationCallback)onFriendApplicationAccepted
                 onFriendApplicationAdded:(CRIMFriendApplicationCallback)onFriendApplicationAdded
               onFriendApplicationDeleted:(CRIMFriendApplicationCallback)onFriendApplicationDeleted
              onFriendApplicationRejected:(CRIMFriendApplicationCallback)onFriendApplicationRejected
                      onFriendInfoChanged:(CRIMFriendInfoCallback)onFriendInfoChanged
                            onFriendAdded:(CRIMFriendInfoCallback)onFriendAdded
                          onFriendDeleted:(CRIMFriendInfoCallback)onFriendDeleted;

/*
 * 设置组监听器
 *
 */
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
                              onGroupDismissed:(nullable CRIMGroupInfoCallback)onGroupDismissed;

/*
 * 添加消息监听
 *
 * 当对方撤回条消息 onRecvMessageRevoked，通过回调将界面已显示的消息替换为"xx撤回了一套消息"
 * 当对方阅读了消息 onRecvC2CReadReceipt，通过回调将已读的消息更改状态。
 * 新增消息 onRecvNewMessage，向界面添加消息
 */
- (void)setAdvancedMsgListenerWithOnRecvMessageRevoked:(CRIMRevokedCallback)onRecvMessageRevoked
                                  onRecvC2CReadReceipt:(CRIMReceiptCallback)onRecvC2CReadReceipt
                                onRecvGroupReadReceipt:(CRIMReceiptCallback)onRecvGroupReadReceipt
                                      onRecvNewMessage:(CRIMMessageInfoCallback)onRecvNewMessage;

/*
 * 用户信息监听
 *
 */
- (void)setSelfUserInfoUpdateListener:(CRIMUserInfoCallback)onUserInfoUpdate;

/*
 * 自定义消息
 *
 */
- (void)setRecvCustomBusinessMessageListener:(CRIMObjectCallback)onRecvCustomBusinessMessage;
@end

NS_ASSUME_NONNULL_END
