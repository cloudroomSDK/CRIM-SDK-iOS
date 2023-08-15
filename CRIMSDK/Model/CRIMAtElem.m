//
//  CRIMAtElem.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import "CRIMAtElem.h"
#import <MJExtension/MJExtension.h>

@import CRIMSDKCore;

@implementation CRIMAtInfo

@end

@implementation CRIMAtTextElem

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"atUsersInfo" : [CRIMAtInfo class]};
}

- (BOOL)isAtAll {
    return self.atUserList.count > 0 &&
    [self.atUserList.firstObject isKindOfClass:[NSString class]] &&
    [self.atUserList.firstObject isEqualToString:Crim_sdkGetAtAllTag([[NSUUID UUID]UUIDString])];
}

@end
