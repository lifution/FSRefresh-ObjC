
#import "FSRefreshHeaderView.h"
#import "NSObject+FSRefresh.h"

@interface FSRefreshHeaderView ()

#pragma mark - UI


#pragma mark - Data

@property (nonatomic, assign, readwrite) FSRefreshState state;

@end

@implementation FSRefreshHeaderView

#pragma mark - Override

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

#pragma mark - Private

- (void)commonInit
{
    self.backgroundColor = UIColor.whiteColor;
    
    
}

@end
