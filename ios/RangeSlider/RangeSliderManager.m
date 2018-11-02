#import <Foundation/Foundation.h>
#import "RangeSlider.h"
#import "RangeSliderManager.h"

// import RCTBridge
#if __has_include(<React/RCTBridge.h>)
#import <React/RCTBridge.h>
#elif __has_include("RCTBridge.h")
#import "RCTBridge.h"
#else
#import "React/RCTBridge.h" // Required when used as a Pod in a Swift project
#endif

@implementation RangeSliderManager

@synthesize bridge = _bridge;

// Export a native module
RCT_EXPORT_MODULE();

// Return the native view that represents your React component
- (UIView *)view
{
    return [[RangeSlider alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

RCT_EXPORT_VIEW_PROPERTY(minValue, float)
RCT_EXPORT_VIEW_PROPERTY(maxValue, float)
RCT_EXPORT_VIEW_PROPERTY(selectedMinimum, float)
RCT_EXPORT_VIEW_PROPERTY(selectedMaximum, float)
RCT_EXPORT_VIEW_PROPERTY(tintColor, NSString);
RCT_EXPORT_VIEW_PROPERTY(tintColorBetweenHandles, NSString);
RCT_EXPORT_VIEW_PROPERTY(handleBorderColor, NSString);
RCT_EXPORT_VIEW_PROPERTY(handleBorderWidth, float);
RCT_EXPORT_VIEW_PROPERTY(handleColor, NSString);
RCT_EXPORT_VIEW_PROPERTY(handleDiameter, float);
RCT_EXPORT_VIEW_PROPERTY(minLabelColour, NSString);
RCT_EXPORT_VIEW_PROPERTY(maxLabelColour, NSString);
RCT_EXPORT_VIEW_PROPERTY(lineHeight, float);
RCT_EXPORT_VIEW_PROPERTY(lineBorderWidth, float);
RCT_EXPORT_VIEW_PROPERTY(lineBorderColor, NSString);
RCT_EXPORT_VIEW_PROPERTY(preffix, NSString);
RCT_EXPORT_VIEW_PROPERTY(suffix, NSString);
RCT_EXPORT_VIEW_PROPERTY(disableRange, BOOL);
RCT_EXPORT_VIEW_PROPERTY(hideLabels, BOOL);

// @todo
// RCT_EXPORT_VIEW_PROPERTY(minLabelFont, NSString);
// RCT_EXPORT_VIEW_PROPERTY(maxLabelFont, NSString);
// RCT_EXPORT_VIEW_PROPERTY(labelPadding, float);
@end