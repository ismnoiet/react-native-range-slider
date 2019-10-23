#import "RNRangeSliderManager.h"
#import "RNRangeSlider.h"

#import <React/RCTBridge.h>

@implementation RNRangeSliderManager

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE(RangeSlider)

- (UIView *)view
{
  return [[RNRangeSlider alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
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

@end

