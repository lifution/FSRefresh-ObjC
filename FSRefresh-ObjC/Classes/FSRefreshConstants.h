
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void(^FSRefreshHandler)(void);

typedef NS_ENUM(NSUInteger, FSRefreshState) {
    FSRefreshStateStopped = 0,      // 停止状态
    FSRefreshStateDragging,         // 正在滑动, 但是还没到达可以刷新的位置
    FSRefreshStateRefreshing,       // 正在刷新
    FSRefreshStateCanRefreshing,    // 正在滑动, 已经到达可以刷新的位置
    FSRefreshStateEndingRefreshing, // 正在停止刷新的过程中
    FSRefreshStateNoMoreData,       // 没有更多数据 (该状态一般用于尾部刷新)
};

@interface FSRefreshConstants : NSObject

/// MARK: kvo keypaths.
@property (class, nonatomic, readonly) NSString *contentInset;
@property (class, nonatomic, readonly) NSString *contentOffset;
@property (class, nonatomic, readonly) NSString *contentSize;

/// MARK: Constants.
@property (class, nonatomic, readonly) NSTimeInterval animationDuration;
@property (class, nonatomic, readonly) CGFloat headerHeight;
@property (class, nonatomic, readonly) CGFloat headerMinOffsetToRefresh;
@property (class, nonatomic, readonly) CGFloat footerHeight;
@property (class, nonatomic, readonly) CGFloat footerMinOffsetToRefresh;
@property (class, nonatomic, readonly) CGFloat footerAutoMinOffset;

@end

