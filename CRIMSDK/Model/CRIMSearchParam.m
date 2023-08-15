//
//  CRIMSearchParam.m
//  CRIMSDK
//
//  Created by tom on 2023/2/17.
//

#import "CRIMSearchParam.h"
#import <MJExtension/MJExtension.h>
#import "CRIMMessageInfo.h"

@implementation CRIMSearchParam

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _senderUserIDList = @[];
        _messageTypeList = @[];
    }
    
    return self;
}

@end


@implementation CRIMSearchGroupParam

@end

@implementation CRIMGetMessageOptions

@end

@implementation CRIMGetAdvancedHistoryMessageListParam

@end

@implementation CRIMSearchFriendsParam

@end

@implementation CRIMFindMessageListParam

@end

@implementation CRIMSearchGroupMembersParam

@end

@implementation CRIMSearchOrganizationParam

@end
