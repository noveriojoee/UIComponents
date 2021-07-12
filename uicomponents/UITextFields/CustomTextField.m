//
//  CustomTextField.m
//  uicomponents
//
//  Created by Noverio Joe on 12/07/21.
//
//

#import "CustomTextField.h"

@interface CustomTextField()

@end

@implementation CustomTextField
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self registerDoneButton];
    CGFloat currentFontSize = self.font.pointSize;
    self.font = [UIFont fontWithName:@"Lato" size:currentFontSize];
}

-(void)bind: (void(^)(NSString *value)) callback{
    self.onFormValueChanged = callback;
    [self addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
    
}

-(void)bindOnEndValueChange: (void(^)(NSString *value)) callback{
    self.onEndValueChanged = callback;
    [self addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)registerDoneButton{
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self action:@selector(endEditingKeyboard:)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    keyboardToolbar.items = @[space,doneBarButton];
    self.inputAccessoryView = keyboardToolbar;
}

- (void)endEditingKeyboard:(UIPanGestureRecognizer *)recognizer{
//    self.onFormEndChange(self.text);
    [self.superview endEditing:YES];
}

- (void)textFieldDidChanged : (UITextField*) textField{
    if (self.onFormValueChanged != nil){
        self.onFormValueChanged(self.text);
    }
}
-(void)textFieldDidEndEditing:(UITextField*)textField{
    if (self.onEndValueChanged != nil){
        self.onEndValueChanged(self.text);
    }
}

-(void)setText:(NSString *)text{
    [super setText:text];
    if (self.onFormValueChanged != nil){
        self.onFormValueChanged(text);
    }
}

@end
