
#import "FSRefreshConstants.h"

@implementation FSRefreshConstants

/// MARK: kvo keypaths.

+ (NSString *)contentInset
{
    return @"contentInset";
}

+ (NSString *)contentOffset
{
    return @"contentOffset";
}

+ (NSString *)contentSize
{
    return @"contentSize";
}

/// MARK: Constants.

+ (NSTimeInterval)animationDuration
{
    return 0.25;
}

+ (CGFloat)headerHeight
{
    return 50.0;
}

+ (CGFloat)headerMinOffsetToRefresh
{
    return self.headerHeight;
}

+ (CGFloat)footerHeight
{
    return 50.0;
}

+ (CGFloat)footerMinOffsetToRefresh
{
    return self.footerHeight;
}

+ (CGFloat)footerAutoMinOffset
{
    return 50.0;
}

@end
