#import <Foundation/Foundation.h>
#import "RangeSlider.h"

// import RCTEventDispatcher
#if __has_include(<React/RCTEventDispatcher.h>)
#import <React/RCTEventDispatcher.h>
#elif __has_include("RCTEventDispatcher.h")
#import "RCTEventDispatcher.h"
#else
#import "React/RCTEventDispatcher.h" // Required when used as a Pod in a Swift project
#endif
#import <React/UIView+React.h>
#import <React/RCTConvert.h>

#import "UIColor+fromHex.h"
#import "TTRangeSlider.h"

@implementation RangeSlider : UIView  {

    RCTEventDispatcher *_eventDispatcher;

    // private properties to be mapped to the right prop
    // @todo: add as max as possible of properties
    float _minValue;
    float _maxValue;
    float _selectedMinimum;
    float _selectedMaximum;
    NSString *myPrefix;
    NSString *mySuffix;


    UIView *_childView;
    UISlider *_slider;
    TTRangeSlider *_rangeSlider;

}

- (void)logControlEvent:(TTRangeSlider *)sender {
    // NSLog(@"Min Value: %.0f Max Value: %.0f", sender.selectedMinimum, sender.selectedMaximum);
    _selectedMinimum = sender.selectedMinimum;
    _selectedMaximum = sender.selectedMaximum;

    [_eventDispatcher sendInputEventWithName:@"onChange" body:@{
                                                                @"selectedMinimum": [NSNumber numberWithInt:_selectedMinimum],
                                                                @"selectedMaximum": [NSNumber numberWithInt:_selectedMaximum],
                                                                @"target": self.reactTag
                                                                }];

}

- (void)setMinValue:(float)minValue{
    // this if condition is needed to avoid setting a random value(content of memory)
    if(minValue != _minValue){
        _minValue = minValue;
        // NSLog(@"minValue set %f", minValue);
        [_rangeSlider setMinValue: minValue];
    }
}
- (void)setMaxValue:(float)maxValue{
    if(maxValue != _maxValue){
        _maxValue = maxValue;
        [_rangeSlider setMaxValue: maxValue];
    }
}
- (void)setSelectedMinimum:(float)selectedMinimum{
    if(selectedMinimum != _selectedMinimum){
        _selectedMinimum = selectedMinimum;
        [_rangeSlider setSelectedMinimum: selectedMinimum];
    }
}
- (void)setSelectedMaximum:(float)selectedMaximum{
    if(selectedMaximum != _selectedMaximum){
        _selectedMaximum = selectedMaximum;
        [_rangeSlider setSelectedMaximum: selectedMaximum];
    }
}

