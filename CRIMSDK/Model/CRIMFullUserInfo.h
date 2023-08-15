//
//  CRIMFullUserInfo.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import <Foundation/Foundation.h>
#import "CRIMDefine.h"

NS_ASSUME_NONNULL_BEGIN

/// 用户公开信息，主要是基本信息，不包括手机等其它隐私字段
///
@interface CRIMPublicUserInfo : NSObject

@property (nonatomic, nullable, copy) NSString *userID;

@property (nonatomic, nullable, copy) NSString *nickname;

@property (nonatomic, nullable, copy) NSString *faceURL;

@property (nonatomic, assign) CRIMGender gender;

@end

/// 黑名单信息，黑名单用户基本信息，注意黑名单是双向关系。
///
@interface CRIMBlackInfo : CRIMPublicUserInfo

@property (nonatomic, assign) NSInteger createTime;

@property (nonatomic, assign) NSInteger addSource;

@property (nonatomic, nullable, copy) NSString *operatorUserID;

@property (nonatomic, nullable, copy) NSString *attachedInfo;

@property (nonatomic, nullable, copy) NSString *ex;
@end

/// 好友信息，黑名单用户基本信息，注意黑名单是双向关系。
///
@interface CRIMFriendInfo : CRIMPublicUserInfo

@property (nonatomic, nullable, copy) NSString *ownerUserID;

@property (nonatomic, nullable, copy) NSString *remark;

@property (nonatomic, assign) NSInteger createTime;

@property (nonatomic, assign) NSInteger addSource;

@property (nonatomic, nullable, copy) NSString *operatorUserID;

@property (nonatomic, nullable, copy) NSString *phoneNumber;

@property (nonatomic, assign) NSInteger birth;

@property (nonatomic, nullable, copy) NSString *email;

@property (nonatomic, nullable, copy) NSString *attachedInfo;

@property (nonatomic, nullable, copy) NSString *ex;

@end

@interface CRIMSearchFriendsInfo : CRIMFriendInfo

@property (nonatomic, assign) CRIMRelationship relationship;

@end

/*
 整合了PublicUserInfo， FriendInfo和BlackInfo
 getuserinfo时，
 如果是好友，publicInfo和friendInfo会设置，
 如果是黑名单，publicinfo和blackInfo会设置
 如果即时好友，也是黑名单，则publicInfo， friendInfo，blackInfo都会设置

 getfriend时
 如果是黑名单，则friendInfo和blackInfo会设置， 但publicInfo不设置
 */
@interface CRIMFullUserInfo : NSObject

@property (nonatomic, assign) CRIMReceiveMessageOpt globalRecvMsgOpt;

@property (nonatomic, nullable, strong) CRIMPublicUserInfo *publicInfo;
@property (nonatomic, nullable, strong) CRIMFriendInfo *friendInfo;
@property (nonatomic, nullable, strong) CRIMBlackInfo *blackInfo;

@property (nonatomic, copy, readonly) NSString *userID;
@property (nonatomic, copy, readonly) NSString *showName;
@property (nonatomic, copy, readonly) NSString *faceURL;
@property (nonatomic, assign, readonly) CRIMGender gender;
@end

NS_ASSUME_NONNULL_END
