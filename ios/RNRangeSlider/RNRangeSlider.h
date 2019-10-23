#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>

@class RCTEventDispatcher;

@interface RNRangeSlider : UIView
// Define view properties here with @property
@property (nonatomic, assign) float minValue;
@property (nonatomic, assign) float maxValue;
@property (nonatomic, assign) float selectedMinimum;
@property (nonatomic, assign) float selectedMaximum;

@property (nonatomic, assign) NSString* tintColor;
@property (nonatomic, assign) NSString* tintColorBetweenHandles;
@property (nonatomic, assign) NSString* minLabelColour;
@property (nonatomic, assign) NSString* maxLabelColour;
@property (nonatomic, assign) NSString* handleColor;
@property (nonatomic, assign) NSString* handleBorderColor;
@property (nonatomic, assign) float handleDiameter;
@property (nonatomic, assign) float handleBorderWidth;
@property (nonatomic, assign) float lineHeight;
@property (nonatomic, assign) float lineBorderWidth;
@property (nonatomic, assign) NSString* lineBorderColor;
@property (nonatomic, assign) NSString* suffix;
@property (nonatomic, assign) NSString* preffix;
@property (nonatomic, assign) BOOL disableRange;
@property (nonatomic, assign) BOOL hideLabels;

@property (nonatomic, copy) RCTBubblingEventBlock onChange;



// Initializing with the event dispatcher allows us to communicate with JS
- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher NS_DESIGNATED_INITIALIZER;

@end
