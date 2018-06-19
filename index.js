//  Created by react-native-create-bridge
import React, { Component } from 'react'
import {
  requireNativeComponent,
  NativeModules,
} from 'react-native'
import PropTypes from 'prop-types';

const MyRangeSlider = requireNativeComponent('RangeSlider', RangeSlider)

export default class RangeSlider extends Component {
  render () {
    return <MyRangeSlider
      {...this.props}
      onChange={(e)=>{
        // e.nativeEvents contains:
        // - selectedMinimum
        // - selectedMaximum
        if(this.props.onChange){
          this.props.onChange(e.nativeEvent);
        }
      }}
    />
  }
}

RangeSlider.propTypes = {
  minValue: PropTypes.number,
  maxValue: PropTypes.number,
  selectedMinimum: PropTypes.number,
  selectedMaximum: PropTypes.number,
}
