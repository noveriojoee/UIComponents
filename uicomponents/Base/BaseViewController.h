//
//  BaseViewController.h
//  uicomponents
//
//  Created by Noverio Joe on 11/07/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
- (void)setViewControllerBackgroundWithImageName : (NSString*) imgName targetedView : (UIView*) targetView;
- (void)navBack:(id)sender;
- (void)registerSingleTapActionToView:(UIView*)view recognizer : (void(^)(UIGestureRecognizer*)) callback;
- (void)registerToolbarToTextField : (UITextField*) textField;
- (void)displayErrorWithMessage : (NSString*)errMsg;
- (void)displayLoadingByShimerringWithViews : (NSMutableArray<UIView*>*) views;
- (void)closeLoading;
@end

NS_ASSUME_NONNULL_END
