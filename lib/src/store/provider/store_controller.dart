// import 'package:flutter/material.dart';

// class StoreProvider {
//   int _addtimevalue = 10;
//   int get addTimerValue => _addtimevalue;
//   int get clearWrongValue => _clearWrongValue;
//   int get adsWatchvalue => _adswatchvalue;
//   int get hint => _hint;
//   int _hint = 2;
//   final int _adswatchvalue = 50;
//   int _clearWrongValue = 2;

//   // TODO: PERSISTENT
//   ValueNotifier usedHing = ValueNotifier(false);
//   ValueNotifier useClearWrongValue = ValueNotifier(false);
//   ValueNotifier addedtimer = ValueNotifier(false);

//   void usehint() {
//     if (_hint > 0) {
//       usedHing.value = true;
//       _hint--;
//     }
//     usedHing.value = false;
//   }

//   void calluseClearWrongValue() {
//     if (_clearWrongValue > 0) {
//       _clearWrongValue--;
//       useClearWrongValue.value = true;
//     }
//     useClearWrongValue.value = false;
//   }

//   void addTime() {
//     print('add time called');
//     print('$_addtimevalue');
//     if (_addtimevalue > 0) {
//       _addtimevalue--;

//       addedtimer.value = true;
//     }
//     useClearWrongValue.value = false;
//   }

//   void callWatchAd() {}
// }
