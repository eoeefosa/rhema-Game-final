import 'package:flutter/material.dart';

class StoreProvider {
  int _addtimevalue = 2;
  int _hint = 2;
  final int _adswatchvalue = 50;
  int _clearWrongValue = 2;
  // TODO: PERSISTENT
  ValueNotifier usedHing = ValueNotifier(false);
  ValueNotifier useClearWrongValue = ValueNotifier(false);
  ValueNotifier addedtimer = ValueNotifier(false);

  void usehint() {
    if (_hint > 0) {
      usedHing.value = true;
      _hint--;
    }
    usedHing.value = false;
  }

  void calluseClearWrongValue() {
    if (_clearWrongValue > 0) {
      _clearWrongValue--;
      useClearWrongValue.value = true;
    }
    useClearWrongValue.value = false;
  }

  void addTime() {
    if (_addtimevalue > 2) {
      _addtimevalue--;
      addedtimer.value = true;
    }
    useClearWrongValue.value = false;
  }

  void callWatchAd() {}
}
