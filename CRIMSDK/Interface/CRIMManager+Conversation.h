//
//  CRIMManager+Conversation.h
//  CRIMSDK
//
//  Created by tom on 2023/2/16.
//

#import "CRIMManager.h"
#import "CRIMConversationInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRIMManager (Conversation)

/*
 * 获取会话列表
 *
 */
- (void)getAllConversationListWithOnSuccess:(nullable CRIMConversationsInfoCallback)onSuccess
                                  onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 分页获取会话列表
 * @param offset    起始偏移量
 * @param count 拉取会话的数量
 */
- (void)getConversationListSplitWithOffset:(NSInteger)offset
                                     count:(NSInteger)count
                                 onSuccess:(nullable CRIMConversationsInfoCallback)onSuccess
                                 onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 获取一个会话，如果不存在会自动创建
 * @param sessionType   会话的类型，单聊为1，群聊为2
 * @param sourceID  单聊为用户ID，群聊为群ID
 */
- (void)getOneConversationWithSessionType:(CRIMConversationType)sessionType
                                 sourceID:(NSString *)sourceID
                                onSuccess:(nullable CRIMConversationInfoCallback)onSuccess
                                onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 获取多个会话列表
 * @param ids   会话ID的列表
 */
- (void)getMultipleConversation:(NSArray <NSString *> *)ids
                       onSuccess:(nullable CRIMConversationsInfoCallback)onSuccess
                       onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 本地删除一个会话
 * @param conversationID    会话ID
 */
- (void)deleteConversationAndDeleteAllMsg:(NSString *)conversationID
                                onSuccess:(nullable CRIMSuccessCallback)onSuccess
                                onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 清空一个会话 本地 & 服务器
 * @param conversationID    会话ID
 */
- (void)clearConversationAndDeleteAllMsg:(NSString *)conversationID
                               onSuccess:(nullable CRIMSuccessCallback)onSuccess
                               onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 删除所有会话
 *
 */
- (void)deleteAllConversationFromLocalWithOnSuccess:(nullable CRIMSuccessCallback)onSuccess
                                          onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 设置会话的草稿
 * @param conversationID    会话ID
 * @param draftText 草稿文本，如果为""则为删除草稿
 */
- (void)setConversationDraft:(NSString *)conversationID
                   draftText:(NSString *)draftText
                   onSuccess:(nullable CRIMSuccessCallback)onSuccess
                   onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 置顶会话
 * @param conversationID    会话ID
 * @param isPinned  为YES时，代表置顶会话，为NO时代表取消置顶
 */
- (void)pinConversation:(NSString *)conversationID
               isPinned:(BOOL)isPinned
              onSuccess:(nullable CRIMSuccessCallback)onSuccess
              onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 获取总的消息未读数
 *
 */
- (void)getTotalUnreadMsgCountWithOnSuccess:(nullable CRIMNumberCallback)onSuccess
                                  onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 获取会话免打扰状态
 *
 */
- (void)getConversationRecvMsgOpt:(NSArray <NSString *> *)conversationIDs
                            onSuccess:(nullable CRIMConversationNotDisturbInfoCallback)onSuccess
                            onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 设置会话免打扰状态
 *
 */
- (void)setConversationRecvMsgOpt:(NSString *)conversationID
                               status:(CRIMReceiveMessageOpt)status
                            onSuccess:(nullable CRIMSuccessCallback)onSuccess
                            onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 设置私聊, 可做“阅后即焚”功能
 *
 */
- (void)setConversationPrivateChat:(NSString *)conversationID
                         isPrivate:(BOOL)isPrivate
                         onSuccess:(nullable CRIMSuccessCallback)onSuccess
                         onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 设置私聊, 可做“阅后即焚”时间设置功能
 *
 */
- (void)setConversationBurnDuration:(NSString *)conversationID
                           duration:(NSInteger)burnDuration
                          onSuccess:(nullable CRIMSuccessCallback)onSuccess
                          onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 重置at标准位
 *
 */
- (void)resetConversationGrpAtType:(NSString *)conversationID
                           onSuccess:(nullable CRIMSuccessCallback)onSuccess
                           onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 隐藏会话，不删除聊天记录；
 * 如果有新消息到达，会话会再次出现。
 */
- (void)hideConversation:(NSString *)conversationID
               onSuccess:(nullable CRIMSuccessCallback)onSuccess
               onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 清空未读数
 *
 */
- (void)markConversationMsgAsRead:(NSString *)conversationID
                            onSuccess:(nullable CRIMSuccessCallback)onSuccess
                            onFailure:(nullable CRIMFailureCallback)onFailure;
@end

NS_ASSUME_NONNULL_END
