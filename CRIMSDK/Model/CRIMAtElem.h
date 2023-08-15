//
//  CRIMAtElem.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import <Foundation/Foundation.h>
#import "CRIMQuoteElem.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRIMAtInfo : NSObject

/*
 * at 成员的id
 */
@property (nonatomic, nullable, copy) NSString *atUserID;

/*
 * at 成员的昵称/群名片
 */
@property (nonatomic, nullable, copy) NSString *groupNickname;

@end

@interface CRIMAtTextElem : NSObject

/*
 * at 消息内容
 */
@property (nonatomic, nullable, copy) NSString *text;

/*
 * 被@的用户id集合
 */
@property (nonatomic, nullable, copy) NSArray<NSString *> *atUserList;

/*
 * 被@的用户集合
 */
@property (nonatomic, nullable, copy) NSArray<CRIMAtInfo *> *atUsersInfo;

/*
 * at 引用消息
 */
@property (nonatomic, nullable, strong) CRIMMessageInfo *quoteMessage;

/*
 * 自己是否被@了
 */
@property (nonatomic, assign, readonly) BOOL isAtSelf;


/*
 * 是否@全体成员
 */
@property (nonatomic, assign, readonly) BOOL isAtAll;

@end

NS_ASSUME_NONNULL_END
