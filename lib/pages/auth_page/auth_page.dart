//import 'package:cr_logger/cr_logger.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:how_cagri_work_on_flutter/blocs/auth_bloc/bloc/auth_bloc.dart';
import 'package:how_cagri_work_on_flutter/extensions/m_colors.dart';
import 'package:how_cagri_work_on_flutter/global/widgets/network_image.dart';
import 'package:how_cagri_work_on_flutter/theming/m_buttons.dart';
import 'package:how_cagri_work_on_flutter/theming/m_gap.dart';
import 'package:how_cagri_work_on_flutter/theming/m_size.dart';
import 'package:how_cagri_work_on_flutter/theming/m_text_style.dart';

@RoutePage()
class AuthPage extends HookConsumerWidget {
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MSize mSize = MSize();
    MGap mGap = MGap();
    final mColors = Theme.of(context).extension<MColors>()!;

    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        if (state is AuthLoadedState) {
          if (state.user.userId != null) {
            context.go('/auth');
          }
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorCode)));
        } else if (state is AuthLoadingState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Loading')));
        }
      },
      child: Scaffold(
        body: Container(
          color: mColors.bgColor,
          width: mSize.width,
          child: SafeArea(
            child: Padding(
              padding: mGap.horizontalPadding.padding,
              child: Column(
                children: [
                  Text(
                    'Welcome to \nHow Cagri Works App',
                    textAlign: TextAlign.center,
                    style: MTextStyle().h1.copyWith(color: mColors.brandColor),
                  ),
                  mGap.mediumGap,
                  Text(
                    "This app is a demo app for Cagri's Work style & behaviour",
                    textAlign: TextAlign.center,
                    style: MTextStyle()
                        .body1
                        .copyWith(color: mColors.bodyTextColor),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: mSize.height! * 0.4,
                    child: const MNetworkImage(
                        imageURL:
                            'https://static.wikia.nocookie.net/one-piece-isekai-dnd-by-rustage/images/b/bd/William_Shakespeare.png/revision/latest?cb=20220202220111'),
                  ),
                  const Spacer(),
                  MButton().BigButton(
                      onTap: () {
                        try {
                          authBloc.add(GoogleSign());
                        } catch (e) {
                          // log.e(e);
                        }
                      },
                      title: 'Login with Google',
                      isEnabled: true,
                      type: ButtonTypes.Primary),
                  mGap.mediumLargeGap,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
