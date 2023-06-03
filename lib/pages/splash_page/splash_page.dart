import 'package:auto_route/auto_route.dart';
import 'package:cr_logger/cr_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:how_cagri_work_on_flutter/blocs/auth_bloc/bloc/auth_bloc.dart';
import 'package:how_cagri_work_on_flutter/build_type.dart';
import 'package:how_cagri_work_on_flutter/models/kipss_user.dart';
import 'package:how_cagri_work_on_flutter/pages/auth_page/auth_page.dart';
import 'package:how_cagri_work_on_flutter/pages/navigation_page/navigation_pages.dart';
import 'package:how_cagri_work_on_flutter/pages/stepper_page/stepper_page.dart';
import 'package:how_cagri_work_on_flutter/providers/current_user_provider.dart';
import 'package:how_cagri_work_on_flutter/theming/m_buttons.dart';
import 'package:how_cagri_work_on_flutter/theming/m_size.dart';
import 'package:how_cagri_work_on_flutter/theming/m_text_style.dart';
import 'package:how_cagri_work_on_flutter/theming/material_colors.dart';

@RoutePage()
class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});
  void initMComponents(BuildContext context) {
    MSize(fetchedContext: context);
    MTextStyle(fetchedContext: context);
    KipssColors(fetchedContext: context);
    MButton(fetchedContext: context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initMComponents(context);
    final isLoading = useState<bool>(true);

    final isLogged = useState<KipssUser?>(null);

    useEffect(() {
      // Activate Overlay Button if dev build
      if (isDevBuild) CRLoggerInitializer.instance.showDebugButton(context);
      ref.read(currentUserProvider.notifier).initUser().then((value) {
        isLoading.value = false;
        // ignore: invalid_use_of_protected_member
        if (ref.read(currentUserProvider.notifier).state != null) {
          // ignore: invalid_use_of_protected_member
          isLogged.value = ref.read(currentUserProvider.notifier).state;
        } else {
          isLogged.value = null;
        }
        return;
      });
      return null;
    }, []);

    return Container(
      color: Colors.purple,
      child: Center(
        child: isLoading.value
            ? const CircularProgressIndicator()
            : isLogged.value != null
                ? isLogged.value?.birthDate == null
                    ? const StepperPage()
                    : const NavigationPage()
                : BlocProvider(
                    create: (context) => AuthBloc(),
                    child: AuthPage(),
                  ),
      ),
    );
  }
}
