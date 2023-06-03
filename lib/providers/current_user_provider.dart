import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:how_cagri_work_on_flutter/models/kipss_user.dart';

class CurrentUserNotifier extends StateNotifier<KipssUser?> {
  CurrentUserNotifier() : super(null);

  final storage = const FlutterSecureStorage();

  Future initUser() async {
    String? userID = await storage.read(key: 'userID');
    if (userID == null) {
      state = null;
      return null;
    }

    state = KipssUser();
    //TODO: fetch user
  }
}

final currentUserProvider =
    StateNotifierProvider<CurrentUserNotifier, KipssUser?>((ref) {
  return CurrentUserNotifier();
});
