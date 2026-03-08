import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier{


 int _counter=0;

 int get counter=> _counter;

 void incrementCouneter(){
    _counter++;
    notifyListeners();
 }

 void decrementCounter(){
  _counter--;
  notifyListeners();
 }


}