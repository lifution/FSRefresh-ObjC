
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (FSRefresh)

- (void)fsrefresh_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

- (void)fsrefresh_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

@end

NS_ASSUME_NONNULL_END
