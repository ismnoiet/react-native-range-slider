//  Created by react-native-create-bridge
import React, { Component } from 'react';
import {
  Text,
  requireNativeComponent,
  NativeModules,
  Platform,
  View,
} from 'react-native';
import PropTypes from 'prop-types';

const UnsupportedPlatform = () => (
  <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
    <Text style={{ fontSize: 16, fontWeight: 'bold' }}>Android is not supported yet!</Text>
  </View>
);
const MyRangeSlider = requireNativeComponent('RangeSlider', RangeSlider);

export default class RangeSlider extends Component {
  render () {
    return Platform.OS === 'ios' ?
      <MyRangeSlider
        {...this.props}
        onChange={(e) => {
          if (this.props.onChange) {
            this.props.onChange(e.nativeEvent);
          }
        }}
      /> :
      <UnsupportedPlatform />;
  }
}

RangeSlider.propTypes = {
  minValue: PropTypes.number,
  maxValue: PropTypes.number,
  selectedMinimum: PropTypes.number,
  selectedMaximum: PropTypes.number,
};
