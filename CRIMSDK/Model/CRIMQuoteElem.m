//
//  CRIMQuoteElem.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import "CRIMQuoteElem.h"

@implementation CRIMQuoteElem

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"messageEntityList" : [CRIMMessageEntity class]};
}

@end
