//
//  CRIMNotificationElem.h
//  CRIMSDK
//
//  Created by tom on 2023/2/21.
//

#import <Foundation/Foundation.h>
#import "CRIMGroupMemberInfo.h"
#import "CRIMGroupInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRIMNotificationElem : NSObject

@property (nonatomic, nullable, copy) NSString *detail;

/// 以下字段是从detail里面decode出来的
@property (nonatomic, nullable, strong, readonly) CRIMGroupMemberInfo *opUser;

@property (nonatomic, nullable, strong, readonly) CRIMGroupMemberInfo *quitUser;

@property (nonatomic, nullable, strong, readonly) CRIMGroupMemberInfo *entrantUser;
/// 群改变新群主的信息
@property (nonatomic, nullable, strong, readonly) CRIMGroupMemberInfo *groupNewOwner;

@property (nonatomic, nullable, strong, readonly) CRIMGroupInfo *group;

@property (nonatomic, nullable, strong, readonly) NSArray <CRIMGroupMemberInfo *> *kickedUserList;

@property (nonatomic, nullable, strong, readonly) NSArray <CRIMGroupMemberInfo *> *invitedUserList;

@end

NS_ASSUME_NONNULL_END
