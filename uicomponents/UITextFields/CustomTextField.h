//
//  CustomTextField.h
//  uicomponents
//
//  Created by Noverio Joe on 12/07/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTextField : UITextField
@property (nonatomic, copy) void (^onFormValueChanged)(NSString*);

-(void)bind : (void(^)(NSString *value)) callback;
@end

NS_ASSUME_NONNULL_END
