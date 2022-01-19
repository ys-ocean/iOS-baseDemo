//
//  Person.h
//  DeepCopy
//
//  Created by haifeng on 2022/1/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject <NSCopying, NSMutableCopying, NSSecureCoding>
@property (copy, nonatomic) NSString *name;
@end

NS_ASSUME_NONNULL_END
