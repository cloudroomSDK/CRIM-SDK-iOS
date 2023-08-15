//
//  CRIMSearchResultInfo.m
//  CRIMSDK
//
//  Created by tom on 2023/2/17.
//

#import "CRIMSearchResultInfo.h"
#import <MJExtension/MJExtension.h>
#import "CRIMMessageInfo.h"

@implementation CRIMSearchResultItemInfo

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"messageList" : [CRIMMessageInfo class]};
}

@end

@implementation CRIMSearchResultInfo

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"searchResultItems" : [CRIMSearchResultItemInfo class],
             @"findResultItems" : [CRIMSearchResultItemInfo class]
    };
}

@end

@implementation CRIMGetAdvancedHistoryMessageListInfo

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"messageList" : [CRIMMessageInfo class]};
}

@end