- (void) setTintColor:(NSString *)tintColor
{
    UIColor *color = [UIColor colorwithHexString:tintColor alpha:1];
    [_rangeSlider setTintColor:color];
}
- (void) setTintColorBetweenHandles:(NSString *)tintColorBetweenHandles
{
    UIColor *color = [UIColor colorwithHexString:tintColorBetweenHandles alpha:1];
    [_rangeSlider setTintColorBetweenHandles:color];
}
- (void) setHandleBorderColor:(NSString *)handleBorderColor{
    UIColor *color = [UIColor colorwithHexString:handleBorderColor alpha:1];
    [_rangeSlider setHandleBorderColor:color];
}
- (void) setHandleBorderWidth:(float)handleBorderWidth{
    [_rangeSlider setHandleBorderWidth: handleBorderWidth];
}
- (void) setMinLabelColour:(NSString *)minLabelColour
{
    UIColor *color = [UIColor colorwithHexString:minLabelColour alpha:1];
    [_rangeSlider setMinLabelColour:color];
}
- (void) setMaxLabelColour:(NSString *)maxLabelColour
{
    UIColor *color = [UIColor colorwithHexString:maxLabelColour alpha:1];
    [_rangeSlider setMaxLabelColour:color];
}
- (void) setHandleColor:(NSString *)handleColor
{
    UIColor *color = [UIColor colorwithHexString:handleColor alpha:1];
    [_rangeSlider setHandleColor:color];
}
- (void) setLineHeight:(float)lineHeight
{
    [_rangeSlider setLineHeight:lineHeight];
}
- (void) setLineBorderWidth:(float)lineBorderWidth{
    [_rangeSlider setLineBorderWidth:lineBorderWidth];
}
- (void) setLineBorderColor:(NSString *)lineBorderColor{
    UIColor *color = [UIColor colorwithHexString:lineBorderColor alpha:1];
    [_rangeSlider setLineBorderColor:color];
}
- (void) setPreffix:(NSString *)preffix
{
    myPrefix = preffix;
    NSNumberFormatter *customFormatter = [[NSNumberFormatter alloc] init];
    customFormatter.positivePrefix = preffix;
    if(mySuffix){
        customFormatter.positiveSuffix = mySuffix;
    }
    // _rangeSlider.numberFormatterOverride = customFormatter;
    [_rangeSlider setNumberFormatterOverride: customFormatter];
}
- (void) setSuffix:(NSString *)suffix{
    mySuffix = suffix;
    NSNumberFormatter *customFormatter = [[NSNumberFormatter alloc] init];
    customFormatter.positiveSuffix = suffix;
    if(myPrefix){
        customFormatter.positivePrefix = myPrefix;
    }

    // _rangeSlider.numberFormatterOverride = customFormatter;
    [_rangeSlider setNumberFormatterOverride: customFormatter];
}
- (void) setHandleDiameter:(float)handleDiameter{
    [_rangeSlider setHandleDiameter:handleDiameter];
}
- (void)setDisableRange:(BOOL)disableRange{
    [_rangeSlider setDisableRange:disableRange];
}
- (void)setHideLabels:(BOOL)hideLabels{
    if(hideLabels){
        [_rangeSlider setHideLabels: YES];
    }
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
    if ((self = [super init])) {
        _eventDispatcher = eventDispatcher;

        CGRect frame = CGRectMake(0.0, 0.0, 200.0, 10.0);
        _slider = [[UISlider alloc] initWithFrame:frame];
        [_slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];

        [_slider setBackgroundColor:[UIColor clearColor]];
        _slider.minimumValue = 0.0;
        _slider.maximumValue = 50.0;
        _slider.continuous = YES;
        _slider.value = 25.0;


        _rangeSlider = [[TTRangeSlider alloc] initWithFrame:CGRectZero];
        _rangeSlider.minValue = _minValue ? _minValue:0;
        _rangeSlider.maxValue = _maxValue ? _maxValue:100;
        _rangeSlider.selectedMinimum = _selectedMinimum;
        _rangeSlider.selectedMaximum = _selectedMaximum;

        // _rangeSlider.minDistance = -1; // distance between selectedMin_selected_max
        // _rangeSlider.handleColor = [UIColor colorWithRed:0.23 green:0.75 blue:0.43 alpha:1.0];
        // _rangeSlider.tintColorBetweenHandles = [UIColor colorWithRed:0.23 green:0.75 blue:0.43 alpha:1.0];
        // _rangeSlider.tintColor = [UIColor whiteColor];
        // _rangeSlider.handleBorderColor = [UIColor blueColor];
        // _rangeSlider.lineHeight = 2.0;


        [_rangeSlider addTarget:self action:@selector(logControlEvent:) forControlEvents:UIControlEventValueChanged];

        _childView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 50, 50))];
        // _childView.backgroundColor = [UIColor whiteColor];

    }

    return self;
}

-(void)rangeSlider:(TTRangeSlider *)sender didChangeSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum{

}

- (void)rangeSliderValueDidChange:(TTRangeSlider *)slider {
    // NSLog(@"%0.2f - %0.2f", slider.selectedMinimum, slider.selectedMaximum);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _childView.frame = self.bounds;
    _rangeSlider.frame = self.bounds;
    [self addSubview: _childView];
    [self addSubview: _rangeSlider];
    // [_childView addSubview:_rangeSlider];

}
@end


