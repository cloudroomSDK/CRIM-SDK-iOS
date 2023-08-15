//
//  CRIMMergeElem.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import "CRIMMergeElem.h"
#import <MJExtension/MJExtension.h>
#import "CRIMMessageInfo.h"

@implementation CRIMMergeElem

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"multiMessage" : [CRIMMessageInfo class],
             @"messageEntityList" : [CRIMMessageEntity class]};
}

@end
