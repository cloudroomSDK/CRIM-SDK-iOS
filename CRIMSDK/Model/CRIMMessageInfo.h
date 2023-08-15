//
//  CRIMMessageInfo.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import <Foundation/Foundation.h>
#import "CRIMPictureElem.h"
#import "CRIMSoundElem.h"
#import "CRIMVideoElem.h"
#import "CRIMFileElem.h"
#import "CRIMMergeElem.h"
#import "CRIMAtElem.h"
#import "CRIMLocationElem.h"
#import "CRIMCustomElem.h"
#import "CRIMQuoteElem.h"
#import "CRIMNotificationElem.h"
#import "CRIMFaceElem.h"
#import "CRIMAttachedInfoElem.h"
#import "CRIMDefine.h"
#import "CRIMMessageElem.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRIMOfflinePushInfo : NSObject

@property (nonatomic, nullable, copy) NSString *title;
@property (nonatomic, nullable, copy) NSString *desc;
@property (nonatomic, nullable, copy) NSString *iOSPushSound;
@property (nonatomic, assign) BOOL iOSBadgeCount;
@property (nonatomic, nullable, copy) NSString *operatorUserID;
@property (nonatomic, nullable, copy) NSString *ex;

@end

/// 消息模型
///
@interface CRIMMessageInfo : NSObject

@property (nonatomic, nullable, copy) NSString *clientMsgID;

@property (nonatomic, nullable, copy) NSString *serverMsgID;

@property (nonatomic, assign) NSTimeInterval createTime;

@property (nonatomic, assign) NSTimeInterval sendTime;

@property (nonatomic, assign) CRIMConversationType sessionType;

@property (nonatomic, nullable, copy) NSString *sendID;

@property (nonatomic, nullable, copy) NSString *recvID;

@property (nonatomic, nullable, copy) NSString *handleMsg;

@property (nonatomic, assign) CRIMMessageLevel msgFrom;

@property (nonatomic, assign) CRIMMessageContentType contentType;

@property (nonatomic, assign) NSInteger platformID;

@property (nonatomic, nullable, copy) NSString *senderNickname;

@property (nonatomic, nullable, copy) NSString *senderFaceUrl;

@property (nonatomic, nullable, copy) NSString *groupID;

@property (nonatomic, nullable, copy) NSString *content;

/*
 *  消息唯一序列号
 */
@property (nonatomic, assign) NSInteger seq;

@property (nonatomic, assign) BOOL isRead;

@property (nonatomic, assign) CRIMMessageStatus status;

@property (nonatomic, nullable, copy) NSString *attachedInfo;

@property (nonatomic, nullable, copy) NSString *ex;

@property (nonatomic, strong) CRIMOfflinePushInfo *offlinePush;

@property (nonatomic, nullable, strong) CRIMTextElem *textElem;

@property (nonatomic, nullable, strong) CRIMCardElem *cardElem;

@property (nonatomic, nullable, strong) CRIMPictureElem *pictureElem;

@property (nonatomic, nullable, strong) CRIMSoundElem *soundElem;

@property (nonatomic, nullable, strong) CRIMVideoElem *videoElem;

@property (nonatomic, nullable, strong) CRIMFileElem *fileElem;

@property (nonatomic, nullable, strong) CRIMMergeElem *mergeElem;

@property (nonatomic, nullable, strong) CRIMAtTextElem *atTextElem;

@property (nonatomic, nullable, strong) CRIMLocationElem *locationElem;

@property (nonatomic, nullable, strong) CRIMQuoteElem *quoteElem;

@property (nonatomic, nullable, strong) CRIMCustomElem *customElem;

@property (nonatomic, nullable, strong) CRIMNotificationElem *notificationElem;

@property (nonatomic, nullable, strong) CRIMFaceElem *faceElem;

@property (nonatomic, nullable, strong) CRIMAttachedInfoElem *attachedInfoElem;

@property (nonatomic, nullable, strong) CRIMAdvancedTextElem *advancedTextElem;

@property (nonatomic, nullable, strong) CRIMTypingElem *typingElem;

@property (nonatomic, assign) NSTimeInterval hasReadTime;

@property (nonatomic, assign) BOOL isReact;

@property (nonatomic, assign) BOOL isExternalExtensions;

@end

@interface CRIMReceiptInfo : NSObject

/*
 * 用户id - 单聊有效
 */
@property (nonatomic, nullable, copy) NSString *userID;

/*
 * group id - 群聊有效
 */
@property (nonatomic, nullable, copy) NSString *groupID;

/*
 * 已读消息id
 */
@property (nonatomic, nullable, copy) NSArray<NSString *> *msgIDList;

/*
 * 阅读时间
 */
@property (nonatomic, assign) NSInteger readTime;

@property (nonatomic, assign) CRIMMessageLevel msgFrom;

@property (nonatomic, assign) CRIMMessageContentType contentType;

@property (nonatomic, assign) CRIMConversationType sessionType;

@end

@interface CRIMMessageRevokedInfo : NSObject

/*
 * 撤回者的id
 */
@property (nonatomic, copy) NSString *revokerID;

@property (nonatomic, copy) NSString *revokerNickname;

/*
 * 撤回者的身份：例如：群主，群管理员
 */
@property (nonatomic, assign) CRIMGroupMemberRole revokerRole;

@property (nonatomic, copy) NSString *clientMsgID;

@property (nonatomic, assign) NSTimeInterval revokeTime;

@property (nonatomic, assign) NSTimeInterval sourceMessageSendTime;

@property (nonatomic, copy) NSString *sourceMessageSendID;

@property (nonatomic, copy) NSString *sourceMessageSenderNickname;

@property (nonatomic, assign) CRIMConversationType sessionType;

@property (nonatomic, copy) NSString *ex;

@end

@interface CRIMKeyValue: NSObject

@property (nonatomic, copy) NSString *errMsg;

@property (nonatomic, assign) NSInteger errCode;

@property (nonatomic, copy) NSString *typeKey;

@property (nonatomic, copy) NSString *value;

@property (nonatomic, assign) NSTimeInterval latestUpdateTime;

@end

@interface CRIMKeyValues: NSObject

@property (nonatomic, copy) NSString *errMsg;

@property (nonatomic, assign) NSInteger errCode;

@property (nonatomic, copy) NSString *clientMsgID;

@property (nonatomic, copy) NSDictionary<NSString *, CRIMKeyValue *> *reactionExtensionList;

@end





NS_ASSUME_NONNULL_END
