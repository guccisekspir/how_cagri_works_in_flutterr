import 'package:flutter/material.dart';

class KipssColors {
  BuildContext? ccontext;
  ColorScheme? color;
  TextTheme? textTheme;

  static final KipssColors _materialColor = KipssColors._internal();

  KipssColors._internal();

  factory KipssColors({BuildContext? fetchedContext}) {
    if (fetchedContext != null) {
      _materialColor.ccontext = fetchedContext;
    } else {}
    if (_materialColor.color == null && _materialColor.textTheme == null) {
      if (_materialColor.ccontext != null) {
        _materialColor.color = Theme.of(fetchedContext!).colorScheme;
        _materialColor.textTheme = Theme.of(fetchedContext).textTheme;
      }
    }

    return _materialColor;
  }
}
