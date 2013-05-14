//
//  KeyboardDriver.m
//  AirturnPedalInput
//

#import "AirturnPedalDriver.h"

@implementation AirturnPedalDriver {
    BOOL isMonitoringAirturn;
}

- (id)initWithDelegate:(id)delegate{
    self = [super init];
	if (self){
        _delegate = delegate;
        _inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        _input = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [_input setInputView:_inputView];
        [self addSubview:_input];
        [_input setText:@"-"];
        _input.delegate = self;
        isMonitoringAirturn = NO;
	}
	return self;
}
- (void)startMonitoring{
    [self makeKeyboardFirstResponder];
    isMonitoringAirturn = YES;
    NSLog(@"Monitoring Airturn: started");
}
- (void)stopMonitoring{
    [_input resignFirstResponder];
    isMonitoringAirturn = NO;
    NSLog(@"Monitoring Airturn: stopped");
}
- (void)resetSelectedRange{
    isMonitoringAirturn = NO;
    NSRange range = {_input.text.length/2,0};
    [_input setSelectedRange:range];
    isMonitoringAirturn = YES;
}
- (void)textViewDidChangeSelection:(UITextView *)textView{
    if (!isMonitoringAirturn)
        return;
    if (![textView isFirstResponder])
        return;
    switch (textView.selectedRange.location) {
        case 0:
            if ([_delegate respondsToSelector:@selector(didReceiveInput:)])
                [_delegate performSelector:@selector(didReceiveInput:) withObject:kLeftButtonPressed];
            break;
            
        case 1:
            if ([_delegate respondsToSelector:@selector(didReceiveInput:)])
                [_delegate performSelector:@selector(didReceiveInput:) withObject:kRightButtonPressed];
            break;
            
        default:
            NSLog(@"Unhandled text range:{%@,%@}",@(textView.selectedRange.location),@(textView.selectedRange.length));
            break;
    }
    [self resetSelectedRange];
}
- (void)makeKeyboardFirstResponder{
    [_input resignFirstResponder];
    if (![_input becomeFirstResponder]){
        [self performSelector:@selector(makeKeyboardFirstResponder) withObject:nil afterDelay:0.3];
        NSLog(@"Monitoring Airturn: failed to start, attempting again");
    }
}

@end
