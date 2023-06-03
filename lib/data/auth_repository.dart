import 'package:how_cagri_work_on_flutter/data/auth_api_client.dart';
import 'package:how_cagri_work_on_flutter/locator.dart';
import 'package:how_cagri_work_on_flutter/models/kipss_user.dart';

class AuthRepository {
  final AuthApiClient _authApiClient = getIt<AuthApiClient>();

  Future<KipssUser?> loginWithGoogle() async {
    return await _authApiClient.socialLogin(isGoogle: true);
  }

  Future<KipssUser?> loginWithApple() async {
    return await _authApiClient.socialLogin(isGoogle: false);
  }
}
