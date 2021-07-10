//
//  BaseViewController.m
//  uicomponents
//
//  Created by Noverio Joe on 11/07/21.
//

#import "BaseViewController.h"
#import "UIComponentsInstances.h"

@interface BaseViewController()
@property (nonatomic, copy) void (^singleTapRecognizer)(UITapGestureRecognizer*);
@end

@implementation BaseViewController

- (void)registerDoneButtonToAllTextField{
    for (id item in [self.view subviews]){
        if([item isKindOfClass:[UITextField class]]){
            [self registerToolbarToTextField:item];
        }else if([item isKindOfClass:[UITextView class]]){
            [self registerToolbarToTextView:item];
        }
    }
}

- (void)endEditingKeyboard:(UIPanGestureRecognizer *)recognizer{
    [self.view endEditing:YES];
}

- (void)registerSingleTapActionToView:(UIView*)view recognizer : (void(^)(UIGestureRecognizer*)) callback{
    self.singleTapRecognizer = callback;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(localSingleTapRecognizer:)];
    singleTap.numberOfTapsRequired = 1;
    [view addGestureRecognizer:singleTap];
}

- (void)registerToolbarToTextField : (UITextField*) textField{
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self action:@selector(endEditingKeyboard:)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    keyboardToolbar.items = @[space,doneBarButton];
    textField.inputAccessoryView = keyboardToolbar;
}

- (void)registerToolbarToTextView : (UITextView*) textView{
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self action:@selector(endEditingKeyboard:)];
    keyboardToolbar.items = @[doneBarButton];
    textView.inputAccessoryView = keyboardToolbar;
}

-(void)localSingleTapRecognizer : (UITapGestureRecognizer*)gesture{
    self.singleTapRecognizer(gesture);
}

- (void)setViewControllerBackgroundWithImageName : (NSString*) imgName targetedView : (UIView*) targetView{
    UIGraphicsBeginImageContext(targetView.frame.size);
    UIImage* targetImage = [UIComponentsInstances.sharedManager getImageIconWithName:imgName];
    [targetImage drawInRect:targetView.bounds];
    
    targetView.layer.contents = (__bridge id _Nullable)([targetImage CGImage]);
}

- (void)displayErrorWithMessage : (NSString*)errMsg{
    
}

- (void)displayLoading{
    
}

- (void)closeLoading{
    
}


@end
