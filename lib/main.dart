//import 'package:cr_logger/cr_logger.dart';
import 'package:cr_logger/cr_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:how_cagri_work_on_flutter/firebase_options.dart';
import 'package:how_cagri_work_on_flutter/locator.dart';
import 'package:how_cagri_work_on_flutter/providers/app_theme_provider.dart';
import 'package:how_cagri_work_on_flutter/theming/theming.dart';
import 'package:how_cagri_work_on_flutter/utils/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CRLoggerInitializer.instance.init(
    theme: ThemeData.light(),
    hiddenFields: [
      'token',
    ],
    logFileName: 'my_logs',
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(AppThemeProvider);

    return MaterialApp.router(
      title: 'How Cagri Work on Flutter',
      themeMode:
          appTheme == MThemeKeys.NIGHT ? ThemeMode.dark : ThemeMode.light,
      theme: MTheme.dayTheme,
      darkTheme: MTheme.nightTheme,
      routerConfig: router,
      builder: (context, child) => CrInspector(child: child!),
    );
  }
}
