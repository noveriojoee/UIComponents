//
//  UIComponentsManager.h
//  uicomponents
//
//  Created by Noverio Joe on 11/07/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ColouringUtilities.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIComponentsInstances : NSObject
+ (id)sharedManager;

-(UIImage *)getImageIconWithName : (NSString*)strImageName;
-(void)loadingShimmerWithView : (UIView*)view;


@end

NS_ASSUME_NONNULL_END
