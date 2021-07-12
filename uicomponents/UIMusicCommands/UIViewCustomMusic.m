

#import "UIViewCustomMusic.h"

@implementation UIViewCustomMusic
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        //We are in the storyboard code path. Initialize from the xib.
        self = [self initializeSubviews];
        
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self = [self initializeSubviews];
    }
    return self;
}

-(instancetype)initializeSubviews{
    NSBundle* bundle = [NSBundle bundleWithIdentifier:@"com.gid.uicomponents"];
    id view = [[bundle loadNibNamed:@"UIViewCustomMusic" owner:self options:nil] firstObject];
    return view;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
