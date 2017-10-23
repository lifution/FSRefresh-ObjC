
#import "NSObject+FSRefresh.h"
#import <objc/runtime.h>

@implementation NSObject (FSRefresh)

#pragma mark - Private

- (NSArray<NSDictionary<NSString *, NSObject *> *> *)fsrefresh_observers
{
    NSArray<NSDictionary<NSString *, NSObject *> *> *array = objc_getAssociatedObject(self, _cmd);
    if (!array) {
        array = [NSArray array];
        [self setFsrefresh_observers:array];
    }
    return array;
}

- (void)setFsrefresh_observers:(NSArray<NSDictionary<NSString *, NSObject *> *> *)array
{
    objc_setAssociatedObject(self, @selector(fsrefresh_observers), array, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - Public

- (void)fsrefresh_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath
{
    if (!observer || !keyPath) {
        NSAssert(NO, @"observer 和 keyPath 不可为 nil.");
        return;
    }
    
    NSDictionary *observerInfo = @{keyPath : observer};
    NSArray<NSDictionary<NSString *, NSObject *> *> *array = [self fsrefresh_observers];
    BOOL isNewAdd = YES;
    for (NSDictionary<NSString *, NSObject *> *item in array) {
        if ([item isEqual:observerInfo]) {
            isNewAdd = NO;
            break;
        }
    }
    if (isNewAdd) {
        [self addObserver:observer forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
        NSMutableArray<NSDictionary<NSString *, NSObject *> *> *latestArray = [array mutableCopy];
        [latestArray addObject:observerInfo];
        [self setFsrefresh_observers:latestArray];
    }
}

- (void)fsrefresh_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath
{
    if (!observer || !keyPath) {
        NSAssert(NO, @"observer 和 keyPath 不可为 nil.");
        return;
    }
    
    NSDictionary *observerInfo = @{keyPath : observer};
    NSArray<NSDictionary<NSString *, NSObject *> *> *array = [self fsrefresh_observers];
    BOOL isAdded = NO;
    for (NSDictionary<NSString *, NSObject *> *item in array) {
        if ([item isEqual:observerInfo]) {
            isAdded = YES;
            break;
        }
    }
    if (isAdded) {
        [self removeObserver:observer forKeyPath:keyPath];
        NSMutableArray<NSDictionary<NSString *, NSObject *> *> *latestArray = [array mutableCopy];
        [latestArray removeObject:observerInfo];
        [self setFsrefresh_observers:latestArray];
    }
}

@end
