//
//  CRIMAttachedInfoElem.m
//  CRIMSDK
//
//  Created by tom on 2023/3/18.
//

#import "CRIMAttachedInfoElem.h"
#import <MJExtension/MJExtension.h>

@implementation CRIMGroupHasReadInfo

@end

@implementation CRIMUploadProgress

@end

@implementation CRIMAttachedInfoElem

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"messageEntityList" : [CRIMMessageEntity class]};
}

@end
