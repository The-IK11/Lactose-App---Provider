import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier{

 double _slidervalue=0.5;

 double get sliderValue=>_slidervalue;

 void setSliderValue(double value){
  _slidervalue=value;
  notifyListeners();

 }

}