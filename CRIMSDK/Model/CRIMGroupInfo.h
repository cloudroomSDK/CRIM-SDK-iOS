//
//  CRIMGroupInfo.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import <Foundation/Foundation.h>
#import "CRIMDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRIMGroupBaseInfo : NSObject

@property (nonatomic, assign) CRIMGroupType groupType;
@property (nonatomic, nullable, copy) NSString *groupName;
@property (nonatomic, nullable, copy) NSString *notification;
@property (nonatomic, nullable, copy) NSString *introduction;
@property (nonatomic, nullable, copy) NSString *faceURL;
@property (nonatomic, nullable, copy) NSString *ex;

@end

@interface CRIMGroupCreateInfo : NSObject

@property (nonatomic, strong) CRIMGroupBaseInfo *groupInfo;
@property (nonatomic, copy) NSArray <NSString *> *memberUserIDs;
@property (nonatomic, copy) NSArray <NSString *> *adminUserIDs;
@property (nonatomic, copy) NSString *ownerUserID;

@end

/// 群组信息
///
@interface CRIMGroupInfo : CRIMGroupBaseInfo

@property (nonatomic, nullable, copy) NSString *groupID;
@property (nonatomic, assign, readonly) NSInteger createTime;
@property (nonatomic, assign, readonly) NSInteger memberCount;
@property (nonatomic, assign, readonly) CRIMGroupStatus status;
@property (nonatomic, copy, readonly) NSString *creatorUserID;
@property (nonatomic, copy, readonly) NSString *ownerUserID;
@property (nonatomic, assign) CRIMGroupVerificationType needVerification;
@property (nonatomic, assign) NSInteger lookMemberInfo;
@property (nonatomic, assign) NSInteger applyMemberFriend;
@property (nonatomic, assign, readonly) NSInteger notificationUpdateTime;
@property (nonatomic, copy, readonly) NSString *notificationUserID;

@end

NS_ASSUME_NONNULL_END
