import 'package:flutter/material.dart';

class MSize {
  BuildContext? ccontext;
  double? width;
  double? height;

  static final MSize _mSize = MSize._internal();

  MSize._internal();

  factory MSize({BuildContext? fetchedContext, bool? isTesting}) {
    if (isTesting != null) {
      _mSize.width = 600;
      _mSize.height = 1200;
    } else {
      if (fetchedContext != null) {
        _mSize.ccontext = fetchedContext;
      } else {}
      if (_mSize.width == null && _mSize.height == null) {
        if (_mSize.ccontext != null) {
          _mSize.width = MediaQuery.of(_mSize.ccontext!).size.width;
          _mSize.height = MediaQuery.of(_mSize.ccontext!).size.height;
        }
      }
    }

    return _mSize;
  }
}
