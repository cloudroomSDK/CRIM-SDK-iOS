//
//  CRIMMessageElem.m
//  CRIMSDK
//
//  Created by tom on 2023/7/15.
//

#import "CRIMMessageElem.h"
#import <MJExtension/MJExtension.h>

@implementation CRIMMessageEntity

@end

@implementation CRIMAdvancedTextElem

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"messageEntityList" : [CRIMMessageEntity class]};
}

@end

@implementation CRIMMessageElem

@end

@implementation CRIMTextElem

@end

@implementation CRIMCardElem

@end

@implementation CRIMTypingElem

@end
