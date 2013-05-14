//
//  KeyboardDriver.h
//  AirturnPedalInput
//
//  Created by Arend Jan Kramer on 29-12-11.
//  Copyright (c) 2011 Arend Jan Kramer. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kLeftButtonPressed   @"LeftButtonPressed"
#define kRightButtonPressed  @"RightButtonPressed"

@protocol AirturnPedalDelegate;

@protocol AirturnPedalDelegate <NSObject>
@optional
- (void)didReceiveInput:(NSString*)key;
@end

@interface AirturnPedalDriver : UIView <UITextViewDelegate>{
    id <AirturnPedalDelegate> _delegate;
    UIView *_inputView;
    UITextView *_input;
}

- (id)initWithDelegate:(id)dlg;
- (void)makeKeyboardFirstResponder;
- (void)startMonitoring;
- (void)stopMonitoring;

@property (nonatomic, assign) id <AirturnPedalDelegate> delegate;

@end
