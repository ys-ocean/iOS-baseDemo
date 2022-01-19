//
//  Person.m
//  DeepCopy
//
//  Created by haifeng on 2022/1/18.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
// MARK: NSCopying,NSMutableCopying
- (id)copyWithZone:(NSZone *)zone {
    Person *person = [[Person allocWithZone:zone] init];
    /// 属性复制
    [[[self class] getPropertyNameList:[person class]] enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [person setValue:[self valueForKey:obj] forKey:obj];
    }];
    return person;
}
- (id)mutableCopyWithZone:(NSZone *)zone {
    Person *person = [[Person allocWithZone:zone] init];
    /// 属性复制
    [[[self class] getPropertyNameList:[person class]] enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [person setValue:[self valueForKey:obj] forKey:obj];
    }];
    return person;
}
// MARK: NSSecureCoding/NSCoding
/// 如果归档时requiringSecureCoding参数传的是YES的话
+ (BOOL)supportsSecureCoding {
    return YES;
}
- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [[[self class] getPropertyNameList:[self class]] enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [coder encodeObject:[self valueForKey:obj] forKey:obj];
    }];
}
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    if (self = [super init]) {
        [[[self class] getPropertyNameList:[self class]] enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self setValue:[coder decodeObjectForKey:obj] forKey:obj];
        }];
    }
    return  self;
}
// MARK: runtime获取属性列表
+ (NSArray *)getPropertyNameList:(Class)cls {
    NSMutableArray *propertyNameListArray = [NSMutableArray array];
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList(cls, &count);
    for (NSInteger i = 0 ; i < count; i ++) {
        const char *propertyCharName = property_getName(properties[i]);
        NSString *propertyOCName = [NSString stringWithFormat:@"%s",propertyCharName];
        [propertyNameListArray addObject:propertyOCName];
    }
    return [propertyNameListArray copy];
}
@end
