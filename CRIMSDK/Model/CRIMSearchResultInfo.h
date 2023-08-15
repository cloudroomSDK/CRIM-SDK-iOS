//
//  CRIMSearchResultInfo.h
//  CRIMSDK
//
//  Created by tom on 2023/2/17.
//

#import <Foundation/Foundation.h>
#import "CRIMDefine.h"

@class CRIMMessageInfo;

NS_ASSUME_NONNULL_BEGIN

@interface CRIMSearchResultItemInfo : NSObject

/*
 * 会话ID
 */
@property (nonatomic, copy) NSString *conversationID;

/*
 * 这个会话下的消息数量
 */
@property (nonatomic, assign) NSInteger messageCount;

@property (nonatomic, assign) CRIMConversationType conversationType;

@property (nonatomic, copy) NSString *showName;

@property (nonatomic, copy) NSString *faceURL;

/*
 * CRIMMessageInfo的列表
 */
@property (nonatomic, copy) NSArray <CRIMMessageInfo *> *messageList;

@end

@interface CRIMSearchResultInfo : NSObject

/*
 * 获取到的总的消息数量
 */
@property (nonatomic, assign) NSInteger totalCount;

/*
 * 搜索结果
 */
@property (nonatomic, copy) NSArray <CRIMSearchResultItemInfo *> *searchResultItems;

// 仅适用于findMessageList函数的回调结果
@property (nonatomic, copy) NSArray <CRIMSearchResultItemInfo *> *findResultItems;

@end

@interface CRIMGetAdvancedHistoryMessageListInfo : NSObject

@property (nonatomic, assign) BOOL isEnd;

@property (nonatomic, assign) NSInteger lastMinSeq;

@property (nonatomic, assign) NSInteger errCode;

@property (nonatomic, copy) NSString *errMsg;

@property (nonatomic, copy) NSArray <CRIMMessageInfo *> *messageList;

@end

NS_ASSUME_NONNULL_END
