
#import <UIKit/UIKit.h>
#import "FSRefreshConstants.h"

NS_ASSUME_NONNULL_BEGIN

@interface FSRefreshHeaderView : UIView

/**
 标记是否开始监控 UIScrollView 的相关属性, 默认为 NO.
 */
@property (nonatomic, assign) BOOL observing;

/**
 `开始刷新` 的动作回调Block, 默认为 nil.
 */
@property (nonatomic, copy, nullable) FSRefreshHandler actionHandler;

/**
 刷新成功的提示文本, 如果设置为 nil 则隐藏成功提示, 默认为 nil.
 */
@property (nonatomic, copy, nullable) NSString *successText;

/**
 刷新失败的提示文本, 如果设置为 nil 则隐藏失败提示, 默认为 nil.
 */
@property (nonatomic, copy, nullable) NSString *failText;

/**
 刷新控件的顶部偏移量, 默认为 0.
 */
@property (nonatomic, assign) CGFloat topEdge;

/**
 刷新控件当前的状态, 默认为 `FSRefreshStateStopped`.
 */
@property (nonatomic, assign, readonly) FSRefreshState state;

@end

NS_ASSUME_NONNULL_END
