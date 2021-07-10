//
//  UIComponentsManager.m
//  uicomponents
//
//  Created by Noverio Joe on 11/07/21.
//

#import "UIComponentsInstances.h"
#import <Shimmer/FBShimmeringView.h>

@interface UIComponentsInstances()
@property NSString* bundleIdentifier;
@property NSBundle* uiFrameworkBundle;
@end

@implementation UIComponentsInstances
+ (id)sharedManager {
    static UIComponentsInstances *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(id)init {
    if ( self = [super init] ) {
        self.bundleIdentifier = @"com.gid.uicomponents";
        self.uiFrameworkBundle = [NSBundle bundleWithIdentifier:self.bundleIdentifier];
    }
    return self;
}

-(UIImage *)getImageIconWithName : (NSString*)strImageName{
    UIImage *result = [UIImage imageNamed:strImageName inBundle:[NSBundle bundleWithIdentifier:self.bundleIdentifier] compatibleWithTraitCollection:nil];
    
    return result;
}

-(void)loadingShimmerWithView : (UIView*)view{
    FBShimmeringView *shimmerView = [[FBShimmeringView alloc] initWithFrame:view.bounds];
    
    UIView *upperLayer = [[UIView alloc] initWithFrame:view.bounds];
    [upperLayer setBackgroundColor:[[UIColor grayColor]colorWithAlphaComponent:0.3f]];
    
    shimmerView.contentView = upperLayer;
//    shimmerView.shimmeringOpacity=0.2f;
    
    [view addSubview:shimmerView];
    
    // Start shimmering.
    shimmerView.shimmering = YES;
}



@end
