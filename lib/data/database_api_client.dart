import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:how_cagri_work_on_flutter/models/kipss_user.dart';

class DatabaseApiClient {
  Future<bool> coreSaveUser(KipssUser user) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.userId)
        .set(user.toJson());
    return true;
  }

  Future<KipssUser?> coreGetUser(String userID) async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection("users").doc(userID).get();
    return documentSnapshot.data() == null
        ? null
        : KipssUser.fromJson(
            (documentSnapshot.data()! as Map<String, dynamic>));
  }
}
