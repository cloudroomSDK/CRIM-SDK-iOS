//
//  CRIMLocationElem.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import "CRIMLocationElem.h"

@implementation CRIMLocationElem

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"desc" : @"description"};
}
@end
