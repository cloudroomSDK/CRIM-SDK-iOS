//
//  CRIMConversationInfo.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import <Foundation/Foundation.h>

#import "CRIMMessageInfo.h"

NS_ASSUME_NONNULL_BEGIN

/// 会话信息
///
@interface CRIMConversationBaseInfo : NSObject

@property (nonatomic, nullable, copy) NSString *conversationID;

@end

/// 会话信息
///
@interface CRIMConversationInfo : CRIMConversationBaseInfo

@property (nonatomic, assign) CRIMConversationType conversationType;

@property (nonatomic, nullable, copy) NSString *userID;

@property (nonatomic, nullable, copy) NSString *groupID;

@property (nonatomic, nullable, copy) NSString *showName;

@property (nonatomic, nullable, copy) NSString *faceURL;

@property (nonatomic, assign) CRIMReceiveMessageOpt recvMsgOpt;

@property (nonatomic, assign) NSInteger unreadCount;

@property (nonatomic, assign) CRIMGroupAtType groupAtType;

@property (nonatomic, assign) NSInteger latestMsgSendTime;

@property (nonatomic, nullable, copy) NSString *draftText;

@property (nonatomic, assign) NSInteger draftTextTime;

@property (nonatomic, assign) BOOL isPinned;

/// 是否开启了私聊（阅后即焚）
@property (nonatomic, assign) BOOL isPrivateChat;
// 私聊时长
@property (nonatomic, assign) NSTimeInterval burnDuration;

/// 是否还在组内，如果退群返回true
@property (nonatomic, assign) BOOL isNotInGroup;

@property (nonatomic, nullable, copy) NSString *attachedInfo;

@property (nonatomic, nullable, strong) CRIMMessageInfo *latestMsg;

@property (nonatomic, nullable, copy) NSString *ex;

@end

/// 免打扰会话信息
///
@interface CRIMConversationNotDisturbInfo : CRIMConversationBaseInfo

/*
 * 免打扰状态
 */
@property (nonatomic, assign) CRIMReceiveMessageOpt result;

@end

NS_ASSUME_NONNULL_END
