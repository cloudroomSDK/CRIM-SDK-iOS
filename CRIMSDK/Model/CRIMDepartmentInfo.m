//
//  CRIMDepartmentInfo.m
//  CRIMSDK
//
//  Created by tom on 2023/5/13.
//

#import "CRIMDepartmentInfo.h"
#import <MJExtension/MJExtension.h>

@implementation CRIMDepartmentMemberInfo

+ (NSDictionary *)mj_objectClassInArray {
    
    return @{@"parentDepartmentList" : [CRIMDepartmentInfo class]};
};

@end


@implementation CRIMDepartmentInfo

@end

@implementation CRIMUserInDepartmentInfo


@end

@implementation CRIMDepartmentMemberAndSubInfo


+ (NSDictionary *)mj_objectClassInArray {
    
    return @{@"departmentList" : [CRIMDepartmentInfo class],
             @"departmentMemberList": [CRIMDepartmentMemberInfo class]
    };
}

@end


