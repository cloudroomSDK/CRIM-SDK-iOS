//
//  CRIMNotificationElem.m
//  CRIMSDK
//
//  Created by tom on 2023/2/21.
//

#import "CRIMNotificationElem.h"
#import <MJExtension/MJExtension.h>

@implementation CRIMNotificationElem

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"groupNewOwner" : @"newGroupOwner"};
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"kickedUserList" : [CRIMGroupMemberInfo class],
             @"invitedUserList": [CRIMGroupMemberInfo class]
    };

}

- (void)setDetail:(NSString *)detail {
    _detail = detail;
    
    if (detail.length > 0) {
        CRIMNotificationElem *elem = [CRIMNotificationElem mj_objectWithKeyValues:detail];
        _group = elem.group;
        _opUser = elem.opUser;
        _quitUser = elem.quitUser;
        _entrantUser = elem.entrantUser;
        _kickedUserList = elem.kickedUserList;
        _invitedUserList = elem.invitedUserList;
        _groupNewOwner = elem.groupNewOwner;
    }
}

@end
