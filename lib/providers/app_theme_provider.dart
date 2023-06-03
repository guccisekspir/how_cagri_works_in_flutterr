import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:how_cagri_work_on_flutter/theming/theming.dart';

class AppThemeNotifier extends StateNotifier<MThemeKeys>
    with WidgetsBindingObserver {
  AppThemeNotifier() : super(MThemeKeys.NIGHT) {
    _chooseTheme();
    WidgetsBinding.instance.addObserver(this);
  }

  void _chooseTheme() {
    if (mounted) {
      var brightness = WidgetsBinding.instance.window.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      setTheme(isDarkMode ? MThemeKeys.NIGHT : MThemeKeys.DAY);
    }
  }

  void setTheme(MThemeKeys key) async {
    if (key != state) {
      state = key;
      debugPrint(key.toString());
    }
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      _chooseTheme();
    }

    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

final AppThemeProvider =
    StateNotifierProvider<AppThemeNotifier, MThemeKeys>((ref) {
  return AppThemeNotifier();
});
