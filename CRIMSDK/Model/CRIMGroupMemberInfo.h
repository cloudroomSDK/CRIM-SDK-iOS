//
//  CRIMGroupMemberInfo.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import <Foundation/Foundation.h>
#import "CRIMDefine.h"

NS_ASSUME_NONNULL_BEGIN

/// 群成员信息
///
@interface CRIMGroupMemberBaseInfo : NSObject

@property (nonatomic, nullable, copy) NSString *userID;
// 角色
@property (nonatomic, assign) CRIMGroupMemberRole roleLevel;

@end

/// 群成员信息
/// 
@interface CRIMGroupMemberInfo : CRIMGroupMemberBaseInfo

@property (nonatomic, nullable, copy) NSString *groupID;
@property (nonatomic, nullable, copy) NSString *nickname;
@property (nonatomic, nullable, copy) NSString *faceURL;
// 加入时间
@property (nonatomic, assign) NSInteger joinTime;
// 入群方式
@property (nonatomic, assign) CRIMJoinType joinSource;
// 操作者id
@property (nonatomic, nullable, copy) NSString *operatorUserID;
// 被禁言结束时间戳s
@property (nonatomic, assign) NSTimeInterval muteEndTime;

@property (nonatomic, copy) NSString *inviterUserID;

@property (nonatomic, nullable, copy) NSString *ex;

@end

NS_ASSUME_NONNULL_END
