//
//  AppDelegate.m
//  DeepCopy
//
//  Created by haifeng on 2022/1/18.
//

#import "AppDelegate.h"
#import "Person.h"
@interface AppDelegate ()
@property (strong, nonatomic) NSString *string;
@property (strong, nonatomic) NSMutableString *mutableString;
@property (strong, nonatomic) NSArray *array;
@property (strong, nonatomic) NSMutableArray *mutableArray;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSArray *arrayObj = @[@"11111"];
    NSArray *arrayObjCopy = [[NSArray alloc]initWithArray:arrayObj copyItems:YES];
    NSLog(@"arr_obj 地址：%p",arrayObj.firstObject);
    NSLog(@"arrayObjCopy arr_obj 地址：%p",arrayObjCopy.firstObject);
    arrayObj = @[[Person new]];
    /// 方法1
    NSArray *arrayPersonCopy = [[NSArray alloc]initWithArray:arrayObj copyItems:YES];
    NSLog(@"person 地址：%p",arrayObj.firstObject);
    NSLog(@"arrayPersonCopy person 地址：%p",arrayPersonCopy.firstObject);
    /// 方法2
    NSArray *arrayPersonCopy1 = [NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:[Person class] fromData:[NSKeyedArchiver archivedDataWithRootObject:arrayObj requiringSecureCoding:YES error:nil] error:nil];
    NSLog(@"arrayPersonCopy1 person 地址：%p",arrayPersonCopy1.firstObject);
    Person *personCopy = [arrayObj.firstObject copy];
    Person *personMutableCopy = [arrayObj.firstObject mutableCopy];
    NSLog(@"personCopy 地址：%p",personCopy);
    NSLog(@"personMutableCopy 地址：%p",personMutableCopy);
//    self.mutableArray = [NSMutableArray arrayWithArray:@[@"123"]];
//    NSLog(@"mutableArray 指向的 对象内存地址为：%p",self.mutableArray);
//    NSLog(@"mutableArrayCopy 指向的 对象内存地址为：%p",[self.mutableArray copy]);
//    NSLog(@"mutableArrayMutableCopy 指向的 对象内存地址为：%p",[self.mutableArray mutableCopy]);
    
//    self.array = @[@"1",@"2",@"3"];
//    NSLog(@"array 指向的 对象内存地址为：%p",self.array);
//    NSLog(@"arrayCopy 指向的 对象内存地址为：%p",[self.array copy]);
//    NSLog(@"arrayMutableCopy 指向的 对象内存地址为：%p",[self.array mutableCopy]);
    
//    self.mutableString = [NSMutableString stringWithString:@"2"];
//    NSLog(@"mutableString 指向的 对象内存地址为：%p",self.mutableString);
//    NSLog(@"mutableStringCopy 指向的 对象内存地址为：%p",[self.mutableString copy]);
//    NSLog(@"mutableStringMutableCopy 指向的 对象内存地址为：%p",[self.mutableString mutableCopy]);
    
//    self.string = @"1";
//    NSLog(@"string 指向的 对象内存地址为：%p",self.string);
//    NSLog(@"stringCopy 指向的 对象内存地址为：%p",[self.string copy]);
//    NSLog(@"stringMutableCopy 指向的 对象内存地址为：%p",[self.string mutableCopy]);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
